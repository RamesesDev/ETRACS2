<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/server" prefix="s" %>

<%@ page import="java.util.*" %>
<%@ page import="com.rameses.invoker.client.*" %>
<%@ page import="com.rameses.server.common.*" %>
<%@ page import="com.rameses.web.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>


<s:invoke service="Var" method="get" params="${'server_address'}" var="SERVER_ADDRESS"/>
<%
	String appname = application.getInitParameter("app.context");
	try {
		String filename = "";
		Map resp = new HashMap();
		if( "post".equals(request.getMethod().toLowerCase()) ) {
			String resUrl = System.getProperty( "jboss.server.home.dir" ) + "/apps/" + appname + ".ear/downloads.war/images/";
			
			File dest = new File(resUrl);
			if( !dest.exists() ) dest.mkdirs();
			
			FileItem fi = (FileItem) request.getAttribute("FILE");
			fi.write( new File(dest, fi.getName()) );
			
			String url = "http://" + request.getAttribute("SERVER_ADDRESS") + ":8080/downloads/images/" + fi.getName();
			
			Map info = new HashMap();
			info.put("name", request.getParameter("name"));
			info.put("value", url);
			
			List data = new ArrayList();
			data.add(info.get("name"));
			data.add(info.get("value"));
			request.setAttribute("data", data);
			
			out.write( JsonUtil.toString(info) );
		}
	}
	catch(Exception e) {
		e.printStackTrace();
		throw e;
	}
%>

<c:if test="${not empty data}">
	<s:invoke service="Var" method="set" params="${data}" debug="true"/>
</c:if>
