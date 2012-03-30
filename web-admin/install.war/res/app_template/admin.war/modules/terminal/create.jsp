<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:popup>
	<jsp:attribute name="head">
		<script src="${pageContext.servletContext.contextPath}/js/ext/datetime.js"></script>
		<script>
		
			$put( "terminal_create", 
				new function() {
					var svc = ProxyService.lookup( "TerminalService");
					this.saveHandler;	
					this.terminal = {};
					this.orgunitList;
					this.orgunit;
					var self = this;
					this.onload = function() {
						var osvc = ProxyService.lookup("OrgunitService");
						this.orgunitList = osvc.getUserOrgunits({});
						if( this.orgunitList.length > 0 ) {
							this.orgunit = this.orgunitList.find( function(z) {  return z.objid == self.orgunit.objid } ); 	
						}	
					}
					
					this.propertyChangeListener = {
						"orgunit" : function(x) {
							self.terminal.parentid = x.objid;
							self.terminal.parentcode = x.code;
							self.terminal.parenttype = "orgunit";
						}
					}
					
					this.save = function() {
						svc.allocate( this.terminal );	
						this.saveHandler();
						return "_close";
					}
				}
			);
		</script>
	</jsp:attribute>

	<jsp:attribute name="rightactions">
		<ui:button context="terminal_create" action="save" caption="Save"/>
	</jsp:attribute>
	
	<jsp:body>
		<ui:context name="terminal_create">
			<ui:form>
				<ui:combo caption="Org Unit" required="true" items="orgunitList" name="orgunit" itemLabel="title" allowNull="true" emptyText="select an org units"/>
				<ui:number name="terminal.size" required="true" caption="No of Units " size="2" />
			</ui:form>
		</ui:context>	
	</jsp:body>
</t:popup>

