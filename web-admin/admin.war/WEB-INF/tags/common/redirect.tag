<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/common" prefix="common" %>
<%@ tag import="com.rameses.web.support.*" %>
<%@ tag import="com.rameses.server.common.*" %>
<%@ tag import="java.util.*" %>

<%@ attribute name="page" required="true"%>
<%@ attribute name="query"%>
<%@ attribute name="hash"%>

<%
	StringBuffer sb = new StringBuffer();
	sb.append( page );
	if( query != null && query.length() > 0 ) {
		sb.append( java.net.URLEncoder.encode(query) );
	}
	if( hash != null && hash.length() > 0 ) {
		sb.append( "#" + hash );
	}
	response.sendRedirect(sb.toString());
%>


