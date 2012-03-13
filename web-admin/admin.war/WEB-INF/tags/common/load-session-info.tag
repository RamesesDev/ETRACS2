<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags/server" prefix="s" %>
<%@ tag import="javax.servlet.http.*" %>

<c:if test="${!empty SESSIONID and empty SESSION_INFO}">
	<s:invoke service="SessionService" method="getInfo" params="${SESSIONID}" var="SESSION_INFO"/>
	<c:if test="${empty SESSION_INFO}">
	<%		
		String uri = request.getRequestURI();
		String qs = request.getQueryString();
		if( qs != null )
		uri = uri + "?" + qs;
		
		//remove the cookie
		Cookie cookie = new Cookie("sessionid", "");
		cookie.setMaxAge(0);
		response.addCookie( cookie );
		
		response.sendRedirect(request.getContextPath() + "/login.jsp?u=" + java.net.URLEncoder.encode(uri));
	%>
	</c:if>
</c:if>