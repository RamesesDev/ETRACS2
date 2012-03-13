<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/common" prefix="common" %>
<%@ taglib tagdir="/WEB-INF/tags/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/page" prefix="page" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<s:invoke service="JobPermissionService" method="getUserJobposition" params="${param}" var="JOB" debug="true"/>
<c:set var="PERMISSIONS" value="${JOB.permissions}" scope="request"/>

<t:secured-master>
	
	<jsp:attribute name="head">
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/ext/calendar/fullcalendar.css" type="text/css"/>
		<script src="${pageContext.servletContext.contextPath}/js/ext/calendar/fullcalendar.js"></script>
		<script src="${pageContext.servletContext.contextPath}/js/ext/calendar/calendar.js"></script>
		<script src="${pageContext.servletContext.contextPath}/js/apps/SkedUtil.js"></script>
	</jsp:attribute>

	<jsp:attribute name="script">
		<common:loadmodules name="modules"/>
		
		$put("apps", 
			new function() {
				this.items;
				this.onload = function() {
					this.items = Registry.lookup( "home:menu" );
				}
			}
		);
		
		$put(
			"home",
			new function() {
				this.onload = function() {
					if( !location.hash && $ctx('apps').items && $ctx('apps').items.length > 0 ) 
						location.hash = $ctx('apps').items[0].id;
				}
			}
		);
	</jsp:attribute>

	<jsp:attribute name="header_middle">
		<page:select-job title="${JOB.title}" list="${JOB.others}"/>
	</jsp:attribute>
	
	<jsp:body>
		<ui:panel cols="2">
			<ui:section>
				<img src="${pageContext.request.contextPath}/photo/profile/${SESSION_INFO.objid}"/>
			</ui:section>
			<ui:section>
				<span class="capitalized">
					<h4>
						${fn:toLowerCase(SESSION_INFO.lastname)}, ${fn:toLowerCase(SESSION_INFO.firstname)}
					</h4>
				</span>
				<i>${SESSION_INFO.usertype}</i>
			</ui:section>
		</ui:panel>

		<div class="hr"></div>
		
		<table r:context="apps" r:items="items">
			<tr>
				<td><a href="##{id}">#{caption}</a></td>
			</tr>
		</table>
	</jsp:body>
</t:secured-master>