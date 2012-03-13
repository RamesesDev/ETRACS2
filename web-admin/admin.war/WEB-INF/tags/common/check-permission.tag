<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/common" prefix="common" %>
<%@ tag import="com.rameses.web.support.*" %>
<%@ tag import="com.rameses.server.common.*" %>
<%@ tag import="java.util.*" %>

<%@ attribute name="key" %>
<%@ attribute name="permissions" rtexprvalue="true" type="java.lang.Object" %>

<%
	List permList = new ArrayList();
	List p = (List) request.getAttribute("PERMISSIONS");
	if( p != null ) {
		permList.addAll( p );
	}
	if( permissions instanceof List ) {
		permList.addAll( (List)permissions );
	}
	
	if( key == null || key.trim().length() == 0 || permList.contains(key) ) 
	{
%>
		<jsp:doBody/>
<%
	}
%>


