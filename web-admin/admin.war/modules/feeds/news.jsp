<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/common" prefix="com" %>
<%@ taglib tagdir="/WEB-INF/tags/app" prefix="app" %>

<com:load-session-info/>

<s:invoke service="JobPermissionService" method="getUserJobposition" params="${param}" var="JOB" debug="true"/>
<c:set var="PERMISSIONS" value="${JOB.permissions}" scope="request"/>

<t:content title="Administration Panel">
	<jsp:attribute name="head">
		<script>
			$put( "news", 
			new function() {
					this.info;
				}
			);
		</script>
		
		<style>
			.admin-menu { margin-top: 40px; }
			.admin-menu a {
				background: #F6F6F6;
				background: -moz-linear-gradient(top,#fff 0,#ddd 100%);
				background: -ms-linear-gradient(top,#fff 0,#ddd 100%);
				background: -o-linear-gradient(top,#fff 0,#ddd 100%);
				background: -webkit-gradient(linear,left top,left bottom,color-stop(0,#fff),color-stop(100%,#ddd));
				background: -webkit-linear-gradient(top,#fff 0,#ddd 100%);
				background: linear-gradient(to bottom,#fff 0,#ddd 100%);
				border: solid 1px #ccc;
				border-radius: 4px;
				box-shadow: 0 2px 3px #ccc;
				display: inline-block;
				margin: 0 10px;
				padding: 4px;
				text-decoration: none;
			}
			
			.admin-menu a:hover {
				border-color: #999;
				background: -moz-linear-gradient(top,#fff 0,#e0e0e0 100%);
				background: -ms-linear-gradient(top,#fff 0,#e0e0e0 100%);
				background: -o-linear-gradient(top,#fff 0,#e0e0e0 100%);
				background: -webkit-gradient(linear,left top,left bottom,color-stop(0,#fff),color-stop(100%,#e0e0e0));
				background: -webkit-linear-gradient(top,#fff 0,#e0e0e0 100%);
				background: linear-gradient(to bottom,#fff 0,#e0e0e0 100%);
				-moz-box-shadow: 0 1px 2px rgba(0,0,0,0.50),inset 0 0 3px #fff;
				-ms-box-shadow: 0 1px 2px rgba(0,0,0,0.50),inset 0 0 3px #fff;
				-webkit-box-shadow: 0 1px 2px rgba(0,0,0,0.50),inset 0 0 3px #fff;
				box-shadow: 0 1px 2px rgba(0,0,0,0.50),inset 0 0 3px #fff;
			}
		</style>
	</jsp:attribute>

	<jsp:body>
		<com:loadmodules type="admin:menu" var="list" encodejs="false"/>
		<div class="admin-menu align-c">
			<c:forEach items="${list}" var="item">
				<a href="#${item.id}" title="${item.caption}">
					<img src="${pageContext.request.contextPath}/${item.icon}"/>
				</a>
			</c:forEach>
		</div>
	</jsp:body>
</t:content>