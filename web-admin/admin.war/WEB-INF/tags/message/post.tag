<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/common" prefix="common" %>
<%@ tag import="com.rameses.web.support.*" %>
<%@ tag import="com.rameses.server.common.*" %>
<%@ tag import="java.util.*" %>

<%@ attribute name="context" %>
<%@ attribute name="name" %>
<%@ attribute name="action" %>
<%@ attribute name="hint" %>
<%@ attribute name="visibleWhen" rtexprvalue="true" type="java.lang.Object"%>


<c:if test="${visibleWhen != false}">
	<div class="post-message" style="width:100%">
		<div r:context="${context}" r:type="textarea" r:name="${name}" r:hint="${empty hint? 'Post message.' : hint}" class="inner">
			<div class="controls-wrapper">
				<div class="controls">
					<div class="right">
						<button r:context="${context}" r:name="${action}">Post</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>

