<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tag import="java.util.*" %>
<%@ tag dynamic-attributes="params" %>

<%@ attribute name="caption" %>
<%@ attribute name="action" %>
<%@ attribute name="immediate" %>
<%@ attribute name="visibleWhen" %>
<%@ attribute name="context" %>


<button class="form-action" type="button" r:context="${context}" r:name="${action}"
<c:if test="${! empty depends}"> r:depends="${depends}" </c:if>
<c:if test="${! empty immediate}"> r:immediate="${immediate}" </c:if>
<c:if test="${! empty visibleWhen}"> r:visibleWhen="${visibleWhen}" </c:if>
<c:forEach items="${params}" var="p"> ${p.key}="${p.value}" </c:forEach>>
	${caption}
	<jsp:doBody/>
</button>


