<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tag import="java.util.*" %>
<%@ tag import="com.rameses.server.common.*" %>
<%@ tag dynamic-attributes="params" %>

<%@ attribute name="name" %>
<%@ attribute name="required" %>
<%@ attribute name="visibleWhen" %>
<%@ attribute name="depends" %>
<%@ attribute name="orientation" %>

<tr>
	<td class="form-caption" valign="top">Gender <c:if test="${required == 'true'}">&nbsp;<font color=red>*</font></c:if></td> 
	<td>
		<label>
			<input type="radio" r:context="${context}" r:name="${name}"
				<c:if test="${! empty depends}"> r:depends="${depends}" </c:if>
				<c:if test="${! empty required}"> r:required="${required}" </c:if>
				<c:if test="${! empty visibleWhen}"> r:visibleWhen="${visibleWhen}" </c:if>
			value="M"/>Male
		</label>
		<label>
			<c:if test="${! empty orientation && orientation == 'vertical'}"> <br/> </c:if><input type="radio" r:context="${context}" r:name="${name}"
				<c:if test="${! empty depends}"> r:depends="${depends}" </c:if>
				<c:if test="${! empty required}"> r:required="${required}" </c:if>
				<c:if test="${! empty visibleWhen}"> r:visibleWhen="${visibleWhen}" </c:if>
			value="F"/>Female
		</label>
	</td>
</tr>
