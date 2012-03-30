<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ attribute name="context" %>
<%@ attribute name="items" %>
<%@ attribute name="varname" %>
<%@ attribute name="usersmap" %>
<%@ attribute name="imagewidth" %>
<%@ attribute name="itemid" %>
<%@ attribute name="onmouseover" %>

<c:if test="${empty varName}">
	<c:set var="varName" value="item"/>
</c:if>

<c:if test="${empty imagewidth}">
	<c:set var="imagewidth" value="30px"/>
</c:if>

<c:if test="${empty itemid}">
	<c:set var="itemid" value="objid"/>
</c:if>

<ul r:context="${context}" r:items="${items}" r:varName="${varname}" class="userimgpanel clearfix">
	<li class="left" style="width:${imagewidth};height:${imagewidth}"
		onmouseover="${onmouseover}">
		<img src="${pageContext.servletContext.contextPath}/profile/photo.jsp?id=#{${varname}.${itemid}}&t=thumbnail&v=#{${usersmap}[${varname}.${itemid}].info.photoversion}"
			 width="${imagewidth}"/>
	</li>
</ul>