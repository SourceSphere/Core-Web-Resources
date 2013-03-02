package br.com.sourcesphere.corewebresources.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import br.com.sourcesphere.core.util.PathMatcher;
import br.com.sourcesphere.core.util.ResourcePathMatcher;

/**
 * Servlet for handling internal resources
 * In order to use this servlet, you must declare it on your web project's web.xml
 * <p>Ex:
 * <!-- SERVLET DO CORE-WEBRESOURCES -->
 *	<servlet>
 *		<servlet-name>webresources</servlet-name>
 *		<servlet-class>br.com.sourcesphere.corewebresources.servlet.ResourceServlet</servlet-class>
 *		<init-param>
 *			<param-name>cacheTimeout</param-name>
 *			<param-value>86400</param-value>
 *		</init-param>
 *		<load-on-startup>1</load-on-startup>
 *	</servlet>
 *	
 *	<servlet-mapping>
 *		<servlet-name>webresources</servlet-name>
 *		<url-pattern>/resources/*</url-pattern>
 *	</servlet-mapping>
 *
 * @author Guilherme Dio
 * @since 1.0.0
 */
public class ResourceServlet extends HttpServlet
{

	/**
	 * Generated SerialUID
	 */
	private static final long serialVersionUID = 1903756747780018646L;
	
	/**
	 * Logger
	 */
	private static final Logger log = Logger.getLogger(ResourceServlet.class);
	
	private static final String HTTP_CONTENT_LENGTH_HEADER = "Content-Length";
	private static final String HTTP_LAST_MODIFIED_HEADER = "Last-Modified";
	private static final String HTTP_EXPIRES_HEADER = "Expires";
	private static final String HTTP_CACHE_CONTROL_HEADER = "Cache-Control";
	
	/**
	 * Enable, or not, the file caching
	 * should be modified, using seconds, the default is one day in seconds
	 */
	private Integer cacheTimeout = 0;
	
	/**
	 * WEB-INF is not allowed
	 */
	private final String protectedPath = "/?WEB-INF/.*";
	
	/**
	 * The allowed paths
	 */
	private Set<String> allowedResourcePaths = new HashSet<String>();
	{
		allowedResourcePaths.add("/**/*.css");
		allowedResourcePaths.add("/**/*.gif");
		allowedResourcePaths.add("/**/*.ico");
		allowedResourcePaths.add("/**/*.jpeg");
		allowedResourcePaths.add("/**/*.jpg");
		allowedResourcePaths.add("/**/*.js");
		allowedResourcePaths.add("/**/*.png");
		allowedResourcePaths.add("META-INF/**/*.css");
		allowedResourcePaths.add("META-INF/**/*.gif");
		allowedResourcePaths.add("META-INF/**/*.ico");
		allowedResourcePaths.add("META-INF/**/*.jpeg");
		allowedResourcePaths.add("META-INF/**/*.jpg");
		allowedResourcePaths.add("META-INF/**/*.js");
		allowedResourcePaths.add("META-INF/**/*.png");
	};
	
	/**
	 * Resources mime types
	 */
	private Map<String,String> defaultMimeTypes = new HashMap<String,String>();
	{
		defaultMimeTypes.put(".css", "text/css");
		defaultMimeTypes.put(".gif", "image/gif");
		defaultMimeTypes.put(".ico", "image/vnd.microsoft.icon");
		defaultMimeTypes.put(".jpeg", "image/jpeg");
		defaultMimeTypes.put(".jpg", "image/jpeg");
		defaultMimeTypes.put(".js", "text/javascript");
		defaultMimeTypes.put(".png", "image/png");
	}
	
	/**
	 * Initiate the servlet with the init params
	 */
	@Override
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
		try
		{
			this.cacheTimeout = Integer.parseInt(config.getInitParameter("cacheTimeout"));
		}
		catch(Exception e)
		{
			log.warn("The cache timeout is valid, setting to default value",e);
			this.cacheTimeout = 86400;
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String resourcePath = request.getPathInfo();
		
		if (!isAllowed(resourcePath)) 
		{
			log.warn("An attempt to access a protected resource at " + resourcePath + " was disallowed.");
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		
		URL resource = ResourceServlet.class.getResource(resourcePath);
		if (resource == null) 
		{
			log.warn("Resource " + resourcePath + " not found.");
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		prepareResponse(response, resource, resourcePath);
		
		OutputStream out = response.getOutputStream();
		try 
		{
			URLConnection resourceConn = resource.openConnection();
			InputStream in = resourceConn.getInputStream();
			try 
			{
				byte[] buffer = new byte[1024];
				int bytesRead = -1;
				while ((bytesRead = in.read(buffer)) != -1) 
				{
					out.write(buffer, 0, bytesRead);
				}
			} 
			finally 
			{
				in.close();
			}
		} 
		finally 
		{
			out.close();
		}
	}
	
	/**
	 * Prepare the response
	 */
	private void prepareResponse(HttpServletResponse response, URL resource, String rawResourcePath) throws IOException 
	{
		long lastModified = -1;
		int contentLength = 0;
		String mimeType = null;
		URLConnection resourceConn = resource.openConnection();
		if (resourceConn.getLastModified() > lastModified) 
			lastModified = resourceConn.getLastModified();

		String currentMimeType = getServletContext().getMimeType(resource.getPath());
		if (currentMimeType == null) 
		{
			String extension = resource.getPath().substring(resource.getPath().lastIndexOf('.'));
			currentMimeType = (String) defaultMimeTypes.get(extension);
		}
		
		mimeType = currentMimeType;
		
		contentLength += resourceConn.getContentLength();

		response.setContentType(mimeType);
		response.setHeader(HTTP_CONTENT_LENGTH_HEADER, Long.toString(contentLength));
		response.setDateHeader(HTTP_LAST_MODIFIED_HEADER, lastModified);
		
		if(cacheTimeout > 0)
			configureCaching(response, cacheTimeout);
	}
	
	/**
	 * Check if the path can be accessed
	 * @param resourcePath
	 * @return
	 */
	private boolean isAllowed(String resourcePath) 
	{
		if (resourcePath.matches(protectedPath)) return false;
		PathMatcher pathMatcher = new ResourcePathMatcher();
		Iterator<String> allowedResourcePathsIt = allowedResourcePaths.iterator();
		while (allowedResourcePathsIt.hasNext()) 
		{
			String pattern = (String) allowedResourcePathsIt.next();
			if (pathMatcher.match(pattern, resourcePath)) 
				return true;
		}
		return false;
	}
	
	/**
	 * Set HTTP headers to allow caching for the given number of seconds.
	 * @param seconds number of seconds into the future that the response should be cacheable for
	 */
	private void configureCaching(HttpServletResponse response, Integer seconds) 
	{
		// HTTP 1.0 header
		response.setDateHeader(HTTP_EXPIRES_HEADER, System.currentTimeMillis() + seconds * 1000L);
		
		// HTTP 1.1 header
		response.setHeader(HTTP_CACHE_CONTROL_HEADER, "max-age=" + seconds);
	}
	
}
