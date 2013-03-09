<%@ tag language="java" pageEncoding="ISO-8859-1"%>

<!-- TAGLIBS -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://sourcesphere.com.br/jsp/tags/rs" prefix="rs" %>

<!-- ATRIBUTOS -->
<%@ attribute name="identificador" required="true" type="java.lang.String" %>
<%@ attribute name="nome" required="false" type="java.lang.String" %>
<%@ attribute name="classe" required="false" type="java.lang.String" %>
<%@ attribute name="placeholder" required="false" type="java.lang.String" %>
<%@ attribute name="maxlength" required="false" type="java.lang.String" %>
<%@ attribute name="value" required="false" type="java.lang.String" %>

<input id="${identificador}" name="${nome}" type="text" class="${classe}" maxlength="${maxlength}" placeholder="${placeholder}" value="${value}">

<script type="text/javascript">
	$('#${identificador}').bind('keypress', function(evt)
	{
		var charCode = (evt.which) ? evt.which : event.keyCode;
		   if (charCode > 31 && (charCode < 48 || charCode > 57))
		   {
		      return false;
		   }
		   return true;
	});
</script>
