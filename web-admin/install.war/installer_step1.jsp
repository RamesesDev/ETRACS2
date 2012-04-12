<h2>2. Specify the database</h2>
<table width="100%">
	<tr>
		<td class="caption">Database</td>
		<td class="input-column"><select r:context="installer" r:name="info.dbscheme" r:items="drivers" r:itemLabel="caption" r:itemKey="id"></select></td>
		<td class="err-label"></td>
	</tr>
	<tr>
		<td class="caption">DB Host</td>
		<td class="input-column"><input type="text" r:context="installer" r:name="info.dbhost" style="width:100%"/></td>
		<td><label r:context="installer" r:visibleWhen="#{errors.dbhost}" class="err-label">DB host is required</label></td>
	</tr>
	<tr>
		<td class="caption">User name</td>
		<td class="input-column"><input type="text" r:context="installer" r:name="info.dbuser"/></td>
		<td><label r:context="installer" r:visibleWhen="#{errors.dbuser}" class="err-label">User is required</label></td>
	</tr>
	<tr>
		<td class="caption">Password</td>
		<td class="input-column"><input type="password" r:context="installer" r:name="info.dbpwd"/></td>
		<td><label r:context="installer" r:visibleWhen="#{errors.dbpwd}" class="err-label">Password is required</label></td>
	</tr>
	<tr>
		<td class="caption">Confirm Password</td>
		<td class="input-column"><input type="password" r:context="installer" r:name="info.c_dbpwd"/></td>
		<td><label r:context="installer" r:visibleWhen="#{errors.c_dbpwd}" class="err-label">Confirm password is required</label></td>
	</tr>
</table>
<br>
<a r:context="installer" r:name="_default"class="button">Back</a>&nbsp;&nbsp;
<a r:context="installer" r:name="verifyDbInfo"class="button">Next</a>
