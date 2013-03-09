<%@ tag language="java" pageEncoding="ISO-8859-1"%>

<!-- TAGLIB's -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://sourcesphere.com.br/jsp/tags/rs" prefix="rs" %>

<!-- ATRIBUTOS -->
<%@ attribute name="identificador" required="true" type="java.lang.String" %>
<%@ attribute name="align" required="false" type="java.lang.String" %>
<%@ attribute name="width" required="false" type="java.lang.String" %>
<%@ attribute name="height" required="false" type="java.lang.String" %>

<!-- URL's -->
<c:url value="/webresources/img/loading.gif" var="loading"/>

<!-- HTML -->
<div align="${align}">
<div id="${identificador}" class="alert alert-info fade in" style="width: ${width};height: ${height};">
  <button type="button" class="close" data-dismiss="alert">×</button>
  <strong>Aguarde</strong>
  <p>Carregando...&nbsp;<img src="${loading}"/></p>
</div>
</div>

<!-- JAVASCRIPT -->
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#${identificador}").alert();
	});
</script>
