<%@ tag language="java" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://sourcesphere.com.br/jsp/tags/rs" prefix="rs" %>

<!-- ATRIBUTOS -->
<%@ attribute name="texto" required="true" %>
<%@ attribute name="tipo" required="true" description="Tipo do Alerta: label-succes | label-info | label-warning | label-important" %>
<%@ attribute name="align" required="false" %>
<%@ attribute name="fontSize" required="false" %>

<!-- Sourcesphere dependencies check -->
<rs:verifyResourceServlet/>

<!-- HTML -->
<div align="${align}">
	<span style="font-size: ${fontSize};" class="label ${tipo}">${texto}</span>
</div>
