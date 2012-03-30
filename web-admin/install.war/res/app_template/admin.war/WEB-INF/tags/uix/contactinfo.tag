<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tag dynamic-attributes="params" %>

<%@ attribute name="context"%>
<%@ attribute name="name" %>

<script>
	$put( "${context}_contact", 
		new function() {
			this.selectedContact;
			this.types = ["HOME", "WORK"];
			this.addContact = function() {
				$ctx('${context}').${name}.push({});
				$ctx('${context}')._controller.refresh();
			}
			this.getContact = function( x ) {
				return $ctx('${context}').${name}[x];
			}
			this.getContacts = function() {
				return $ctx('${context}').${name};	
			}
		}
	);	
</script>
<table r:context="${context}_contact" r:items="getContacts()" r:name="selectedContact" r:varName="item" r:varStatus="stat" border="1">
	<thead>
		<tr>
		<td>Type</td>
		<td>Value</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>
				<select r:context="${context}_contact" r:items="types" r:name="getContact(#{stat.index}).type"></select>
			</td>
			<td>
				<input type=text r:context="${context}_contact" r:name="getContact(#{stat.index}).value" />
			</td>
		</tr>	
	</tbody>
	<tfoot>
		<tr>
			<td colspan="2">
				<a r:context="${context}_contact" r:name="addContact" r:immediate="true">Add</a> 
			</td>
		</tr>	
	</tfoot>
</table>


