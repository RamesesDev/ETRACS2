<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>

<t:public redirect_session="false">
	
	Thank you for applying. Please remember the trace no. when applying.
	
	<h1>${param['appno']}</h1>
	
	<br>
	<i>Place enrollment instructions here</i>
	
</t:public>