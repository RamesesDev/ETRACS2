<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/server" prefix="s" %>

<%@ attribute name="title" %>
<%@ attribute name="subtitle" %>

<%@ attribute name="contenthead" fragment="true"%>
<%@ attribute name="actions" fragment="true" %>

<%@ attribute name="script" fragment="true"%>
<%@ attribute name="style" fragment="true"%>
<%@ attribute name="head" fragment="true"%>
<%@ attribute name="sections" fragment="true"%>
<%@ attribute name="rightpanel" fragment="true"%>
<%@ attribute name="rightpanelwidth" %>


<c:if test="${!empty SESSIONID}">
	<s:invoke service="SessionService" method="getInfo" params="${SESSIONID}" var="SESSION_INFO"/>
</c:if>

<c:if test="${! empty head}">
<jsp:invoke fragment="head"/>	
</c:if>

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

<table width="100%">
	<tr>
		<td class="contenthead" colspan="2">
			<jsp:invoke fragment="contenthead"/>
		</td>
	</tr>
	<tr>
		<td align="left" style="font-size:20px; color:darkslateblue;">
			<b>${title}</b>
			<c:if test="${!empty subtitle}">
				<br><i style="font-size:12px;color:darkslateblue;font-family:verdana,arial">${subtitle}</i>
			</c:if>
		</td>
		<td align="right">
			<jsp:invoke fragment="actions"/>
		</td>
	</tr>
	<tr>
		<td align="left" colspan="2" valign="top" style="${not empty title ? 'border-top:1px solid lightgrey;' : ''} padding-top:10px;">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td valign="top">
						<jsp:doBody/>	
					</td>
					<c:if test="${! empty rightpanel}">
						<td valign="top" width="${! empty rightpanelwidth ? rightpanelwidth : 150}">
							<jsp:invoke fragment="rightpanel"/>
						</td>
					</c:if>	
				</tr>
			</table>
			
		</td>
	</tr>
</table>

<jsp:invoke fragment="sections"/>	
