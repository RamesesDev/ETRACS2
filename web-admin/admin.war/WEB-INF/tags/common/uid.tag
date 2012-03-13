<%@ attribute name="prefix" %>
<%@ attribute name="var" %>

<%
	
String uid = "" + (prefix!=null? prefix : "") + new java.rmi.server.UID();
if( var != null )
	request.setAttribute(var, uid);
	
%>