<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${empty SESSIONID}">
	<%
		String uri = request.getRequestURI();
		String qs = request.getQueryString();
		if( qs != null )
		uri = uri + "?" + qs;
		
		response.sendRedirect(request.getContextPath() + "/login.jsp?u=" + java.net.URLEncoder.encode(uri));
	%>
</c:if>