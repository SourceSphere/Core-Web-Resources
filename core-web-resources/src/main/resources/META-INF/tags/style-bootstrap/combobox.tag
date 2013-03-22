<%@ tag language="java" pageEncoding="ISO-8859-1"%>

<!-- TAGLIBS -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- ATRIBUTOS -->
<%@ attribute name="identificador" required="false" type="java.lang.String" %>
<%@ attribute name="dados" required="true" type="java.util.List" %>
<%@ attribute name="converter" required="true" type="br.com.sourcesphere.core.converter.Converter" description="To use this, you need to import the sourcesphere-core artifact to the project"%>
<%@ attribute name="nome" required="false" type="java.lang.String" %>
<%@ attribute name="selecionado" required="false" type="java.lang.Object" %>

<!-- COMBOBOX HTML -->
<select id="${identificador}" class="combobox" name="${nome}">
	<option selected="selected">${converter.convertTo(selecionado)}</option>
	<c:forEach items="${dados}" var="dado">
		<option value="${converter.getValue(dado)}">${converter.convertTo(dado)}</option>
	</c:forEach>
</select>

<!-- COMBOBOX JAVASCRIPT -->
<script>
$(document).ready(function()
{
  	$('#${identificador}').combobox();
});
</script>