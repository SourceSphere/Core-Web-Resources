Core Web Resources
====================

Use this API to obtain web resources, like JQuery, JQuery-Mobile,
Twitter Bootstrap(multiple modifications),CKeditor, Metro-UI, and others....


In order to use it, you must map our servlet on your web app's web.xml, as shown below:

<!-- SOURCESPHERE SERVLET -->
<servlet>
	<servlet-name>webresources</servlet-name>
	<servlet-class>br.com.sourcesphere.corewebresources.servlet.ResourceServlet</servlet-class>
	<init-param>
		<param-name>cacheTimeout</param-name>
		<param-value>86400</param-value>
	</init-param>
	<load-on-startup>1</load-on-startup>
</servlet>

<servlet-mapping>
	<servlet-name>webresources</servlet-name>
	<url-pattern>/webresources/*</url-pattern>
</servlet-mapping>



OBS: The cache timeOut must be in seconds, and its not required. 
     The default value is the time in seconds of one entire day