<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/ui-components" prefix="ui" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="common" %>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ page import="com.rameses.web.support.*" %>

<c:if test="${!empty param['id']}">
	<%ModuleUtil.clearModules(application, request.getParameter("id") );%>
</c:if>

<form method="post">
	Module to Load <input type="text" name="id"/>
	<input type="submit" value="Load Modules"/>
</form>
