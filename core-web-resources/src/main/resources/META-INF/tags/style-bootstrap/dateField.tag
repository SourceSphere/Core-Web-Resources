<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://sourcesphere.com.br/jsp/tags/rs" prefix="rs" %>
<%@ attribute name="identificador" required="true" type="java.lang.String" %>
<%@ attribute name="nome" required="true" type="java.lang.String" %>
<%@ attribute name="value" required="false" type="java.util.Calendar"%>

<!-- Formatação da Data -->
<fmt:formatDate value="${value.time}" pattern="dd/MM/yyyy" var="data"/>

<!-- Campo de Texto -->
<input type="text" id="${identificador}" name="${nome}" value="${data}"/>

<!-- Datepicker(JQUERY) -->
<script type="text/javascript">
	$("#${identificador}").datepicker({dateFormat: 'dd/mm/yy',changeYear: 1,changeMonth: 1});
</script>