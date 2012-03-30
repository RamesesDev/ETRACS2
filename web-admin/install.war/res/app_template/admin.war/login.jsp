<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ taglib tagdir="/WEB-INF/tags/server" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>

<c:if test="${param.username!=null or param.password!=null}">
	<%    
		Map map = new HashMap();
		map.put( "username", request.getParameter( "username" ) );
		map.put( "password", request.getParameter( "password" ) );
		request.setAttribute( "data", map );	
	%>


	<s:invoke service="LoginService" method="login" params="${data}" var="result"/>
	<c:if test="${empty error}">
		<c:set var="SESSIONID" value="${result.sessionid}" scope="request"/>
		<%			
			Cookie cookie = new Cookie( "sessionid", (String)request.getAttribute("SESSIONID") ) ;
			Map result = (Map) request.getAttribute("result");
			response.addCookie( cookie );
			
			if( request.getParameter("u") != null )
				response.sendRedirect(request.getParameter("u"));
			else {
				response.sendRedirect("home.jsp");
			}
		%>
	</c:if>
</c:if>

<c:set var="APP_TITLE" value="<%=application.getInitParameter("app.title")%>"/>
<c:if test="${!empty error or (param.username==null and param.password==null)}">
	<!DOCTYPE html>
	<html>
		<head>
			<title>
				<%=application.getInitParameter("app.title")%>
				<c:if test="${not empty pageTitle}"> - ${pageTitle}</c:if>
			</title>
			<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet"/>
			<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet"/>
			<script src="${pageContext.request.contextPath}/js/lib/jquery-all.js"></script>
		</head>
		<body>
			<div class="centered">
				<div class="section">
					<img src="${pageContext.request.contextPath}/img/logo/etracs.png" height="60px"/>
				</div>
				<div class="login-box">
					<h2>Administration Panel Login</h2>
					<div class="hr"></div>
					<c:if test="${not empty error}">
						<div class="error section">
							<p>The username or password is incorrect.</p>
						</div>
					</c:if>	
					<div class="centered form">
						<form action="login.jsp" method="post">
							<label>
								<span class="caption">Username:</span>
								<input id="uid" type="text" name="username" value="${param['username']}"/>
							</label>
							<label>
								<span class="caption">Password:</span>
								<input id="pwd" type="password" name="password"/>
							</label>
							<div class="buttons">
								<button type="submit">
									Login
								</button>
							</div>
							<div class="buttons">
								<a href="resetpass.jsp">
									Forgot your Password?
								</a>
							</div>
							<c:if test="${! empty param['u']}">
								<input type="hidden" name="u" value="${param['u']}"/>
							</c:if>
						</form>
						<script type="text/javascript">
							$("#${empty param['username']? 'uid' : 'pwd'}").focus();
						</script>
					</div>
				</div>
				<div class="section clearfix">
					<div class="left">
						&copy; 2012 
						<a href="http://www.ramesesinc.com" target="_blank">
							Rameses Systems Inc. 
						</a>
					</div>
					<div class="right">
						<a href="http://www.ramesesinc.com" target="_blank">
							<img src="${pageContext.request.contextPath}/img/logo/rameses.png" height="25px"/>
						</a>
					</div>
				</div>
			</div>
		</body>
	</html>
</c:if>



