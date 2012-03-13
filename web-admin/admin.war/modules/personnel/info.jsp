<%@ taglib tagdir="/WEB-INF/tags/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:content title="Personnel Information">
	<jsp:attribute name="head">
		<style>
			.headmenu {
				background-color:red;
				padding:4px;
				padding-right:8px;
				padding-left:8px;
				color:white;
				font-size:11px;
			}
		</style>

		<script>
			$put( "personnelinfo", 
				new function() {
					var svc = ProxyService.lookup( "PersonnelService" );
					var self = this;
					this.info =  <s:invoke service="PersonnelService" method="read" params="${pageContext.request}" json="true" />;
					
					this.positionListModel = {
						fetchList: function(p) {
							return svc.getPositions( self.info.objid );
						}
					}
					
					this.selectedPosition;
					this.unassignPosition = function() {
						if( confirm("You are about to unassign this position. Continue?") ) {
							var psvc = ProxyService.lookup("JobpositionService");		
							psvc.unassign( {objid: this.selectedPosition.objid } );
							this.positionListModel.refresh(true);
						}
					}
					
					this.viewPermissions = function() {
						var jobid = this.selectedPosition.objid;
						var rsvc = ProxyService.lookup( "JobPermissionService" );	
						var result = rsvc.getPermissionsForAdmin({objid: jobid, role: this.selectedPosition.role });
						var params = {};
						params.modules = result.modules;
						params.saveHandler = function(x) {
							var p = {objid: jobid, modules: x };
							rsvc.updatePermissions( p );
							return "_close"; 
						};
						var p= new PopupOpener("admin:permission", params);
						p.title = "Job Role Permissions";
						return p;
					}
				},
				{
					"default": "modules/personnel/info_data.jsp",
					"positions": "modules/personnel/info_positions.jsp",
				}
			);
		</script>

	</jsp:attribute>

	<jsp:body>
		<table width="100%" cellpadding="4">
			<tr>
				<td>
					<a class="headmenu" r:name="_default" r:context="personnelinfo">Information</a>
				</td>
				<td>
					<a class="headmenu" r:name="_positions" r:context="personnelinfo">Positions</a>
				</td>
				<td width="100%">&nbsp;</td>
			</tr>
		</table>

		<div r:controller="personnelinfo"> </div>
		
	</jsp:body>
</t:content>
