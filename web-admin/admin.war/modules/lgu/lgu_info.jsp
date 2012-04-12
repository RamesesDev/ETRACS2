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
	
	<div class="hr"></div>
	
	<ui:panel cols="2" width="100%">
		<ui:section class="sublgu" width="50%">
			<div r:type="label" r:context="lgu" class="clearfix grid-title">
				<h3 class="left">
					#{entity.lgutype == 'PROVINCE'? 'Municipality' : 'District'} Information
				</h3>
				<div class="left">
					<ui:button caption="+Add" action="addDistrict"/>
				</div>
			</div>
			<ui:grid model="districtModel" name="selectedDistrict">
				<ui:col caption="Index No." name="indexno" width="100px"/>
				<ui:col caption="Name" name="lguname"/>
				<ui:col width="10px">
					<a r:context="${context}" r:name="editDistrict" title="Edit">
						<img src="${pageContext.request.contextPath}/img/edit.gif"/>
					</a>
				</ui:col>
				<ui:col width="10px">
					<a r:context="${context}" r:name="removeDistrict" title="Remove">
						<img src="${pageContext.request.contextPath}/img/trash.gif"/>
					</a>
				</ui:col>
			</ui:grid>
		</ui:section>
		<ui:section class="sublgu" width="50%">
			<div class="clearfix grid-title">
				<h3 class="left">Barangay Information</h3>
				<div class="left">
					<ui:button caption="+Add" action="addBarangay" visibleWhen="#{selectedDistrict}" depends="selectedDistrict"/>
				</div>
			</div>
			<ui:grid model="barangayModel" name="selectedBarangay">
				<ui:col caption="Index No." name="indexno" width="100px"/>
				<ui:col caption="Name" name="lguname"/>
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
		</ui:section>
	</ui:panel>
</ui:context>
