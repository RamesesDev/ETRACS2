

<h2>1. Specify Server Info</h2>
<table width="100%">
	<tr>
		<td class="caption">Name of server</td>
		<td class="input-column"><input type="text" r:context="installer" r:name="info.appname"/></td>
		<td><label r:context="installer" r:visibleWhen="#{errors.appname}" class="err-label">Server Name is required</label></td>
	</tr>
	<tr>
		<td class="caption">Formal name of LGU</td>
		<td class="input-column"><input type="text" r:context="installer" r:name="info.lguname" style="width:250px"/></td>
		<td><label r:context="installer" r:visibleWhen="#{errors.lguname}" class="err-label">LGU name is required</label></td>
	</tr>
	<tr>
		<td class="caption">Server IP Address</td>
		<td class="input-column"><input type="text" r:context="installer" r:name="info.server_ip"/></td>
		<td><label r:context="installer" r:visibleWhen="#{errors.server_ip}" class="err-label">Server IP is required</label></td>
	</tr>
	<tr>
		<td class="caption">Server Port</td>
		<td class="input-column"><input type="text" r:context="installer" r:name="info.server_port"/></td>
		<td><label r:context="installer" r:visibleWhen="#{errors.server_port}" class="err-label">Server port is required</label></td>
	</tr>

</table>
<br>
<a r:context="installer" r:name="verifyServerInfo"class="button">Next</a>
