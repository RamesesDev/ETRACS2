<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>

<%@ attribute name="before_rendering" fragment="true" %>
<%@ attribute name="head" fragment="true" %>

<%@ attribute name="header_middle" fragment="true" %>
<%@ attribute name="profile" fragment="true" %>
<%@ attribute name="taskmenu" fragment="true" %>
<%@ attribute name="usermenu" fragment="true" %>

<t:secured>

	<jsp:attribute name="before_rendering">
		<jsp:invoke fragment="before_rendering"/>
	</jsp:attribute>

	<jsp:attribute name="head">
		<jsp:invoke fragment="head"/>
	</jsp:attribute>
	
	<jsp:attribute name="head">
		<jsp:invoke fragment="header_middle"/>
	</jsp:attribute>	
	
	<jsp:body>
		<table width="100%" height="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top" width="165" height="100%">
					<table width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td valign="top">
								<jsp:invoke fragment="profile"/>
							</td>
						</tr>
						<tr>
							<td valign="top">
								<jsp:invoke fragment="taskmenu"/>
							</td>
						</tr>
						<tr>
							<td valign="top">
								<jsp:invoke fragment="usermenu"/>
							</td>
						</tr>
					</table>
					
				</td>
				<td valign="top" height="100%">
					<table class="shadowbox" width="100%" height="100%">
						<tr>
							<td id="content" height="100%" valign="top">&nbsp;</td> 
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</jsp:body>

</t:secured>

