<%@ taglib tagdir="/WEB-INF/tags/server" prefix="s" %>

<s:invoke service="PersonalizedContentService" method="getPageInfo" params="${pageContext.request.servletPath}" var="PAGE_INFO"/>

<jsp:include page="/templates/${PAGE_INFO.template}.jsp">
	<jsp:param name="pageid" value="${PAGE_INFO.id}"/>
</jsp:include>


