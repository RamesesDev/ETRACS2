<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tag import="java.util.*" %>

<%@ tag dynamic-attributes="params" %>
<%@ attribute name="name" %>

<c:set var="context" scope="request" value="${name}"/>
<jsp:doBody/>
<%
	request.removeAttribute("context");
%>

