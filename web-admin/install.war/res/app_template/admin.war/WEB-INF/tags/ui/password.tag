<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tag import="java.util.*" %>
<%@ tag dynamic-attributes="params" %>

<%@ attribute name="caption" %>
<%@ attribute name="name" %>
<%@ attribute name="required" %>
<%@ attribute name="visibleWhen" %>

<tr>
	<td class="form-caption" valign="top">${caption} <c:if test="${required == 'true'}">&nbsp;<font color=red>*</font></c:if></td> 
	<td>
		<input class="form-input" type="password" r:context="${context}" r:name="${objPrefix}${name}" r:caption="${caption}"
		<c:forEach items="${params}" var="p"> ${p.key}="${p.value}" </c:forEach> 
		<c:if test="${! empty required}"> r:required="${required}" </c:if>
		<c:if test="${! empty visibleWhen}"> r:visibleWhen="${visibleWhen}" </c:if>/>
	</td> 
</tr>

