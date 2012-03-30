<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>


<h2>LGU Information</h2>
<div class="hr"></div>

<ui:context name="lgu">
	<ui:form>
		<ui:combo name="entity.lgutype" caption="LGU Type" items="lgutypes" required="true"/>
		<ui:text name="entity.indexno" caption="Index No." size="10" required="true"/>
		<ui:text name="entity.lguname" caption="Name" size="30" required="true"/>
		<ui:text name="sys.lgu_address" caption="Address" size="30" required="true" size="50"/>
	</ui:form>
	<div r:context="${context}" r:visibleWhen="#{entity.lgutype!='PROVINCE'}" r:depends="entity.lgutype" style="display:none">
		<h3>Mayor Information</h3>
		<ui:form>
			<ui:text name="sys.mayor_name" caption="Name" size="30" required="true"/>
			<ui:text name="sys.mayor_title" caption="Mayor Title" size="30" required="true"/>
			<ui:text name="sys.mayor_office_name" caption="Office Name" size="30" required="true" size="50"/>
		</ui:form>
	</div>
	<div r:context="${context}" r:visibleWhen="#{entity.lgutype=='MUNICIPALITY'}" r:depends="entity.lgutype" style="display:none">
		<h3>Province Information</h3>
		<ui:form>
			<ui:text name="province.indexno" caption="Index No." size="10" required="true"/>
			<ui:text name="province.lguname" caption="Name" size="30" required="true"/>
		</ui:form>
	</div>
	<ui:button action="next" caption="Next"/>
</ui:context>

