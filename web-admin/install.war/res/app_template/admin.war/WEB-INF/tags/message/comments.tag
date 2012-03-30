<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/common" prefix="common" %>
<%@ tag import="com.rameses.web.support.*" %>
<%@ tag import="com.rameses.server.common.*" %>
<%@ tag import="java.util.*" %>

<%@ attribute name="context" %>
<%@ attribute name="commentList" %>
<%@ attribute name="usersMap" %>
<%@ attribute name="removeAction"%>
<%@ attribute name="emptyText"%>


<table class="message comments" r:context="${context}" r:model="${commentList}" r:varName="comment" 
       cellpadding="0" cellspacing="0" width="100%" r:emptyText="${empty emptyText? 'No comments posted yet.' : emptyText}">
	<tr>
		<td valign="top" rowspan="2" class="msg-divider"  r:context="${context}" width="40px">
			<img src="profile/photo.jsp?id=#{comment.userid}&t=thumbnail&v=#{${usersMap}[comment.userid].info.photoversion}" width="30px"/>
		</td>
		<td valign="top" class="message-head" style="padding-left:4px">
			<span class="sendername">#{${usersMap}[comment.userid].lastname}, #{${usersMap}[comment.userid].firstname} </span>
		</td>
		<td align="right" class="message-head">
			<span style="color:gray;font-weight:normal;font-size:9px;"><i>Posted #{comment.dtposted}</i></span>
		</td>
	</tr>
	<tr>	
		<td valign="top" colspan="2" style="padding-left:4px">
			#{comment.message}
		</td>
	</tr>
	<tr>
		<td colspan="3"><div class="message-hr"></div></td>
	</tr>
</table>


