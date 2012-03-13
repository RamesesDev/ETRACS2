<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:popup>
	<jsp:attribute name="head">
		<script src="${pageContext.servletContext.contextPath}/js/ext/datetime.js"></script>
		<script>
		
			$put( "personnel_create", 
				new function() {
					var svc = ProxyService.lookup( "PersonnelService");
			
					this.info =  {primaryaddress: {type:'HOME'}, contactinfo: [] };
					this.saveHandler;
			
					this.save = function() {
						svc.create( this.info );	
						this.saveHandler();
						return "_close";
					}
			
					this.selectedContact;
					this.contactTypes = ["HOME_PHONE", "WORK_PHONE", "MOBILE"];
					this.addContact = function() {
						this.info.contactinfo.push({});
					}
					this.removeContact = function() {
						this.info.contactinfo.remove( this.selectedContact );
					}
				}
			);
		</script>
	</jsp:attribute>

	<jsp:attribute name="rightactions">
		<ui:button context="personnel_create" action="save" caption="Save"/>
	</jsp:attribute>
	
	<jsp:body>
		<ui:context name="personnel_create">
			<ui:form object="info">
				<ui:text name="staffno" required="true" caption="Staff No : "/>
				<ui:text name="lastname" required="true" caption="Last Name : " size="40"/>
				<ui:text name="firstname" required="true" caption="First Name : " size="40"/>
				<ui:text name="middlename" caption="Middle Name: " size="40"/>
				<ui:text name="birthdate" caption="Birthdate"/>
				<ui:radio name="gender" required="true" caption="Gender : " options="{M:'Male', F:'Female'}" orientation="vertical"/>
				<ui:text name="email" required="true" caption="Email : " textcase="none" size="40"/>
			</ui:form>
			<h2>Primary Address</h2>
			<ui:form object="info.primaryaddress">
				<ui:text name="address1" required="true" caption="Address : " size="40"/>
				<ui:text name="address2" caption="" size="40"/>
				<ui:text name="city" required="true" caption="City/Town : " size="40"/>
				<ui:text name="province" required="true" caption="Province : " size="40"/>
				<ui:text name="zipcode" required="true" caption="Zip Code : "/>
			</ui:form>
			<h2>Contact Info</h2>
			<ui:grid items="info.contactinfo" name="selectedContact" varStatus="stat">
				<ui:col caption="Type" width="100px">
					<select r:context="personnel_create" r:items="contactTypes" r:name="info.contactinfo[#{stat.index}].type"></select>
				</ui:col>
				<ui:col>
					<input type="text" r:context="personnel_create" r:name="info.contactinfo[#{stat.index}].value" style="width:100%"/>
				</ui:col>
				<ui:col>
					<a r:context="personnel_create" r:name="removeContact" title="Remove" r:immediate="true">Remove</a>
				</ui:col>
			</ui:grid>
			<ui:button action="addContact" caption="Add" immediate="true"/>
		</ui:context>
	</jsp:body>
</t:popup>

