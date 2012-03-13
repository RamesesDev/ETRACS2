<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tag import="java.util.*" %>
<%@ tag import="com.rameses.server.common.*" %>
<%@ tag dynamic-attributes="params" %>

<%@ attribute name="caption" %>
<%@ attribute name="name" %>
<%@ attribute name="required" %>
<%@ attribute name="visibleWhen" %>
<%@ attribute name="depends" %>
<%@ attribute name="options" %>
<%@ attribute name="orientation" %>

<c:set var="optionMap" value="<%=JsonUtil.toObject(options) %>"/>
<tr>
	<td class="form-caption" valign="top">${caption} <c:if test="${required == 'true'}">&nbsp;<font color=red>*</font></c:if></td> 
	<td>
		<c:forEach items="${optionMap}" var="option">
			<input type="radio" r:context="${context}" r:name="${objPrefix}${name}"
				<c:if test="${! empty depends}"> r:depends="${depends}" </c:if>
				<c:if test="${! empty required}"> r:required="${required}" </c:if>
				<c:if test="${! empty visibleWhen}"> r:visibleWhen="${visibleWhen}" </c:if>
			value="${option.key}"/>${option.value}
			<c:if test="${! empty orientation && orientation == 'vertical'}"> <br/> </c:if>
		</c:forEach>
	</td>
</tr>
