<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/common" prefix="common" %>
<%@ tag import="com.rameses.web.support.*" %>
<%@ tag import="com.rameses.server.common.*" %>
<%@ tag import="java.util.*" %>

<%@ attribute name="context" %>
<%@ attribute name="name" %>
<%@ attribute name="model" %>
<%@ attribute name="usersMap" %>
<%@ attribute name="postCommentAction"%>
<%@ attribute name="commentName"%>
<%@ attribute name="commentHint"%>
<%@ attribute name="showComments" rtexprvalue="true" type="java.lang.Object"%>


<table width="100%" r:context="${context}" r:model="${model}" r:varName="item" r:varStatus="stat" cellpadding="0" border="0"
	r:emptyText="No messages posted yet" cellspacing="0" class="message" r:name="${name}">
	<tbody>
		<tr>
			<td valign="top" align="center" rowspan="${showComments != 'false'? '3' : '2'}">
				<img src="profile/photo.jsp?id=#{item.userid}&t=thumbnail&v=#{${usersMap}[item.userid].info.photoversion}" width="${!empty picSize ? picSize : '40px'}"/>
			</td>
			<td valign="top" class="message-head" style="padding-left:4px;">
				<span class="sendername">
					#{${usersMap}[item.userid].lastname}, #{${usersMap}[item.userid].firstname}
				</span>
				<span style="font-size:11px;color:gray;font-weight:normal;"> - Posted #{item.dtposted}</span>
			</td>
			<td align="right" valign="top" class="message-head" style="padding-right:2px;">
				<a r:context="${context}" r:name="${model}.removeItem" r:visibleWhen="#{'${SESSION_INFO.userid}' == item.userid }"
				   title="remove message"  class="remove">
					x
				</a>
			</td>
		</tr>
		<tr>
			<td valign="top" colspan="2" style="padding-top:5px;padding-bottom:5px;padding-left:4px;">
				#{item.message}	
			</td>
		</tr>
		<c:if test="${showComments != 'false'}">
			<tr>
				<td valign="bottom" colspan="2" style="padding-left:4px;">
					<div>
						<a r:context="${context}" r:name="${model}.showComments" r:visibleWhen="#{item._expanded != 'true'}">View Comments (#{item.replies})</a>
						<a r:context="${context}" r:name="${model}.hideComments" r:visibleWhen="#{item._expanded == 'true'}">Hide Comments (#{item.replies})</a>
						&nbsp;
						<label r:context="${context}" class="notifycount" title="New comments unread" r:visibleWhen="#{item.notifycount!=null}">#{item.notifycount}</label>
					</div>
					<div class="ui-widget ui-widget-content" style="padding: 2px 4px; width:90%;">
						<template r:context="${context}" r:id="comment_tpl" r:params="{objid:'#{item.objid}'}" />
						<c:if test="${not empty commentName and not empty postCommentAction}">
							<div class="comment" style="margin-top:2px;">
								<div class="hint-wrapper" style="width:100%;">
									<input r:context="${context}" r:name="${commentName}" 
										   r:action="${postCommentAction}" r:hint="${empty commentHint? 'Write a comment' : commentHint}"
										   type="text" class="text" style="width:99%;margin:0;margin-bottom:4px;"/>
								</div>
							</div>
						</c:if>
					</div>
				</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="3">
				<div class="message-hr"></div>
				<br/>
			</td>
		</tr>
	</tbody>
</table>
<a r:context="${context}" r:name="${model}.fetchNext" r:visibleWhen="#{${model}.isEOF()=='false'}">View More</a>

<c:if test="${showComments != 'false'}">
	<div id="comment_tpl" style="display:none;">
		<table class="message comments" r:context="${context}" r:items="${model}.getCommentsIndex()[params.objid]"
			r:varName="comment" r:collapseWhenEmpty="true" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td valign="top" rowspan="2" class="msg-divider"  r:context="${context}" width="40px">
					<img src="profile/photo.jsp?id=#{comment.userid}&t=thumbnail&v=#{${usersMap}[comment.userid].info.photoversion}" width="30px"/>
				</td>
				<td valign="top" class="message-head" style="padding-left:4px">
					<span class="sendername">#{${usersMap}[comment.userid].lastname}, #{${usersMap}[comment.userid].firstname} </span>
					<span style="color:gray;font-weight:normal;"> - Posted #{comment.dtposted}</span>
				</td>
			</tr>
			<tr>	
				<td valign="top"  style="padding-left:4px">
					#{comment.message}
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="hr"></div>
				</td>
			</tr>
		</table>
	</div>
</c:if>


