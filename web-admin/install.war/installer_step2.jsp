<h2>3. Specify Administration</h2>
<table width="100%">
	<tr>
		<td colspan="3">
			Indicate the account for the administrator. 	
		</td>
	</tr>
	<tr>
		<td class="caption">Admin Password</td>
		<td class="input-column"><input type="password" r:context="installer" r:name="info.adminpwd"/></td>
		<td><label r:context="installer" r:visibleWhen="#{errors.adminpwd}" class="err-label">Admin password is required</label></td>
	</tr>
	<tr>
		<td class="caption">Confirm Password</td>
		<td class="input-column"><input type="password" r:context="installer" r:name="info.c_adminpwd"/></td>
		<td><label r:context="installer" r:visibleWhen="#{errors.c_adminpwd}" class="err-label">Confirm password is required</label></td>
	</tr>
</table>
<br>
<a r:context="installer" r:name="_step1" class="button">Back</a>&nbsp;&nbsp;
<a r:context="installer" r:name="verifyAdminInfo"class="button">Next</a>