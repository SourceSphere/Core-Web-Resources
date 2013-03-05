<%@ tag language="java" pageEncoding="ISO-8859-1"%>

<%@ taglib tagdir="/src/main/resources/META-INF/tags" prefix="rs" %>

<!-- ATRIBUTOS -->
<%@ attribute name="texto" required="true" %>
<%@ attribute name="tipo" required="true" description="Tipo do Alerta: label-succes | label-info | label-warning | label-important" %>
<%@ attribute name="align" required="false" %>
<%@ attribute name="fontSize" required="false" %>

<!-- Verify if resource servlet has been loaded -->
<rs:verifyResourceServlet/>

<!-- HTML -->
<div align="${align}">
	<span style="font-size: ${fontSize};" class="label ${tipo}">${texto}</span>
</div>
