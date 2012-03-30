<table cellspacing="0" cellpadding="0" border="0" width="100%">
	<tr>
		<td valign="top" width="50%">
			<span class="section-title">Personal Information</span>
			<table cellspacing="0" cellpadding="0" width="100%" border="0">
				<tr>
					<td align="right">
						<span class="caption">Last Name</span> *
					</td>
					<td>
						<input type="text" size="30"
							r:context="student_appform" r:name="student.lastname" r:required="true" 
							r:caption="Last Name" r:textcase="upper">
					</td>
				</tr>
				<tr>
					<td align="right">
						<span class="caption">First Name</span> *
					</td>
					<td>
						<input type="text" size="30"
							r:context="student_appform" r:name="student.firstname" r:required="true"
							r:caption="First Name" r:textcase="upper">
					</td>
				</tr>
				<tr>
					<td align="right">
						<span class="caption">Middle Name</span>
					</td>
					<td>
						<input type="text" size="30"
							r:context="student_appform" r:name="student.middlename" 
							r:caption="Middle Name" r:textcase="upper">
					</td>
				</tr>
				<tr>
					<td align="right">
						<span class="caption">Gender</span> *
					</td>
					<td>
						<select r:context="student_appform" r:name="student.gender" r:items="genderList" 
						        r:itemLabel="label" r:itemKey="id" r:allowNull="true" r:required="true" r:caption="Gender">
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						<span class="caption">Citizenship</span> *
					</td>
					<td>
						<select r:context="student_appform" r:name="student.citizenship" r:items="citizenshipList" 
						        r:allowNull="true" r:required="true" r:caption="Citizenship">
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						<span class="caption">Civil Status</span> *
					</td>
					<td>
						<select r:context="student_appform" r:name="student.civilstatus" r:items="civilStatusList" 
						        r:allowNull="true" r:required="true" r:caption="Civil Status">
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						<span class="caption">Place of Birth</span>
					</td>
					<td>
						<input type="text" r:context="student_appform" r:name="student.birthplace" r:required="false" 
						       r:caption="Date of Birth" r:textcase="upper">
					</td>
				</tr>
				<tr>
					<td align="right">
						<span class="caption">Date of Birth</span>
					</td>
					<td>
						<span r:context="student_appform" 
						 r:type="datetime" 
						 r:name="student.birthdate"
						 r:options="{mode:'date'}">
				   </span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<span class="caption">Religion</span>
					</td>
					<td>
						<input type="text" size="30"
							r:context="student_appform" r:name="student.religion" r:required="false" 
							r:caption="Religion" r:textcase="upper">
					</td>
				</tr>
				<tr>
					<td align="right">
						<span class="caption">Email</span>
					</td>
					<td>
						<input type="text" size="50"
							   r:context="student_appform" r:name="student.email" r:required="false" 
							   r:caption="Email Address">
					</td>
				</tr>
			</table>
		</td>
		<td valign="top" width="50%">
			<span class="section-title">Profile Picture</span>
			<div class="section" r:context="student_appform" r:type="label">
				<img class="student-photo" src="${pageContext.request.contextPath}/photo/temp/#{student.objid}"/>
				<input type="file" 
					  r:context="student_appform" 
					  r:caption="#{student.temp_photodir? 'Change':'Upload'} Photo"
					  r:oncomplete="upload_complete"
					  r:name="file"
					  r:url="upload.jsp"
					  r:params="{objid: '#{student.objid}'}"/>
			</div>
			
			<br/>
			<span class="section-title">Contact Information</span>
			<table r:context="student_appform" r:items="student.contactinfo" r:varStatus="n" 
					cellspacing="0" cellpadding="0" width="80%" r:name="selectedContact">
				<tbody>
					<tr>
						<td>
							<select r:context="student_appform" r:items="contactTypeList" r:name="student.contactinfo[#{n.index}].type"></select>
						</td>
						<td>
							<input type="text" class="text"
								r:context="student_appform"
								r:name="student.contactinfo[#{n.index}].value"
								r:hint="Value"/>
						</td>		
						<td class="controls">
							<a r:context="student_appform" r:name="deleteContact" r:immediate="true">
								X
							</a>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<td colspan="3">
						<button r:context="student_appform" r:name="addContact" r:immediate="true">
							Add
						</button>
					</td>
				</tfoot>
			</table>
		</td>
	</tr>
</table>