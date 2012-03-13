<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<ui:form context="personnelinfo">
	<ui:label rtexpression="true" caption="Staff No">#{info.staffno}</ui:label>
	<ui:label rtexpression="true" caption="Last Name">#{info.lastname}</ui:label>
	<ui:label rtexpression="true" caption="First Name">#{info.firstname}</ui:label>
	<ui:label rtexpression="true" caption="Middle Name">#{info.middlename}</ui:label>
	<ui:label rtexpression="true" caption="Birthdate">#{info.birthdate}</ui:label>
	<ui:label rtexpression="true" caption="Gender">#{ (info.gender=='M') ? 'Male' : 'Female'}</ui:label>
	<ui:label rtexpression="true" caption="Email">#{ info.email }</ui:label>
</ui:form>
