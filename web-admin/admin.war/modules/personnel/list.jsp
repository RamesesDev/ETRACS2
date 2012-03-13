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
					
					this.qry = {};
					
					this.listModel = {
						rows: 10,
						fetchList: function(o) {
							o.staffno = (self.qry.staffno) ? self.qry.staffno : null;
							o.firstname = (self.qry.firstname) ? self.qry.firstname : null;
							o.lastname = (self.qry.lastname) ? self.qry.lastname : null;
							return svc.getList( o );	
						}
					}
		
					this.reloadList = function() {
						self.listModel.refresh(true);	
					}
		
					this.add = function() {
						return new PopupOpener( "personnel:create", {mode:"create", saveHandler: self.reloadList });
					}

					this.edit = function() {
						return new PopupOpener( "personnel:info", {saveHandler:self.reloadList, personnel:this.selectedItem, mode:"edit" } );
					}
		
					this.propertyChangeListener = {
						orgUnit : function(o) { self.reloadList() }
					}
					
					this.reset = function() {
						this.qry = {};
						self.reloadList();
					}
					
					this.show_search = true;
					this.toggleSearch = function() {
						this.show_search = !this.show_search;
					}
				}
			);
		</script>
	</jsp:attribute>

	<jsp:attribute name="actions">
		<ui:button action="add" caption="Add" context="personnellist"/>
	</jsp:attribute>
	
	<jsp:body>
		<ui:context name="personnellist">
			<div style="border:1px solid lightgrey;padding:10px;" r:context="personnellist" r:visibleWhen="#{show_search != true}">
				<table width="100%">
					<tr>
						<td>
							<b>Search Criteria: &nbsp;&nbsp;</b>
							<label r:context="personnellist" r:visibleWhen="#{qry.staffno}">Staff no like '#{qry.staffno}'.</label>
							<label r:context="personnellist" r:visibleWhen="#{qry.lastname}">Last name like '#{qry.lastname}'.</label>
							<label r:context="personnellist" r:visibleWhen="#{qry.firstname}">First name like '#{qry.firstname}'.</label>
						</td>
						<td rowspan="2" valign="top" align="right">
							<a r:context="personnellist" r:name="toggleSearch">Show Search</a> 
						</td>
					</tr>
				</table>
			</div>	
			<div style="border:1px solid lightgrey;padding:10px;" r:context="personnellist" r:visibleWhen="#{show_search == true}">
				<table width="100%">
					<tr>
						<td><input type="text" r:context="${context}" r:name="qry.staffno" textcase="upper"/></td>
						<td><input type="text" r:context="${context}" r:name="qry.lastname" textcase="upper"/></td>
						<td><input type="text" r:context="${context}" r:name="qry.firstname" textcase="upper"/></td>
						<td rowspan="2" valign="top">
							<input type="button" r:context="personnellist" r:name="reloadList" value="Search" r:immediate="true"/> 
							<input type="button" r:context="personnellist" r:name="reset" value="Reset" r:immediate="true"/> 						
						</td>
						<td rowspan="2" valign="top" align="right">
							<a r:context="personnellist" r:name="toggleSearch">Hide</a> 
						</td>
					</tr>
					<tr>
						<td><i>Staff No</i></td>
						<td><i>Last Name</i></td>
						<td><i>First Name</i></td>
					<tr>
				</table>
			</div>
		
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
