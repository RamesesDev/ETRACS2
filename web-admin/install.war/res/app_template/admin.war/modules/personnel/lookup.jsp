<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:popup>
	<jsp:attribute name="head">
		<script>
		
			$put( "personnellookup", 
				new function() {
					var svc = ProxyService.lookup( "PersonnelService" );
					this.selectHandler;
					this.selectedItem;
					this.myname;
			
					this.select = function() {
						this.selectHandler( this.selectedItem );
						return "_close";
					}
			
					this.lookupName = function(x) {
						return svc.getList( {lastname: x+"%"} );
					}
				}
			);
		</script>
	</jsp:attribute>

	<jsp:attribute name="rightactions">
		<input type="button" r:context="personnellookup" r:name="select" value="Select"/>			
	</jsp:attribute>
	
	<jsp:body>
		<ui:form context="personnellookup">
			<ui:suggest caption="Enter Last Name : " suggestName="selectedItem" 
				name="myname" suggestExpression="#{lastname}, #{firstname}" suggest="lookupName"/>
		</ui:form>
	</jsp:body>
</t:popup>
