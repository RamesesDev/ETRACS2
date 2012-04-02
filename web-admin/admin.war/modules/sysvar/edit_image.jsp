<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:popup>
	<jsp:attribute name="head">
		<script>
		
			$put( "sysvar_edit", 
				new function() {
					var svc = ProxyService.lookup( "Var");
					this.saveHandler;	
					this.info;
					this.file;
					
					this.save = function() {
						this.saveHandler(this.info);
						return "_close";
					}
					
					this.upload_complete = function() {
						this.info = this.file;
						this.file = null;
						this._controller.refresh();
					}
				}
			);
		</script>
	</jsp:attribute>

	<jsp:attribute name="rightactions">
		<ui:button context="sysvar_edit" action="save" caption="Save"/>
	</jsp:attribute>
	
	<jsp:body>
		<h1>Upload Image here</h1>
		<br/>
		<div r:type="label" r:context="sysvar_edit">
			<img src="#{info.value}?v=#{Math.random()}" height="130px"/>
			<br/>
			<div class="hr"></div>
			<input type="file"
				r:name="file"
				r:context="sysvar_edit" 
				r:caption="Upload Photo"
				r:oncomplete="upload_complete"
				r:params="{name: '#{info.name}'}"
				r:url="${pageContext.request.contextPath}/modules/sysvar/upload.jsp"/>
		</div>
	</jsp:body>
</t:popup>

