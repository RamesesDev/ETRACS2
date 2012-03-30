<%
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", -1); 
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/common/ui" prefix="common" %>


<t:public redirect_session="false">
	<jsp:attribute name="head">
		<script src="${pageContext.servletContext.contextPath}/js/ext/datetime.js"></script>
	</jsp:attribute>

	<jsp:attribute name="style">
		.form .caption {
			font-size:12px;
			font-style:italic;
		}
		.form table {
			font-size:12px;
			font-family:'Arial'
		}
		.form table tr td {
			padding:3px;
		}
		.form .section-title {
			font-weight:bold;
		}
		.form .student-photo {
			box-shadow: 0 2px 5px #aaa;
			-webkit-box-shadow: 0 2px 5px #aaa;
			-moz-box-shadow: 0 2px 5px #aaa;
		}
	</jsp:attribute>

	<jsp:body>
		
		<script>
			<common:uid prefix="SAP" var="STUD_APPID"/>
			<common:loadmodules name="modules"/>
		
			$put("student_appform", 
				new function() {
					var self = this;
					
					this.selectedContact;
					
					this.student = {
						objid: "${STUD_APPID}",
						contactinfo:[],
						primaryaddress:{},
						secondaryaddress:{},
						fathersinfo:{},
						mothersinfo:{},
						guardianinfo:{},
					};
					
					this.otherCitizenship;
					this.otherCivilstatus;
					
					this.genderList = [ 
						{id:"M", label:"Male"}, 
						{id:"F", label:"Female"}
					];
					this.citizenshipList = ["Filipino", "American","German","Taiwanese"];
					this.civilStatusList = ["Single","Married","Divorced","Widowed"];
					
					this.studentTypeList = ["New Student","Transferee","Cross Enrollee","Returnee"];
					
					this.addressTypeList = ["Home","Work"];
					this.contactTypeList = ["HOMEPHONE", "WORKPHONE", "MOBILE", "HOMEFAX", "WORKFAX"];
					
					this.propertyChangeListener = {
						"otherCitizenship" : function(o) {
							if(self.student.citizenship === "others")
								self.student.citizenship = o;
						}
					}
					
					this.submit = function() {
						MsgBox.confirm(
							'You are about to submit this application.\nPlease check all the entries. Proceed?',
							function() {
								var svc = ProxyService.lookup( "StudentApplicantService" );
								var result = svc.submit(  self.student );
								window.location.href = "success.jsp?appno=" + result.appno; 
							}
						);
					}

					this.addContact = function() {
						this.student.contactinfo.push({type:"", value:""});
					}
					
					this.deleteContact = function() {
						this.student.contactinfo.remove(this.selectedContact);
					}
					
					this.lookupProgram = function() {
						return new PopupOpener("program:lookup",{selectHandler: function(o){
							self.student.programid = o.objid;
							self.student.programcode = o.code;
							self.student.programtitle = o.title;
							self.student.programyearlevels = o.yearlevels;
						}});
					}
					
					this.file;
					this.upload_complete = function() {
						this.student.temp_photodir = this.file.temp_photodir;
						this.file = null;
						this._controller.refresh();
					}
					
					//content toggle visibility flag
					this.shownFields = {
						guardianinfo: true
					};
					
				}
			);
		</script>
		
		<div class="form">
			<h2>Application for New Students</h2>		
			<div class="hr"></div>
			
			<div class="section" r:context="student_appform" r:type="label">
				<span class="section-title">Program Information</span>
				<table>
					<tr>
						<td class="caption" align="right">
							Program Code *
						</td>
						<td>
							<b>#{student.programcode}</b>
							<div style="position:absolute;top:-100px;left:-100px;">
								<input type="text" r:context="student_appform" r:name="student.programid" r:required="true" r:caption="Program"/>
							</div>
						</td>
					</tr>
					<tr>
						<td class="caption" align="right">
							Title *
						</td>
						<td>
							<b>#{student.programtitle}</b>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<button r:context="student_appform" r:name="lookupProgram" r:immediate="true">
								#{student.programid ? 'Change' : 'Select'} Program
							</button>
						</td>
					</tr>
					<tr>
						<td class="caption" align="right">
							Student Type
						</td>
						<td>
							<select r:context="student_appform" r:name="student.apptype">
								<option value="New">New</option>
								<option value="Transferee">Transferee</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="hr"></div>
			
			<div class="section">
				<jsp:include page="new_form/personal.jsp"/>
			</div>
			
			<div class="hr"></div>
			
			<div class="section">
				<span class="section-title">Primary Address</span>
				<jsp:include page="new_form/address.jsp">
					<jsp:param name="address" value="student.primaryaddress"/>
					<jsp:param name="caption" value="Primary Address"/>
				</jsp:include>
			</div>
			
			<div class="section">
				<input type="checkbox" r:context="student_appform" r:name="shownFields.secondaryaddress" />
				<span class="section-title">Secondary Address</span>
				<div r:context="student_appform" r:visibleWhen="#{shownFields.secondaryaddress}"
					 r:depends="shownFields.secondaryaddress">
					<jsp:include page="new_form/address.jsp">
						<jsp:param name="address" value="student.secondaryaddress"/>
						<jsp:param name="caption" value="Secondary Address"/>
					</jsp:include>
				</div>
			</div>
			
			<div class="hr"></div>

			<div class="section">
				<input type="checkbox" r:context="student_appform" r:name="shownFields.guardianinfo" />
				<span class="section-title">Legal Guardian</span>
				<div r:context="student_appform" r:visibleWhen="#{shownFields.guardianinfo}"
					 r:depends="shownFields.guardianinfo">
					<jsp:include page="new_form/personinfo.jsp">
						<jsp:param name="info" value="student.guardianinfo"/>
						<jsp:param name="caption" value="Guardian"/>
					</jsp:include>
				</div>
			</div>
			
			<div class="section">
				<input type="checkbox" r:context="student_appform" r:name="shownFields.fathersinfo" />
				<span class="section-title">Father's Information</span>
				<div r:context="student_appform" r:visibleWhen="#{shownFields.fathersinfo}"
					 r:depends="shownFields.fathersinfo">
					<jsp:include page="new_form/personinfo.jsp">
						<jsp:param name="info" value="student.fathersinfo"/>
						<jsp:param name="caption" value="Father"/>
					</jsp:include>
				</div>
			</div>
			
			<div class="section">
				<input type="checkbox" r:context="student_appform" r:name="shownFields.mothersinfo" />
				<span class="section-title">Mother's Information</span>
				<div r:context="student_appform" r:visibleWhen="#{shownFields.mothersinfo}"
					 r:depends="shownFields.mothersinfo">
					<jsp:include page="new_form/personinfo.jsp">
						<jsp:param name="info" value="student.mothersinfo"/>
						<jsp:param name="caption" value="Mother"/>
					</jsp:include>
				</div>
			</div>
			
			<div class="section">
				<button type="button" r:context="student_appform" r:name="submit">Submit</button>
			</div>
		</div>
	
	
	</jsp:body>

</t:public>

