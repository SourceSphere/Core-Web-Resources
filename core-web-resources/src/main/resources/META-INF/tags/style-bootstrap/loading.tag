<%@ tag language="java" pageEncoding="ISO-8859-1"%>

<!-- TAGLIB's -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://sourcesphere.com.br/jsp/tags/rs" prefix="rs" %>

<!-- ATRIBUTOS -->
<%@ attribute name="id" required="true" %>
<%@ attribute name="align" required="false" %>
<%@ attribute name="width" required="false" %>
<%@ attribute name="height" required="false" %>

<!-- URL's -->
<c:url value="/webresources/img/loading.gif" var="loading"/>

<!-- Sourcesphere dependencies import/check -->
<rs:importDependencies/>
<rs:verifyResourceServlet/>

<!-- HTML -->
<div align="${align}">
<div id="${id}" class="alert alert-info fade in" style="width: ${width};height: ${height};">
  <button type="button" class="close" data-dismiss="alert">×</button>
  <strong>Aguarde</strong>
  <p>Carregando...&nbsp;<img src="${loading}"/></p>
</div>
</div>

<!-- JAVASCRIPT -->
<script type="text/javascript">
	$(document).ready(function()
	{
		$("#${id}").alert();
	});
</script>
