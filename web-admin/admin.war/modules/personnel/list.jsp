<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:content title="Personnel">
	<jsp:attribute name="head">
		<script>
	
			$put( "personnellist", 
				new function() {
					var svc = ProxyService.lookup( "PersonnelService" );
		
					var self = this;
		
					this.selectedItem;
		
					this.listModel = {
						rows: 10,
						fetchList: function(o) {
							return svc.getList( o );	
						}
					}
		
					var reloadList = function() {
						self.listModel.refresh(true);	
					}
		
					this.add = function() {
						return new PopupOpener( "personnel:create", {mode:"create", saveHandler: reloadList });
					}

					this.edit = function() {
						return new PopupOpener( "personnel:info", {saveHandler:reloadList, personnel:this.selectedItem, mode:"edit" } );
					}
		
					this.propertyChangeListener = {
						orgUnit : function(o) { self.listModel.refresh(true); }
					}
				}
			);
		</script>
	</jsp:attribute>

	<jsp:body>
		<ui:context name="personnellist">
			<ui:button action="add" caption="Add"/>
			<ui:grid model="listModel" name="selectedItem">
				<ui:col name="staffno" caption="Staff No"/>
				<ui:col name="lastname" caption="Last Name"/>
				<ui:col name="firstname" caption="First Name"/>
				<ui:col>
					<a href="#personnel:info?objid=#{item.objid}">View</a>
				</ui:col>
			</ui:grid>
		</ui:context>
	</jsp:body>
</t:content>
