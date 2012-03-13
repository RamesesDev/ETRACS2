<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/common" prefix="ui" %>
<%@ taglib tagdir="/WEB-INF/tags/page" prefix="page" %>

<%@ attribute name="before_rendering" fragment="true" %>
<%@ attribute name="head" fragment="true" %>
<%@ attribute name="script" fragment="true" %>
<%@ attribute name="style" fragment="true" %>
<%@ attribute name="header_middle" fragment="true" %>
<%@ attribute name="sections" fragment="true"%>

<%@ attribute name="pageTitle"%>
<%@ attribute name="showFeedback"%>

<ui:check-session/>
<ui:load-session-info/>

<c:if test="${empty showFeedback}">
	<c:set var="showFeedback" value="false"/>
</c:if>

<c:if test="${!empty SESSIONID}">

	<jsp:invoke fragment="before_rendering"/>
	<!DOCTYPE html>
	<html>
		<head>
			<title>
				<%=application.getInitParameter("app.title")%>
				<c:if test="${not empty pageTitle}"> - ${pageTitle}</c:if>
			</title>
			<meta name="description" content="<%=application.getInitParameter("app.description")%>"/>
			
			<page:app-version/>
			<page:jquery-import/>
			<page:rameses-ui-import/>
			
			
			<script>
				Env.sessionid = $.cookie("sessionid");
				var Session = new Notifier( Env.sessionid );
				Registry.add( {id:"#usermenu", context:"session"} );				
				ProxyService.contextPath = '${pageContext.request.contextPath}';				
				Notifier.contextPath = '${pageContext.request.contextPath}';
				
				$put("session",
					new function() {

						this.logout = function() {
							try {
								var svc = ProxyService.lookup('LogoutService');
								svc.logout( Env.sessionid ); 
							}
							catch(e) {
								if( window.console ) console.log( e );
							}
						}
						
						var profileMenu;						
						this.showProfileMenu = function() {
							if( !profileMenu ) {
								profileMenu = new DropdownOpener( '#usermenu' );
								profileMenu.options = {
									styleClass: 'dropdownmenu',
									handleClassOnOpen: 'menu_open',
									position: {my: 'right top', at: 'right bottom'}
								};
							}
							return profileMenu;
						}
						
						this.onload = function() {
							Session.connectionListener.ended = function(o) {
								$.cookie( "sessionid", null );
								if( o == "_:ended" ) {
									window.location = "logout.jsp";
								}
								else {
									window.location.reload(true);
								}	
							}	
							Session.connect();
						}
					}
				);	
			</script>

			<jsp:invoke fragment="head"/>
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
			<div class="wrapper">
				<table class="main-container" width="930px" align="center" cellpadding="0" cellspacing="0" height="100%">
					<tr>
						<td height="100%">
							<jsp:doBody/>
						</td>
					</tr>
					<tr>
						<td class="footer" width="980" valign="top">
							<table width="100%" cellpadding="0" cellspacing="0" class="footer">
								<tr>
									<td width="165">&nbsp;</td>
									<td>
										<div class="left">
											&copy; 2012 
											<a href="http://www.ramesesinc.com" target="_blank">
												Rameses Systems Inc. 
											</a>
											All Rights Reserved.
										</div>
										<div class="right">
											<a href="http://www.ramesesinc.com" target="_blank">
												<img src="${pageContext.request.contextPath}/img/logo/rameses.png" height="20px"/>
											</a>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
			<div class="header">
				<table class="content" cellpadding="0" cellspacing="0" width="930px" height="100%" align="center">
					<tr>
						<td class="left-side"></td>
						<td class="logo" width="165" valign="top">
							<a href="${pageContext.servletContext.contextPath}">
								<img src="${pageContext.servletContext.contextPath}/img/page/logo.png"/>
							</a>
						</td>
						<td class="middle-header" align="left">
							<jsp:invoke fragment="header_middle"/>
						</td>
						<td align="right" class="mainmenu">
							<a href="home.jsp">Home</a>
							<span class="vr"></span>
							<a href="#" id="useraccountmenu" r:context="session" r:name="showProfileMenu">
								Hi 
								<span class="capitalized">
									${fn:toLowerCase(SESSION_INFO.firstname)}
								</span>
								&nbsp;&nbsp;&#9660;
							</a>
							<!-- useraccount menu panel -->
							<div id="usermenu" style="display:none; width:100px;">
								<ul>
									<li>
										<a href="profile.jsp" onclick="return false;">Edit Profile</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/logout.jsp">Logout</a>
									</li>
								</ul>
							</div>
						</td>
						<td class="right-side"></td>
					</tr>
				</table>
			</div>

			<!-- feedback panel -->
			<c:if test="${showFeedback == 'true'}">
				<script type="text/javascript">
					$put(
						'feedback',
						new function() {
							
							var self = this;
							var shown = false;
							this.entity = {};
							
							this.toggleFeedbackBox = function() {
								var fb = $('#feedback');
								var left = shown? -(fb.find('.box')[0].offsetWidth+3) : 0;
								fb.stop().animate({left: left});
								shown = !shown;
							};
							
							this.submit = function() {
								ProxyService.lookup("FeedbackService").send( this.entity );
								this.entity = {};
								$('#feedback .info').fadeIn().delay(1000).fadeOut('', function(){
									self.toggleFeedbackBox();
								});
							}
							
						}
					);
					
					//calculate feedback box position
					$(window).load(function(){
						var fb = $('#feedback').css('opacity', 0).show();
						var box = fb.find('.box');
						fb.css({left: -(box[0].offsetWidth+3)})
						  .animate({opacity: 1});
					});
				</script>
				<table id="feedback" style="display:none">
					<tr>
						<td>
							<div class="box">
								<div class="info" style="display:none">Feedback sucessfully posted.</div>
								<table cellspacing="0" height="100%" width="100%">
									<tr>
										<td height="10px">
											<em>*</em> <label for="comments">Leave a Feedback</label>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<textarea id="comments" 
													  r:context="feedback" 
													  r:name="entity.comment" 
													  r:required="true" 
													  r:caption="Feedback"
													  rows="6">
											</textarea>
										</td>
									</tr>
									<tr>
										<td align="right" height="10px">
											<button r:context="feedback" r:name="submit">Submit</button>
										</td>
									</tr>
								</table>
							</div>
						</td>
						<td>
							<a r:context="feedback" r:name="toggleFeedbackBox" r:immediate="true">
								<img src="${pageContext.servletContext.contextPath}/img/feedback.gif">
							</a>
						</td>
					</tr>
				</table>
			</c:if>
			<jsp:invoke fragment="sections"/>
		</body>
	</html>	
</c:if>
