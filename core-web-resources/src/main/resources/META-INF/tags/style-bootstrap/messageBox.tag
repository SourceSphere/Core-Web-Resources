<%@tag import="java.util.HashMap"%>
<%@ tag language="java" pageEncoding="ISO-8859-1"%>

<!-- TAGLIB's -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://sourcesphere.com.br/jsp/tags/rs" prefix="rs" %>

<!-- ATRIBUTOS -->
<%@ attribute name="identificador" required="true" type="java.lang.String" %>
<%@ attribute name="tipo" required="true" description="Tipo de Alerta: success | information | question | alert" type="java.lang.String" %>
<%@ attribute name="titulo" required="false" type="java.lang.String" %>
<%@ attribute name="mensagem" required="false" type="java.lang.String" %>

<!-- URL's -->
<c:url value="/webresources/img/sucesso.png" var="success"/>
<c:url value="/webresources/img/info.png" var="information"/>
<c:url value="/webresources/img/pergunta.png" var="question"/>
<c:url value="/webresources/img/alerta.png" var="alert"/>

<!-- Sourcesphere dependencies check -->
<rs:verifyResourceServlet/>

<!-- ÍCONE DA MENSAGEM -->
<c:if test="${tipo == 'success'}">
	<c:set var="icone" value="${success}"/>
	<c:set var="label" value="label-success"/>
</c:if>
<c:if test="${tipo == 'information'}">
	<c:set var="icone" value="${information}"/>
	<c:set var="label" value="label-info"/>
</c:if>
<c:if test="${tipo == 'question'}">
	<c:set var="icone" value="${question}"/>
	<c:set var="label" value="label-warning"/>
</c:if>
<c:if test="${tipo == 'alert'}">
	<c:set var="icone" value="${alert}"/>
	<c:set var="label" value="label-important"/>
</c:if>


<!-- POPUP -->
<div id="${identificador}" class="modal hide fade">

	<div style="background-color: silver;" class="modal-header">
		<button class="close" data-dismiss="modal">x</button>
		<img src="${icone}" width="40px" height="40px"/>
		<h3 style="display: inline;vertical-align: bottom;">${titulo}</h3>
	</div>
	
	<div class="modal-body">
		<center>
			<span style="font-size: medium;" class="label ${label}">${mensagem}</span>
		</center>
		<p/><p/>
		<a id="btnOk" class="btn btn-inverse">OK</a>
	</div>
	
	<div style="background-color: silver;" class="modal-footer"></div>
	
</div>

<!-- SCRIPT -->
<script type="text/javascript">
	$(document).ready(function()
	{
		$('#btnOk').click(function(event) 
		{
			$('#${identificador}').modal('hide');
		});
	});
</script>