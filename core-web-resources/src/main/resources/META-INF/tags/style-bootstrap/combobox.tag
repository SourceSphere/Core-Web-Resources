<%@ tag language="java" pageEncoding="ISO-8859-1"%>

<!-- TAGLIBS -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://sourcesphere.com.br/jsp/tags/rs" prefix="rs" %>

<!-- ATRIBUTOS -->
<%@ attribute name="identificador" required="false" type="java.lang.String" %>
<%@ attribute name="dados" required="true" type="java.util.List" %>
<%@ attribute name="converter" required="true" type="br.com.sourcesphere.core.converter.Converter" %>
<%@ attribute name="name" required="false" type="java.lang.String" %>
<%@ attribute name="selecionado" required="false" type="java.lang.String" %>

<!-- Sourcesphere dependencies check -->
<rs:verifyResourceServlet/>

<!-- COMBOBOX HTML -->
<select id="${identificador}" class="combobox" name="${nome}">
	<option selected="selected">${selecionado}</option>
	<c:forEach items="${dados}" var="dado">
		<option>${converter.convertTo(dado)}</option>
	</c:forEach>
</select>

<!-- COMBOBOX JAVASCRIPT -->
<script>
$(document).ready(function()
{
  	$('.combobox').combobox();
});
</script>