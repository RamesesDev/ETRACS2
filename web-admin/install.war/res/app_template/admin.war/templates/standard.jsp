<%@ taglib tagdir="/WEB-INF/tags/personalization" prefix="p" %>

<table width="100%" border="1" height="100%">
	<tr>
		<td valign="top" width="150">
			<p:getContent pageid="${param['pageid']}" section="leftpanel"/>
		</td>
		<td valign="top">
			<p:getContent pageid="${param['pageid']}" section="body"/>
		</td>
	</tr>
</table>