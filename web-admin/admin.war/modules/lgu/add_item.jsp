<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>


<t:popup>
	<jsp:attribute name="head">
	<script>
		$put(
			'add_item',
			new function() 
			{
				this.entity = {};
				this.saveHandler;
				this.lgutype;
				
				this.save = function() {
					if( this.saveHandler )
						this.saveHandler( this.entity );
					this.entity = {};
					$('#idxno').focus();
				}
			}
		);
	</script>
	</jsp:attribute>
	
	<jsp:attribute name="rightactions">
		<ui:button context="add_item" action="save" caption="+Add"/>
		<ui:button context="add_item" action="_close" caption="Close" immediate="true"/>
	</jsp:attribute>
	
	<jsp:body>
		<div r:type="label" r:context="add_item">
			<h3>Add #{lgutype}</h3>
		</div>
		<div class="hr"></div>
		<ui:form context="add_item" object="entity">
			<ui:text name="indexno" caption="Index No." required="true" size="10" id="idxno"/>
			<ui:text name="lguname" caption="Name" required="true" size="30"/>
		</ui:form>	
	</jsp:body>
</t:popup>

