<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/ui-components" prefix="ui" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="common" %>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ page import="com.rameses.web.support.*" %>

<html>
	<head>
		<script src="${pageContext.servletContext.contextPath}/js/lib/jquery-all.js"></script>
		<script src="${pageContext.servletContext.contextPath}/js/lib/rameses-ext-lib.js"></script>
		<script src="${pageContext.servletContext.contextPath}/js/lib/rameses-ui.js"></script>
		<script src="${pageContext.servletContext.contextPath}/js/lib/rameses-proxy.js"></script>
		<script>
			$put(
				'server-mgmt',
				{
					svcname: '',
					reloadSvc: function() {
						ProxyService.lookup("ScriptMgmtService").redeploy(this.modname);
					},
					reloadAllSvc: function() {
						ProxyService.lookup("ScriptMgmtService").redeployAll();
					},
					schemaname: '',
					reloadSchema: function() {
						ProxyService.lookup("SchemaMgmtService").redeploy(this.schemaname);
					},
					reloadAllSchema: function() {
						ProxyService.lookup("SchemaMgmtService").redeployAll();
					}
				}
			);
		</script>
	</head>
	<body>
		<h1>Script Management</h1>
		<button r:context="server-mgmt" r:name="reloadAllSvc">Reload All</button>
		
		
		<h1>Schema Management</h1>
		<button r:context="server-mgmt" r:name="reloadAllSchema">Reload All</button>
		
		
		<c:if test="${!empty param['moddir']}">
			<%ModuleUtil.clearModules(application, request.getParameter("moddir") );%>
		</c:if>

		<h1>Modules Management</h1>
		<form method="post">
			Modules Directory <input type="text" name="moddir" value="${param.moddir}"/>
			<input type="submit" value="Load Modules"/>
		</form>
	</body>
</html>