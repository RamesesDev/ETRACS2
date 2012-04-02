<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>


<t:popup>
	<jsp:attribute name="head">
	<script>
		$put(
			'edit_item',
			new function() 
			{
				this.entity = {};
				this.saveHandler;
				this.lgutype;
				
				this.save = function() {
					if( this.saveHandler )
						this.saveHandler( this.entity );
					return '_close';
				}
				
				this.registerOrgunit = function() {
					var svc = ProxyService.lookup( "OrgunitService" );
					var lgu = {
						objid: this.entity.objid,
						code: this.entity.lguname,
						title: this.entity.formalname,
						orgtype: "BARANGAY",
						reftype: "BARANGAY",
						refid: this.entity.objid
					}
					svc.create(lgu);
				}
				
				this.unregisterOrgunit = function() {
					if( confirm('You are about to unregister this from the orgunit. Proceed?') ) {
						var svc = ProxyService.lookup( "OrgunitService" );
						svc.remove({objid: this.entity.objid});
					}
				}
			}
		);
	</script>
	</jsp:attribute>
	
	<jsp:attribute name="rightactions">
		<ui:button context="edit_item" action="save" caption="Save"/>
		<ui:button context="edit_item" action="_close" caption="Close" immediate="true"/>
	</jsp:attribute>
	
	<jsp:body>
		<ui:context name="edit_item">
			<div r:type="label" r:context="${context}">
				<h3>Edit #{lgutype}</h3>
			</div>
			<div class="hr"></div>
			<ui:form context="${context}" object="entity">
				<ui:label caption="Index No." rtexpression="true">#{entity.indexno}</ui:label>
				<ui:text name="lguname" caption="Name" required="true" size="30"/>
			</ui:form>
			<br>
			<ui:button context="${context}" action="registerOrgunit" caption="Register Orgunt" immediate="true"/> 
			<ui:button context="${context}" action="unregisterOrgunit" caption="Unregister Orgunit" immediate="true"/> 
		</ui:context>	
	</jsp:body>
</t:popup>

