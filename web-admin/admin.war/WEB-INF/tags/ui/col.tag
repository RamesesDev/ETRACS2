<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ attribute name="name" %>
<%@ attribute name="caption"%>
<%@ tag dynamic-attributes="params" %>
<%@ attribute name="width" %>

<c:if test="${_datatable_processing == 'cols'}"><td <c:forEach items="${params}" var="p"> ${p.key}="${p.value}" </c:forEach>>${caption}</td></c:if>
<c:if test="${_datatable_processing == 'rows'}">
	<td 
		<c:if test="${width != null}"> width="${width}" </c:if> 
		<c:forEach items="${params}" var="p"> ${p.key}="${p.value}" </c:forEach>>
	<c:if test="${empty name}"><jsp:doBody/></c:if>
	<c:if test="${!empty name}">#{item.${name}}</c:if>
	</td>
</c:if>
