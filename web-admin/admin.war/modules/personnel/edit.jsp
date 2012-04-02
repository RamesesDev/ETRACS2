<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/common" prefix="com" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>


<t:popup>
	<jsp:attribute name="head">
		<script src="${pageContext.servletContext.contextPath}/js/ext/datetime.js"></script>
		<script>
		
			$put( "personnel_edit", 
				new function() {
					var svc = ProxyService.lookup( "PersonnelService");
					this.info;
					this.saveHandler;
					this.save = function() {
						svc.update( this.info );	
						this.saveHandler();
						return "_close";
					}
				}
			);
		</script>
	</jsp:attribute>

	<jsp:attribute name="rightactions">
		<ui:button context="personnel_edit" action="save" caption="Save"/>
	</jsp:attribute>
	
	<jsp:body>
		<ui:context name="personnel_edit">
			<ui:form object="info">
				<ui:text name="staffno" required="true" caption="Staff No : "/>
				<ui:text name="lastname" required="true" caption="Last Name : " size="40"/>
				<ui:text name="firstname" required="true" caption="First Name : " size="40"/>
				<ui:text name="middlename" caption="Middle Name: " size="40"/>
				<ui:date name="birthdate" caption="Birthdate" />
				<ui:radio name="gender" required="true" caption="Gender : " options="{M:'Male', F:'Female'}" orientation="vertical"/>
				<ui:text name="email" required="true" caption="Email : " textcase="none" size="40"/>
			</ui:form>
		</ui:context>
	</jsp:body>
</t:popup>

