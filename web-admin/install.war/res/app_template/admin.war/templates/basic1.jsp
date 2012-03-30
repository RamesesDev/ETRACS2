<%@ taglib tagdir="/WEB-INF/tags/personalization" prefix="p" %>

<table width="100%" border="1" height="100%">
	<tr>
		<td height="50">Place your header here</td>
	</tr>
	<tr>	
		<td valign="top">
			<p:getContent pageid="${param['pageid']}" section="body"/>
		</td>
	</tr>
</table>