<table cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td align="right">
			<span class="caption">* Type:</span>
		</td>
		<td>
			<select r:context="student_appform" r:items="addressTypeList" r:name="${param.address}.type"
			        r:required="true" r:caption="${param.caption}: address type"
					r:emptyText="Select" r:allowNull="true">
			</select>
		</td>
	</tr>
	<tr>
		<td align="right">
			<span class="caption">* Address 1:</span>
		</td>
		<td>
			<input type="text" style="width:100%"
				r:context="student_appform" r:name="${param.address}.address1" 
				r:required="true" r:caption="${param.caption}: address1"
				r:textcase="upper">
		</td>
	</tr>
	<tr>
		<td align="right">
			<span class="caption">Address 2:</span>
		</td>
		<td>
			<input type="text"
				r:context="student_appform" r:name="${param.address}.address2" r:textcase="upper" style="width:100%">
		</td>
	</tr>
	<tr>
		<td align="right">
		</td>
		<td>
			<input type="text" r:context="student_appform" r:name="${param.address}.city" r:hint="City/Municipality"
			       r:required="true" r:caption="${param.caption}: city/municipality"
				   r:textcase="upper"> *
			<input type="text" r:context="student_appform" r:name="${param.address}.province" r:hint="Province"
			       r:required="true" r:caption="${param.caption}: province"
				   r:textcase="upper"> *
			<input type="text" r:context="student_appform" r:name="${param.address}.zipcode" r:hint="Zip Code" size="6"
			       r:required="true" r:caption="${param.caption}: zipcode"
				   r:textcase="upper"> *
		</td>
	</tr>
</table>