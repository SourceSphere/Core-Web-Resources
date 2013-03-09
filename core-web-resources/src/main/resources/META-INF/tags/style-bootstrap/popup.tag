<%@ tag language="java" pageEncoding="ISO-8859-1"%>

<!-- TAGLIB's -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://sourcesphere.com.br/jsp/tags/rs" prefix="rs" %>

<!-- ATRIBUTOS -->
<%@ attribute name="identificador" required="true" type="java.lang.String" %>
<%@ attribute name="component" required="true" type="java.lang.String" %>
<%@ attribute name="titulo" required="false" type="java.lang.String" %>
<%@ attribute name="texto" required="false" type="java.lang.String" %>
<%@ attribute name="rodape" required="false" type="java.lang.String" %>
<%@ attribute name="imagem" required="false" type="java.lang.String" %>
<%@ attribute name="retornar" required="false" description="Exibir botão de retorno(valor = 'retornar')" type="java.lang.String" %>

<!-- POPUP -->
<div id="${identificador}" class="modal hide fade">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">x</button>
		<c:if test="${imagem != null}">
			<img src="${imagem}" width="40px" height="40px"/>
		</c:if>
		<h3 style="display: inline;vertical-align: bottom;">${titulo}</h3>
	</div>
	<div class="modal-body">
		<p>${texto}</p>
	</div>
	
	<div class="modal-footer">
		<c:if test="${retornar == 'retornar'}">
			<div class="pull-left">${rodape}</div>
			<a id="btnVoltar_${identificador}" href="#" class="btn btn-success"><b>Voltar</b></a>
		</c:if>
	</div>
	
</div>

<!-- SCRIPT -->
<script type="text/javascript">
	$(document).ready(function()
	{
		$('#${component}').click(function(event) 
		{
			$('#${identificador}').modal('toggle');
			$('#${identificador}').modal('show');
		});
		
		$('#btnVoltar_${identificador}').click(function(event) 
		{
			$('#${identificador}').modal('hide');
		});
		
	});
</script>