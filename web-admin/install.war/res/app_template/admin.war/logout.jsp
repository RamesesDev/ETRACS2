<%@ taglib tagdir="/WEB-INF/tags/server" prefix="s" %>

<s:invoke service="LogoutService" method="logout" params="${not empty SESSIONID? SESSIONID : ''}" debug="true"/>
<%
	Cookie cookie = new Cookie( "sessionid", (String)request.getAttribute("SESSIONID") ) ;
	cookie.setMaxAge(0);
	response.addCookie( cookie );
	
	request.setAttribute("APP_TITLE", application.getInitParameter("app.title"));
	
	pageContext.include("login.jsp");
%>
