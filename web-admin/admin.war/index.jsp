<% 
	String sessionid = (String) request.getAttribute("SESSIONID");
	if( sessionid != null )
		response.sendRedirect("home.jsp"); 
	else
		pageContext.include("login.jsp");
%>