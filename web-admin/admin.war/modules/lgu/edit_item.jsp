<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					this.entity.orgunit = lgu.objid;
				}
				
				this.unregisterOrgunit = function() {
					if( confirm('You are about to unregister this from the orgunit. Proceed?') ) {
						var svc = ProxyService.lookup( "OrgunitService" );
						svc.remove({objid: this.entity.objid});
						this.entity.orgunit = null;
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
			<c:if test="${param.lgutype == 'Barangay'}">
				<br>
				<a r:context="${context}" r:name="registerOrgunit" r:visibleWhen="#{!entity.orgunit}">Register Orgunt</a>
				<a r:context="${context}" r:name="unregisterOrgunit" r:visibleWhen="#{entity.orgunit}">Unregister Orgunit</a>
			</c:if>
		</ui:context>	
	</jsp:body>
</t:popup>

