<table>
	<tr>
		<td align="right">
			<span class="caption">Name: *</span>
		</td>
		<td>
			<input type="text" size="40"
				r:context="student_appform" r:name="${param.info}.name"
				r:required="true" r:caption="${param.caption}: Name"
				r:textcase="upper">
		</td>
	</tr>
	<tr>
		<td align="right">
			<span class="caption">Occupation: *</span>
		</td>
		<td>
			<input type="text" r:context="student_appform" r:name="${param.info}.occupation"
			       r:required="true" r:caption="${param.caption}: Occupation"
				   r:textcase="upper">
		</td>
	</tr>
	<tr>
		<td align="right">
			<span class="caption">Address: *</span>
		</td>
		<td>
			<input type="text" size="50"
				r:context="student_appform" r:name="${param.info}.address"
				r:required="true" r:caption="${param.caption}: Address"
				r:textcase="upper">
		</td>
	</tr>
	<tr>
		<td align="right">
			<span class="caption">Phone: *</span>
		</td>
		<td>
			<input type="text" r:context="student_appform" r:name="${param.info}.phone"
			       r:required="true" r:caption="${param.caption}: Phone"
				   r:textcase="upper">
		</td>
	</tr>
</table>