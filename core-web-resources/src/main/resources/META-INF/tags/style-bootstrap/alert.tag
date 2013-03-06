<%@ tag language="java" pageEncoding="ISO-8859-1"%>

<!-- TAGLIB's -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://sourcesphere.com.br/jsp/tags/rs" prefix="rs" %>

<!-- ATRIBUTOS -->
<%@ attribute name="id" required="true" %>
<%@ attribute name="titulo" required="true" %>
<%@ attribute name="texto" required="true" %>
<%@ attribute name="tipo" required="false" description="Tipo do Alerta: alert-success | alert-info | alert-warning" %>
<%@ attribute name="align" required="false" %>
<%@ attribute name="width" required="false" %>
<%@ attribute name="height" required="false" %>
<%@ attribute name="hidden" required="false" %>
<%@ attribute name="classe" required="false" %>

<!-- Sourcesphere dependencies check -->
<rs:verifyResourceServlet/>

<!-- HTML -->
<div align="${align}">
	<div id="${id}" class="alert ${tipo} fade in ${classe}" style="width: ${width};height: ${height};" ${hidden}>
	  <button type="button" class="close" data-dismiss="alert">×</button>
	  <strong>${titulo}</strong>
	  <p>${texto}</p>
	</div>
</div>

<!-- JAVASCRIPT -->
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#${id}").alert();
	});
</script>
