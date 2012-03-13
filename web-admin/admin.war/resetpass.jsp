<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ page import="java.util.*" %>
<%@ page import="com.rameses.service.*" %>
<%@ page import="com.rameses.util.*" %>

<%
	if( "post".equals(request.getMethod().toLowerCase()) ) {
		Map env = new HashMap();
		Map conf = new HashMap();
		conf.put("app.host", application.getInitParameter("app.host") );
		conf.put("app.context", application.getInitParameter("app.context") );
		
		ScriptServiceContext svc = new ScriptServiceContext(conf);
		ServiceProxy ac = (ServiceProxy) svc.create( "UserProfileService", env );
		
		Map arg = new HashMap();
		if( request.getParameter("search") != null ) {
			arg.put("account", request.getParameter("account"));
			List list = (List) ac.invoke("findUser", new Object[]{ arg });
			if( list.size() == 0 ) {
				request.setAttribute("ERROR", "true");
			}
			else {
				request.setAttribute("ACCT_LIST", list);
				request.setAttribute("PAGE", "list");
			}
		}
		else if( request.getParameter("reset") != null ) {
			arg.put("objid", request.getParameter("objid"));
			ac.invoke("resetPassword", new Object[]{ arg });			
			response.sendRedirect("resetpass.jsp?success=" + request.getParameter("email"));
			return;
		}
	}
%>

<t:public redirect_session="false">
	<jsp:attribute name="head">
		<link href="${pageContext.servletContext.contextPath}/css/signup.css" rel="stylesheet"/>
		<style>
			.btn button { padding: 2px 3px; }
		</style>
	</jsp:attribute>
	
	<jsp:body>
		<c:if test="${empty PAGE and empty param['success']}">
			<h1>Reset Your Account Password</h1>
			<p>
				Please enter the information to help identify your account:
			</p>
			<br/>
			<form method="post">
				<c:if test="${! empty ERROR}">
					<div style="color:red">
						<b>No account found for the specified username/password.</b>
					</div>
					<br/>
				</c:if>
				<b>Enter your username or email address.</b>
				<br/>
				<input id="acct" type="text" name="account" size="50" placeholder="Username/Email Address"/>
				<button type="submit" name="search">Search Account</button>
				<script>
					var input = document.getElementById('acct');
					if( input ) input.focus();
				</script>
			</form>
		</c:if>
		<c:if test="${PAGE == 'list'}">
			<h1>Search Result(s)</h1>
			<p>
				Select the account to be reset.
			</p>
			<c:forEach items="${ACCT_LIST}" var="acct">
				<table>
					<tr>
						<td valign="top" rowspan="2">
							<img src="profile/photo.jsp?id=${acct.objid}&t=thumbnail&v=${acct.info.photoversion}"/>
						</td>
						<td valign="top">
							<b>${acct.lastname}, ${acct.firstname}</b>
							<br/>
							<i>${acct.username}</i>
							<br/>
							<i>${acct.email}</i>
						</td>
					</tr>
					<tr>
						<td align="right">
							<form method="post">
								<span class="btn">
									<button type="submit" name="reset">Reset Password</button>
									<input type="hidden" name="objid" value="${acct.objid}"/>
									<input type="hidden" name="email" value="${acct.email}"/>
								</span>
							</form>
						</td>
					</tr>
					</tr>
				</table>
			</c:forEach>
		</c:if>
		<c:if test="${!empty param['success']}">
			<h1>Your Account Password Has Been Reset!</h1>
			<p>Your recovery password had been sent to <b style="color:maroon">${param['success']}</b>.</p>
		</c:if>
	</jsp:body>
</t:public>
