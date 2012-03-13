<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<ui:form context="personnelinfo">
	<ui:label rtexpression="true" caption="Staff No : ">
		#{info.staffno}
	</ui:label>
	<ui:label rtexpression="true" caption="Last Name : ">
		#{info.lastname}
	</ui:label>
	<ui:label rtexpression="true" caption="First Name : ">
		#{info.firstname}
	</ui:label>
</ui:form>
