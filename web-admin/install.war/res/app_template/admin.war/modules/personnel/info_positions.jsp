<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<ui:context name="personnelinfo">
	<ui:grid model="positionListModel" name="selectedPosition">
		<ui:col name="code" caption="Code" width="20%"/>
		<ui:col name="title" caption="Title"/>
		<ui:col name="role" caption="Role"/>
		<ui:col>
			<a r:context="${context}" r:name="unassignPosition">Unassign</a>
			&nbsp;&nbsp;&nbsp;
			<a r:context="${context}" r:name="viewPermissions">Permissions</a>
		</ui:col>
	</ui:grid>
</ui:context>