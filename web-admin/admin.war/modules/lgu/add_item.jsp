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
				this.mode = 'create';
				
				this.save = function() {
					if( this.saveHandler )
						this.saveHandler( this.entity );
					this.entity = {};
					if( this.mode == 'create' )
						$('#idxno').focus();
					else
						return '_close';
				}
			}
		);
	</script>
	</jsp:attribute>
	
	<jsp:attribute name="rightactions">
		<ui:button context="add_item" action="save" caption="+Add" visibleWhen="#{mode=='create'}"/>
		<ui:button context="add_item" action="save" caption="Save" visibleWhen="#{mode!='create'}"/>
		<ui:button context="add_item" action="_close" caption="Close" immediate="true"/>
	</jsp:attribute>
	
	<jsp:body>
		<div r:type="label" r:context="add_item">
			<h3>#{mode=='create'? 'Add' : 'Edit'} #{lgutype}</h3>
		</div>
		<div class="hr"></div>
		<div r:context="add_item" r:visibleWhen="#{mode=='create'}">
			<ui:form context="add_item" object="entity">
				<ui:text name="indexno" caption="Index No." required="true" size="10" id="idxno"/>
				<ui:text name="lguname" caption="Name" required="true" size="30"/>
			</ui:form>
		</div>
		<div r:context="add_item" r:visibleWhen="#{mode!='create'}">
			<ui:form context="add_item" object="entity">
				<ui:label caption="Index No." rtexpression="true">#{entity.indexno}</ui:label>
				<ui:text name="lguname" caption="Name" required="true" size="30"/>
			</ui:form>
		</div>
	</jsp:body>
</t:popup>

