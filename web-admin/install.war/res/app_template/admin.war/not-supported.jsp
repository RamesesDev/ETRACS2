<!DOCTYPE html>
<html>
	<head>
		<title>Gazeebu Classroom</title>
		<link href="${pageContext.servletContext.contextPath}/css/public.css" type="text/css" rel="stylesheet" />		

		<style>
		.browsers { margin:0; padding:0; }
		.browsers li { list-style:none; float:left; width: 130px; margin: 5px 10px; }
		.browsers div { text-align: center; }
		</style>
	</head>
	<body>
		<div class="head">
			<table width="850px" align="center" height="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td id="topmenu" align="left" valign="center">
						<a href="${pageContext.servletContext.contextPath}">
							<img src="img/biglogo25.png">	
						</a>
					</td>
					<td id="topmenu" align="right" valign="top">&nbsp;</td>
				</tr>
			</table>
		</div>
		
		<table width="850px" align="center" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td class="middle" valign="top" style="padding-top: 20px;">
					<h1>Your browser is no longer supported.</h1>
					<p>
						Gazeebu no longer supports your browser. Please upgrade your browser
					</p>
					<ul class="browsers">
						<li>
							<a href="http://www.google.com/chrome/?hl=en">
								<div>
									<img src="${pageContext.request.contextPath}/img/browsers/chrome-80.png"/>
								</div>
								<div>Download Chrome</div>
							</a>
						</li>
						<li>
							<a href="http://www.microsoft.com/windows/internet-explorer/default.aspx">
								<div>
									<img src="${pageContext.request.contextPath}/img/browsers/ie-80.png" />
								</div>
								<div>Download Internet Explorer</div>
							</a>
						</li>
						<li>
							<a href="http://www.mozilla.com/firefox/">
								<div>
									<img src="${pageContext.request.contextPath}/img/browsers/firefox-80.png" />
								</div>
								<div>Download Firefox</div>
							</a>
						</li>
						<li>
							<a href="http://www.apple.com/safari/download/">
								<div>
									<img src="${pageContext.request.contextPath}/img/browsers/safari-80.png" />
								</div>
								<div>Download Safari</div>
							</a>
						</li>
					</ul>
				</td>
			</tr>
		</table>
	</body>	
</html>	

