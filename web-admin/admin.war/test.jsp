<%@ taglib tagdir="/WEB-INF/tags/server" prefix="s" %>
<%@ page import="java.util.*" %>

<%
	Map env = new HashMap();
	//env.put("ds.prefix", "usc");
	request.setAttribute("env", env);
%>
<s:invoke service="MultiTenantTestService" method="test" env="${env}" var="result"/>

${result}