<%@ taglib tagdir="/WEB-INF/tags/personalization" prefix="p" %>

<table width="100%" border="1" height="100%">
	<tr>	
		<td valign="top">
			<p:getContent pageid="${param['pageid']}" section="leftpanel"/>
		</td>
		<td valign="top">
			<p:getContent pageid="${param['pageid']}" section="body"/>
		</td>
		<td valign="top">
			<p:getContent pageid="${param['pageid']}" section="rightpanel"/>
		</td>
	</tr>
	
	<tr>
		<td height="50" colspan="3">Place footer here</td>
	</tr>
</table>