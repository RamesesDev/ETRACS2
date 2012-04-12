<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.*,java.util.*" %>

<%
  File f  = new File( System.getProperty("jboss.server.home.dir") + "/apps/install.war//installed" );
  if( f.exists() ) {
	   response.sendRedirect( "/admin" );
  }
%>

<html>

	<head>
		<link href="style.css" rel="stylesheet"/>
		<link href="${pageContext.servletContext.contextPath}/js/lib/css/jquery-ui/jquery.css" type="text/css" rel="stylesheet" />
		<script src="${pageContext.servletContext.contextPath}/js/lib/jquery-all.js"></script>
		<link href="${pageContext.servletContext.contextPath}/js/lib/css/rameses-lib.css" type="text/css" rel="stylesheet" />
		<script src="${pageContext.servletContext.contextPath}/js/lib/rameses-ext-lib.js"></script>
		<script src="${pageContext.servletContext.contextPath}/js/lib/rameses-ui.js"></script>
		<style>
			.err-label {color:red;}
			.caption {
				width: 150px;
			}
			.input-column{ 
				width:250px;
				vertical-align:top;
			}
			#selected-step {
				background-color: orange;
				color: white;				
			}
			.step {
				padding: 4px; 
				font-family: arial;
			}
			.step-gap {
				padding: 4px;
			}
		</style>
		<script>
			$put( "installer",
				new function() {
					this.info = {
						server_ip: '<%=System.getProperty("jboss.bind.address")%>',
						server_port: "8080",
						dbhost: "localhost",
						adminuser: "admin",
					}
					this.errors = {}
					this.db = {}
					this.step = "start";
					var self = this;
					
					this.drivers = [
						{caption: "MySQL", id:"mysql"},
						{caption: "SQL Server",  id:"mssql"},
					]
					this.verifyServerInfo = function() {
						this.errors = {}
						var hasErrs = false;
						if(!this.info.appname) {this.errors.appname = true; hasErrs = true;}
						if(!this.info.lguname) {this.errors.lguname = true; hasErrs = true;}
						if(!this.info.server_ip) {this.errors.server_ip = true; hasErrs = true;}
						if(!this.info.server_port) {this.errors.server_port = true; hasErrs = true;}
						if(! hasErrs ){
							this.step = "step1";
							return "step1";
						}	
					}
					
					this.verifyDbInfo = function() {
						this.errors = {}
						var hasErrs = false;
						if(!this.info.dbhost) {this.errors.dbhost = true; hasErrs = true;}
						if(!this.info.dbuser) {this.errors.dbuser = true; hasErrs = true;}
						if(!this.info.dbpwd) {this.errors.dbpwd = true; hasErrs = true;}
						if(!this.info.c_dbpwd) {this.errors.c_dbpwd = true; hasErrs = true;}
						if(! hasErrs ){
							if( this.info.dbpwd != this.info.c_dbpwd ) {
								alert("Password must match the confirmed password");
								return;
							}
							this.step = "step2";
							return "step2";
						}	
					}
					
					var startProcessing = function() {
						self.message = 'Building server configuration...';
						$invoke( "install.jsp", self.info, function(hreq) {
							var msg = hreq.responseText;
							if( msg ) msg = msg.trim();
							if( msg != 'DONE' ) {
								alert( msg );
								self._controller.navigate('step2');
								return;
							}
							self.message = 'Deploying server configuration...';
							self._controller.refresh();
							waitForDeployment();
						});
					}
					
					var waitForDeployment = function() {
						var oncomplete = function(req) {
							if( req.status != 200 ) {
								setTimeout( waitForDeployment, 1500 );
							}
							else {
								location.href = 'completed.jsp';
							}
						}
						$invoke( "/admin", null, oncomplete, "get" );
					}
					
					this.verifyAdminInfo = function() {
						this.errors = {}
						var hasErrs = false;
						if(!this.info.adminpwd) {this.errors.adminpwd = true; hasErrs = true;}
						if(!this.info.c_adminpwd) {this.errors.c_adminpwd = true; hasErrs = true;}
						if(! hasErrs ){
							if( this.info.adminpwd != this.info.c_adminpwd ) {
								alert("Password must match the confirmed password");
								return;
							}
							
							if( confirm("You are about to start the installation process. Continue?")) {
								startProcessing();
								this.step = "processing";
								return "processing";
							}
							
						}
					}
					
				},
				{
					"default" : "installer_start.jsp",
					"step1" : "installer_step1.jsp",
					"step2" : "installer_step2.jsp",
					"processing" : "installer_processing.jsp",
				}
			);	
		</script>
	</head>

	<body>
		<table width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td valign="top" width="250px">
					<img src="img/etracs.png" height="70px" width="230px"/>
					<br>
					
					<label r:context="installer">
						<div class="step-gap"><label class="step" id="#{step == 'start' ? 'selected-step' : 'unselected-step'}">Server Info</label></div>
						<div class="step-gap"><label class="step" id="#{step == 'step1' ? 'selected-step' : 'unselected-step'}">Database Info</label></div>
						<div class="step-gap"><label class="step" id="#{step == 'step2' ? 'selected-step' : 'unselected-step'}">Admin Info</label></div>
						<div class="step-gap"><label class="step" id="#{step == 'processing' ? 'selected-step' : 'unselected-step'}">Processing</label></div>
					</label>
				</td>
				
				<td valign="top">
					<h1>Welcome to ETRACS version 2.0 Installation</h1>
					<div r:controller="installer"></div>
				</td>
			</tr>
		</table>
	
	</body>
	
</html>