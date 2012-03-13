<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/common" prefix="common" %>
<%@ taglib tagdir="/WEB-INF/tags/server" prefix="s" %>

<%@ tag import="java.util.regex.*" %>
<%@ tag import="java.util.*" %>

<%@ attribute name="redirect_session" fragment="false" %>
<%@ attribute name="tab" fragment="false" %>
<%@ attribute name="script" fragment="true"%>
<%@ attribute name="style" fragment="true"%>
<%@ attribute name="pageTitle" fragment="false"%>

<%

String userAgent = request.getHeader("user-agent");
if( userAgent.contains("MSIE") ) {
	String exp = "MSIE(.*?);";
	Pattern p = Pattern.compile(exp);
	Matcher m = p.matcher(userAgent);
	if( m.find() ) {
		int v = Integer.parseInt(m.group(1).replaceAll("^\\s+|\\..*", ""));
		if( v <= 6 ) {
			response.sendRedirect("not-supported.jsp");
		}
	}
}

//get the app version
request.setAttribute("APP_VERSION", application.getInitParameter("app.version"));

%>

<c:if test="${!empty SESSIONID and redirect_session=='true'}">
	<%response.sendRedirect("home.jsp");%>
</c:if>

<c:if test="${(empty SESSIONID) || (empty redirect_session) || (redirect_session=='false')}">
	<!DOCTYPE html>
	<html>
		<head>
			<title>
				<%=application.getInitParameter("app.title")%>
				<c:if test="${not empty pageTitle}"> - ${pageTitle}</c:if>
			</title>
			<meta name="description" content="<%=application.getInitParameter("app.description")%>"/>
			<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/lib/css/jquery-ui/jquery.css?v=${APP_VERSION}" type="text/css"/>
			<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/js/lib/css/rameses-lib.css?v=${APP_VERSION}" type="text/css" />
			<script src="${pageContext.servletContext.contextPath}/js/lib/jquery-all.js?v=${APP_VERSION}"></script>
			
			<script src="${pageContext.servletContext.contextPath}/js/lib/rameses-ext-lib.js?v=${APP_VERSION}"></script>
			<script src="${pageContext.servletContext.contextPath}/js/lib/rameses-ui.js?v=${APP_VERSION}"></script>
			<script src="${pageContext.servletContext.contextPath}/js/lib/rameses-proxy.js?v=${APP_VERSION}"></script>
			<script src="${pageContext.servletContext.contextPath}/js/lib/rameses-session.js?v=${APP_VERSION}"></script>

			
			<link href="${pageContext.servletContext.contextPath}/css/index.css?v=${APP_VERSION}" type="text/css" rel="stylesheet"/>	
			
			
			<script>
				ProxyService.contextPath = '${pageContext.request.contextPath}';

				$put("login", {});
				
				//focus login text
				$(function(){
					$('#uid').focus();
				});
			</script>
			
			<c:if test="${! empty script}">
			<script>
				<jsp:invoke fragment="script"/>	
			</script>	
			</c:if>

			<c:if test="${! empty style}">
			<style>
				<jsp:invoke fragment="style"/>	
			</style>	
			</c:if>
		</head>
		<body>
			<table width="100%" height="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td class="head" valign="top">&nbsp;</td>
					<td class="head" width="850" align="right" valign="top">
						<table class="middle" width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td class="logo" align="left" valign="top">
									<a href="${pageContext.servletContext.contextPath}">
										<!--
										<img src="img/index/logo.png"/>
										-->
										<h1>
											<%=application.getInitParameter("app.title")%>
										</h1>
									</a>
								</td>
								<td class="login" align="right" valign="top">
									<c:if test="${empty SESSIONID}">
										<form class="right login" action="login.jsp" method="post">
											<div class="clear">
												<input id="uid" type="text" r:name="username" name="username" r:hint="User Name" r:context="login"/>
											</div>
											<div class="clear">
												<input id="pwd" type="password" r:name="password" name="password"  r:hint="Password" r:context="login"/>
											</div>
											<div class="clear actions">
												<a href="resetpass.jsp" class="left">
													Forgot Password?
												</a>
												<button type="submit" class="right">
													Login
												</button>
											</div>
										</form>
										<span class="right vr"></span>
									</c:if>

								</td>
							</tr>
						</table>
					</td>
					<td class="head">&nbsp;</td>		
				</tr>
				
				<tr>
					<td class="middle">&nbsp;</td>
					<td class="middle" height="320" valign="top"  style="padding-top: 20px;">
						<jsp:doBody/>
					</td>
					<td class="middle">&nbsp;</td>		
				</tr>
				
				<tr>
					<td class="foot" id="footdeco" colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td class="foot">&nbsp;</td>
					<td class="foot" height="100%">
						<div class="left">
							&copy; 2012 IKON College. All Rights Reserved.
						</div>
						<div class="right">
							Powered by: 
							<a href="http://www.gazeebu.com" target="_blank">
								Gazeebu
							</a>
						</div>
					</td>
					<td class="foot">&nbsp;</td>				
				</tr>
			</table>
		</body>	
	</html>
</c:if>