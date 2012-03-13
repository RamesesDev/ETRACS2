<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://ramesesinc.com/jsp/tags" prefix="r"%>

<%@ taglib tagdir="/WEB-INF/tags/ui-components" prefix="ui" %>
<%@ taglib tagdir="/WEB-INF/tags/common/server" prefix="common" %>
<%@ taglib tagdir="/WEB-INF/tags/templates" prefix="t" %>
<%@ page import="com.rameses.web.support.*" %>


<br/>
<c:out value="hello world"/>
<br/>
<r:groovy>
	//dev svc = LOOKUP_UTIL.lookupService("LoginService")
	//println svc
	
	def user = [:]
	user.name = 'sample name'
	
	request.setAttribute('user', user)
	
	out.write 'written from the groovy'
</r:groovy>

<br/>
user.name: ${user.name}
<br/>
<c:out value="hello world"/>
<r:groovy>
	out.write "user is $user"
	
	System.out.println "hello world $user"
</r:groovy>
<br/>
<c:out value="hello world"/>