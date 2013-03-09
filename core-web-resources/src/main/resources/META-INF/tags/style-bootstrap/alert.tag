<%@ tag language="java" pageEncoding="ISO-8859-1"%>

<!-- TAGLIB's -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://sourcesphere.com.br/jsp/tags/rs" prefix="rs" %>

<!-- ATRIBUTOS -->
<%@ attribute name="identificador" required="true" type="java.lang.String" %>
<%@ attribute name="titulo" required="true" type="java.lang.String" %>
<%@ attribute name="texto" required="true" type="java.lang.String" %>
<%@ attribute name="tipo" required="false" description="Tipo do Alerta: alert-success | alert-info | alert-warning" type="java.lang.String" %>
<%@ attribute name="align" required="false" type="java.lang.String" %>
<%@ attribute name="width" required="false" type="java.lang.String" %>
<%@ attribute name="height" required="false" type="java.lang.String" %>
<%@ attribute name="hidden" required="false" type="java.lang.String" %>
<%@ attribute name="classe" required="false" type="java.lang.String" %>

<!-- HTML -->
<div align="${align}">
	<div id="${identificador}" class="alert ${tipo} fade in ${classe}" style="width: ${width};height: ${height};" ${hidden}>
	  <button type="button" class="close" data-dismiss="alert">×</button>
	  <strong>${titulo}</strong>
	  <p>${texto}</p>
	</div>
</div>

<!-- JAVASCRIPT -->
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#${identificador}").alert();
	});
</script>
