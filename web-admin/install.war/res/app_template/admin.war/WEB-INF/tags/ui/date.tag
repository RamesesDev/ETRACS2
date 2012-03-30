<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tag import="java.util.*" %>
<%@ tag dynamic-attributes="params" %>

<%@ attribute name="context" %>
<%@ attribute name="caption" %>
<%@ attribute name="name" %>
<%@ attribute name="required" %>
<%@ attribute name="visibleWhen" %>
<%@ attribute name="depends" %>
<%@ attribute name="options" %>

<tr>
	<td class="form-caption" valign="top">${caption} <c:if test="${required == 'true'}">&nbsp;<font color=red>*</font></c:if></td> 
	<td>
		<span r:type="datetime" r:name="${objPrefix}${name}"  r:caption="${caption}" r:context="${context}" 
		<c:forEach items="${params}" var="p"> ${p.key}="${p.value}" </c:forEach> 
		<c:if test="${! empty depends}"> r:depends="${depends}" </c:if>
		<c:if test="${! empty required}"> r:required="${required}" </c:if>
		<c:if test="${! empty visibleWhen}"> r:visibleWhen="${visibleWhen}" </c:if>
		r:options="${!options? '{mode:\'date\'}' : options}"></span>
	</td> 
</tr>

