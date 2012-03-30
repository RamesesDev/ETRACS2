<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>

<%@ tag import="java.util.*"%>
<%@ attribute name="pageid"%>
<%@ attribute name="section"%>

<%
	Map map = new HashMap();
	map.put( "pageid", pageid );
	map.put( "section", section );
	jspContext.setAttribute( "params", map );
%>

<s:invoke service="PersonalizedContentService" method="getContent" params="${params}" var="_CONTENT_INFO"/>
${_CONTENT_INFO}

<%request.removeAttribute("_CONTENT_INFO");%>

