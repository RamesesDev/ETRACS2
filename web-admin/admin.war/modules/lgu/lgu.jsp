<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>

<t:popup>
	<jsp:attribute name="head">
		<script src="${pageContext.servletContext.contextPath}/js/ext/datetime.js"></script>
		<style>
			div.grid-title { height: 35px; }
			div.grid-title h3 { margin-right: 10px; }
			.sublgu .grid tr.selected { background: #ddd; }
			.sublgu .grid td { cursor: default; }
		</style>
		<script>
		
			$put( 
				"lgu", 
				new function() 
				{				
					var svc = ProxyService.lookup( "LguService");
					var self = this;
					var barangays;
					var districtList;
					
					this.province = {};
					this.sys = {};
					this.entity;
					this.lgutypes = ['PROVINCE', 'CITY', 'MUNICIPALITY'];
					
					this.onload = function() {
						this.entity = svc.getHostLgu();
						if( !this.entity ) {
							this.entity = {};
							return 'init';
						}
						
						if( this.entity.lgutype == 'MUNICIPALITY' ) {
							this.province = this.entity.province;
							this.selectedDistrict = this.entity;
							barangays = this.barangays;
							return 'municipality';
						}
						
						districtList = this.entity.munidistricts;
						return 'info';
					}
					
					this.next = function() 
					{
						this.entity = svc.createHostLgu({lgu:this.entity, province:this.province, sys:this.sys});
						if( this.entity.lgutype == 'MUNICIPALITY' ) {
							this.province = this.entity.province;
							this.selectedDistrict = this.entity;
							return 'municipality';
						}
						
						return 'info';
					},
					
					//used for district or municipality
					this.districtModel = {
						fetchList: function(o) {
							return districtList;
						}
					};
					
					var saveDistrict = function( item ) {
						if( item.indexno.length != 2 ) throw new Error( 'Invalid Index No.' );
						
						if( self.entity.lgutype != 'CITY' ){
							item.pin = self.entity.indexno + "-" + item.indexno;
							item.objid = item.pin;
							item.lgutype = 'MUNICIPALITY';
							item.formalname = 'MUNICIPALITY OF ' + item.lguname;
							item.parentid = self.entity.objid;
						} else{
							item.pin = self.entity.indexno + "-" + item.indexno;
							item.objid = item.pin;
							item.lgutype = 'DISTRICT';
							item.formalname = 'DISTRICT OF ' + item.lguname;
							item.parentid = self.entity.objid;
						}
						
						svc.create( item );
						reloadDistrictList();
					}
					
					var reloadDistrictList = function() {
						self.selectedDistrict = null;
						districtList = svc.getMunicipalityDistricts({objid: self.entity.objid});
						self.districtModel.load();
					}
					
					this.addDistrict = function() {
						return new PopupOpener('lgu:add_item', {saveHandler: saveDistrict, lgutype: 'District'});
					}
					
					this.editDistrict = function() {
						if(!this.selectedDistrict) return;
						var handler = function( item ) {
							svc.save( item );
							reloadDistrictList();
							self.selectedDistrict = item;
						}
						return new PopupOpener('lgu:add_item', {entity: this.selectedDistrict, saveHandler:handler, lgutype:'District', mode:'edit'},{title:'Edit'});
					}
					
					this.removeDistrict = function() {
						if( !this.selectedDistrict ) return;
						MsgBox.confirm(
							'Are you sure you want to remove this entry?',
							function() {
								svc.removeMuniDistrict( self.selectedDistrict );
								reloadDistrictList();
								self.barangayModel.load();
								self._controller.refresh();
							}
						);
					}
					
					this.barangayModel = {
						fetchList: function(o) {
							if( !self.selectedDistrict ) return;
							return svc.getLgusByParent( self.selectedDistrict.objid )
						}
					}
					
					var saveBrgy = function(item) {
						if( item.indexno.length < 3 || item.indexno.length > 4 ) throw new Error( 'Invalid Index No.' );
						
						item.pin = self.selectedDistrict.pin + "-" + item.indexno;
						item.objid = item.pin;
						item.lgutype = 'BARANGAY';
						item.formalname = 'BARANGAY ' + item.lguname;
						item.parentid = self.selectedDistrict.objid;
						
						svc.create( item );
						self.barangayModel.load();
					}
					
					this.addBarangay = function() {
						return new PopupOpener('lgu:add_item', {saveHandler: saveBrgy, lgutype: 'Barangay'});
					}
					
					this.editBarangay = function() {
						if(!this.selectedBarangay) return;
						var handler = function(item) {
							svc.save(item);
							self.barangayModel.load();
						};
						return new PopupOpener('lgu:add_item', {entity:this.selectedBarangay, saveHandler:handler, lgutype:'Barangay', mode:'edit'},{title:'Edit'});
					}
					
					this.removeBarangay = function() {
						if(!this.selectedBarangay) return;
						MsgBox.confirm(
							'Are you sure you want to remove this entry?',
							function() {
								svc.removeBarangay( self.selectedBarangay );
								self.barangayModel.load();
							}
						);
					}
					
					this.propertyChangeListener = {
						'selectedDistrict' : function() {
							self.barangayModel.load();
						}
					};
					
				},
				{
					"init" : "modules/lgu/lgu_init.jsp",
					"info" : "modules/lgu/lgu_info.jsp",
					"municipality" : "modules/lgu/lgu_info_municipality.jsp"
				}
			);
		</script>
	</jsp:attribute>
	
	<jsp:body>
		<div r:controller="lgu"></div>
	</jsp:body>
</t:popup>

