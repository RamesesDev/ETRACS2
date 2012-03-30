<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:content title="Settings">
	<jsp:attribute name="style">
		.category td {
			padding:4px;
			cursor: default;
		}
		.category tr.selected {
			background-color:orange;
			color:white;
		}
	</jsp:attribute>

	<jsp:attribute name="script">
		$put( "sysvar_list", 
			new function() {
				var svc = ProxyService.lookup( "Var" );
				var self = this;
				this.selectedItem;
	
				this.category;
				this.categoryList;
				
				this.onload = function() {
					this.categoryList = svc.getCategories();
					if(this.categoryList.length>0 ) this.category = this.categoryList[0];
				}
	
				this.listModel = {
					rows: 15,
					fetchList: function(o) {
						if(! self.category ) return [];
						o.category = self.category;
						return svc.getList(o);	
					}
				}
	
				this.reloadList = function() {
					self.listModel.refresh(true);	
				}
				
				this.edit = function() {
					var h = function(x) {
						svc.set( x.name, x.value );
						self.reloadList();
					}
					return new PopupOpener( "sysvar:edit", {info:this.selectedItem, saveHandler: h, datatype:this.selectedItem.datatype } );
				}
				
				this.propertyChangeListener = {
					"category" : function(x) {
						self.listModel.load();
					}
				}
			}
		);
	</jsp:attribute>

	
	<jsp:body>
		<ui:context name="sysvar_list" height="350px">
			<ui:panel cols="2" width="100%">
				<ui:section width="120px">
					<table class="category" r:context="${context}" r:items="categoryList" r:name="category" r:varName="item" width="100%">
						<tr>
							<td>#{item}</td>
						</tr>
					</table>
				</ui:section>
				<ui:section>
					<ui:grid model="listModel" width="100%">
						<ui:col name="name" caption="Name"/>
						<ui:col name="value" caption="Value" title="#{item.description}"/>
						<ui:col>
							<a r:context="sysvar_list" r:name="edit">
								<img src="${pageContext.servletContext.contextPath}/img/edit.gif"/>
							</a>
						</ui:col>
					</ui:grid>
				</ui:section>
			</ui:panel>
		</ui:context>
	</jsp:body>
</t:content>
