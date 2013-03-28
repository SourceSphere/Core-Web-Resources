<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ attribute name="identificador" required="true" type="java.lang.String" %>
<%@ attribute name="nome" required="true" type="java.lang.String" %>
<%@ attribute name="valor" required="false" type="java.util.Date"%>
<%@ attribute name="tipo" required="false" type="java.lang.String" description="Mask / Datepicker"%>
<%@ attribute name="mascara" required="false" type="java.lang.String" description="for mask only, default = 00/00/0000"%>
<%@ attribute name="dateFormat" required="false" type="java.lang.String" description="for datepicker only, default = dd/mm/yy"%>
<%@ attribute name="classe" required="false" type="java.lang.String" description="Bootstrap class for this element"%>
<%@ attribute name="readonly" required="false" type="java.lang.Boolean" description="default = false"%>

<fmt:formatDate value="${valor}" pattern="dd/MM/yyyy" var="data"/>

<c:if test="${tipo == null}">
	<c:set var="tipo" value="Mask" />
</c:if>

<c:if test="${mascara == null}">
	<c:set var="mascara" value="00/00/0000" />
</c:if>

<c:if test="${dateFormat == null}">
	<c:set var="dateFormat" value="dd/mm/yy" />
</c:if>

<c:choose>
	<c:when test="${readonly == true}">
		<input type="text" id="${identificador}" name="${nome}" value="${data}" class="${classe}" readonly/>
	</c:when>
	<c:otherwise>
		<input type="text" id="${identificador}" name="${nome}" value="${data}" class="${classe}"/>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${tipo.equals('Datepicker')}">
		<script type="text/javascript">
			$("#${identificador}").datepicker({dateFormat: '${dateFormat}',changeYear: 1,changeMonth: 1});
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			$("#${identificador}").mask('${mascara}');
		</script>
	</c:otherwise>
</c:choose>