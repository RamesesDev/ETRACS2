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
<%@ attribute name="mode" %>
<%@ attribute name="orientation" %>

<c:set var="optionMap" value="<%=JsonUtil.toObject(options) %>"/>

<c:if test="${! empty orientation && orientation == 'horizontal'}"> 
	<tr>
		<td>
		</td>
		<td>
			<table>
				<tr>
</c:if>

<c:forEach items="${optionMap}" var="option">
	<c:if test="${ empty orientation && orientation != 'horizontal'}"> 
		<tr>
	</c:if>
	<td class="form-caption" valign="top">
		${option.caption}
		<c:if test="${required == 'true'}">&nbsp;<font color=red>*</font></c:if>
	</td> 
	<td>
		<input type="checkbox" r:context="${context}" 
			r:checkedValue="${option.checkedValue}" r:uncheckedValue="${option.uncheckedValue}" 
			<c:if test="${! empty mode && mode == 'set'}">
				r:mode="${mode}"
				r:name="${name}" 
			</c:if>
			<c:if test="${ empty mode}">
				r:name="${option.name}" 
			</c:if>
		/> 
	</td>
	<c:if test="${ empty orientation && orientation != 'horizontal'}"> 
		</tr>
	</c:if>
</c:forEach>

<c:if test="${! empty orientation && orientation == 'horizontal'}"> 
				</tr>
			</table>
		</td>
	</tr>		
</c:if>
