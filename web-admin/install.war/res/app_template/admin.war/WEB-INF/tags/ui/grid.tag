<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/ui" prefix="ui" %>
<%@ tag import="java.util.*" %>
<%@ tag dynamic-attributes="params" %>
<%@ attribute name="context" %>
<%@ attribute name="items" %>
<%@ attribute name="model" %>
<%@ attribute name="hideCols" %>
<%@ attribute name="name" %>
<%@ attribute name="varStatus" %>
<%@ attribute name="varName" %>
<%@ attribute name="width" %>
<%@ attribute name="styleClass" %>

<%
	Map m = (Map)jspContext.getAttribute("params");
	if(items!=null) m.put( "r:items", items );
	if(model!=null) m.put( "r:model", model );
	m.put( "r:name", (name==null) ? "selectedItem" : name );
%>

<table class="grid ${styleClass}" r:context="${context}" 
      <c:forEach items="${params}" var="p"> ${p.key}="${p.value}" </c:forEach> 
	  cellpadding="0" cellspacing="0" 
	  r:varName="${empty varName? 'item' : varName}" 
	  r:varStatus="${empty varStatus? 'status' : varStatus}" 
	  width="${empty width? '100%' : width}">
	<c:if test="${hideCols != true}">
		<c:set var="_datatable_processing" scope="request" value="cols"/>
		<thead>
			<tr><jsp:doBody/></tr>
		</thead>
	</c:if>	
	<c:set var="_datatable_processing" scope="request" value="rows"/>
	<tbody>
		<tr><jsp:doBody/></tr>
	</tbody>
</table>
<div class="grid-controls" r:context="${context}" r:visibleWhen="#{${model}.rows > 0}">
	<ui:button action="${model}.moveFirst" caption="First"/>
	<ui:button action="${model}.movePrev" caption="Previous"/>
	<ui:button action="${model}.moveNext" caption="Next"/>
</div>

<%request.removeAttribute("_datatable_processing");%>

