<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>


<h2>LGU Information</h2>
<div class="hr"></div>

<ui:context name="lgu">
	<ui:form>
		<ui:label caption="Index No." rtexpression="true">#{entity.indexno}</ui:label>
		<ui:label caption="Name" rtexpression="true">#{entity.lguname}</ui:label>
	</ui:form>
	
	<h3>Province</h3>
	<ui:form>
		<ui:label caption="Index No." rtexpression="true">#{province.indexno}</ui:label>
		<ui:label caption="Name" rtexpression="true">#{province.lguname}</ui:label>
	</ui:form>
	<div class="hr"></div>

	<div class="clearfix grid-title">
		<h3 class="left">Barangay Information</h3>
		<div class="left">
			<ui:button caption="+Add" action="addBarangay"/>
		</div>
	</div>
	<ui:grid model="barangayModel" name="selectedBarangay">
		<ui:col caption="Index No." name="indexno" width="100px"/>
		<ui:col caption="Name" name="lguname"/>
		<ui:col caption="Has Org?" width="50">
			<label r:context="${context}" r:visibleWhen="#{!!item.orgunit}">
				<img src="${pageContext.request.contextPath}/img/checked.png"/>
			</label>
			<label r:context="${context}" r:visibleWhen="#{!item.orgunit}">
				<img src="${pageContext.request.contextPath}/img/unchecked.png"/>
			</label>
		</ui:col>
		<ui:col width="10px">
			<a r:context="${context}" r:name="editBarangay" title="Edit">
				<img src="${pageContext.request.contextPath}/img/edit.gif"/>
			</a>
		</ui:col>
		<ui:col width="10px">
			<a r:context="${context}" r:name="removeBarangay" title="Remove">
				<img src="${pageContext.request.contextPath}/img/trash.gif"/>
			</a>
			</ui:col>
	</ui:grid>
</ui:context>
