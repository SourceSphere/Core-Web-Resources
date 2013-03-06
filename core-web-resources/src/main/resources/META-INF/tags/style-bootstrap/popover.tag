<%@ tag language="java" pageEncoding="ISO-8859-1"%>

<!-- TAGLIB's -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://sourcesphere.com.br/jsp/tags/rs" prefix="rs" %>

<!-- ATRIBUTOS -->
<%@ attribute name="identificador" required="true" type="java.lang.String" %>
<%@ attribute name="value" required="true" type="java.lang.String" %>
<%@ attribute name="classe" required="true" type="java.lang.String" %>
<%@ attribute name="titulo" required="true" type="java.lang.String" %>
<%@ attribute name="texto" required="true" type="java.lang.String" %>
<%@ attribute name="href" required="false" type="java.lang.String" %>
<%@ attribute name="position" required="false" description="top | bottom | right | left" type="java.lang.String" %>

<!-- Sourcesphere dependencies check -->
<rs:verifyResourceServlet/>

<!-- HTML -->
<c:choose>
	<c:when test="${href != null}">
		<a id="${identificador}" data-original-title="${titulo}" href="${href}" data-content="${texto}" class="${classe}" rel="popover">${value}</a>
	</c:when>
	<c:otherwise>
		<a id="${identificador}" data-original-title="${titulo}" data-content="${texto}" class="${classe}" rel="popover">${value}</a>
	</c:otherwise>
</c:choose>

<!-- JAVASCRIPT -->
<script type="text/javascript">
	$(document).ready(function()
	{
		var position = '${position}';
		if(position == "")
			position = 'right';
		$('#${identificador}').popover({placement:position});
	});
</script>
