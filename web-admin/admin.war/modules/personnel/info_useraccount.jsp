<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<div style="border:1px solid lightgrey;width:500px;padding:10px;">
	<ui:context name="personnelinfo">
		<ui:panel>
			<ui:section>
				<ui:form>
					<ui:label caption="Full Name" rtexpression="true">
						#{useraccount.lastname}, #{useraccount.firstname} #{useraccount.middlename}
					</ui:label>
					<ui:label caption="User Account" rtexpression="true">#{useraccount.uid}</ui:label>
					<ui:label caption="Email" rtexpression="true">#{useraccount.email}</ui:label>
					
					
				</ui:form>
			</ui:section>
			
			
			
			<ui:section align="center">
				<ui:button caption="Remove Login Account" action="removeLogin"/>
			</ui:section>
			
		</ui:panel>	
	</ui:context>
</div>	