<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/common" prefix="common" %>
<%@ tag import="com.rameses.web.support.*" %>
<%@ tag import="com.rameses.server.common.*" %>
<%@ tag import="java.util.*" %>

<%@ attribute name="context" %>
<%@ attribute name="messagewidth" %>
<%@ attribute name="picSize" %>
<%@ attribute name="usersIndex" %>

<%@ attribute name="msgtype" %>
<%@ attribute name="channelid" %>
<%@ attribute name="threadid" %>

<%@ attribute name="showComments" %>
<%@ attribute name="showPost" %>
<%@ attribute name="canRemove" %>

<style>
	#sendername {
		color: darkslateblue;
		font-size:12px;
		font-weight:bold;
	}
	.msg-divider {
		padding-top:2px;
		border-top:1px solid lightgrey;
	}
	.notifycount {
		background-color: yellow;
		color:red;
		font-size:11px;
		font-weight:bold;
		padding:2px;
		font-family: verdana, arial;
		text-align:center;
		border: 1px solid orange;
	}
</style>

<script>
	$put(
		"${context}",
		new function() {
			var svc = ProxyService.lookup("MessageService");
			var self = this;
			this._controller;
			this.channelid = "${channelid}";
			this.message = {};
			this.eof = "false";
			
			this.users = {};
			<c:if test="${!empty usersIndex}">
			this.users = ${usersIndex};	
			</c:if>

			
			this.listModel = {
				fetchList: function( p, last ){
					var m = {channelid: self.channelid};
					m.msgtype = "${msgtype}";
					<c:if test="${! empty threadid}">
					m.threadid = "${threadid}";
					</c:if>
					if(last) m.lastmsgid = last.objid; 
					var list =  svc.getMessages( m );
					if(list.length==0) {
						self.eof = "true";
					}	
					return list;
				}
			};
			
			this.onload = function() {
				Session.handler = function( o ) {
					if(o.channelid == self.channelid && o.msgtype == '${msgtype}') {
						self.listModel.prependItem( o );
					}
					else if( o.channelid == self.channelid && o.msgtype == '${msgtype}-removed') {
						self.listModel.refresh(true);
					}
					else if( o.channelid == self.channelid && o.msgtype == '${msgtype}-response') {
						var msgid = o.msgid;
						var thread = self.listModel.getList().find(function(x) { return x.objid == msgid } );
						if(thread) {
							self.comments[msgid] = svc.getResponses( {objid: msgid, msgtype: "${msgtype}" } );
							thread.replies = self.comments[msgid].length;
							if(thread.expanded != "true" ) {
								self.comments[msgid] = null;
								if(thread.notifycount==null) thread.notifycount = 0;
								thread.notifycount = thread.notifycount+1;
							}
							self.listModel.refresh();
						}	
					}
				}
			}
			
			this.send = function() {
				if(!this.message.message) {
					alert( "Please write a message");
					return;
				}
				<c:if test="${! empty threadid}">
				this.message.threadid = "${threadid}"; 	
				</c:if>
				this.message.msgtype = "${msgtype}";
				this.message.channelid = this.channelid;
				svc.send( this.message );
				this.message = {}
			}
			
			this.comment = function() {
				var saveHandler = function(o) {
					var m = {};
					m.msgid = self.selectedMessage.objid;
					m.senderid = self.selectedMessage.userid;
					m.channelid = self.channelid;
					m.message = o;
					svc.sendResponse( m );
				}
				return new DropdownOpener("comment", {saveHandler: saveHandler});
			}
			
			this.selectedMessage;
			this.comments = {}
			
			this.viewComments = function() {
				var msgid = this.selectedMessage.objid;
				this.selectedMessage.expanded = "true";
				this.selectedMessage.notifycount = null;
				if( !this.comments[msgid] ) {
					this.comments[msgid] = svc.getResponses( {objid: msgid } );
				}
			}
			this.hideComments = function() {
				this.selectedMessage.expanded = null;
				this.comments[this.selectedMessage.objid] = null;
			}
			
			this.removeMessage = function() {
				if(confirm("Removing this message will also remove associated comments. Continue?")) {
					svc.removeMessage( {objid: this.selectedMessage.objid, channelid: this.channelid, msgtype: "${msgtype}"} );
				}
			}
		}
	);	
</script>

<c:if test="${showComments != 'false'}">
	<div id="comment_tpl" style="display:none;">
		<br/>
		<table class="comments" r:context="${context}" r:items="comments[params.objid]" r:varName="comment" 
			cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td valign="top" rowspan="2" class="msg-divider"  r:context="${context}">
					<img src="profile/photo.jsp?id=#{comment.userid}&t=thumbnail&v=#{users[comment.userid].info.photoversion}" width="30px"/>
				</td>
				<td valign="top"  id="sendername" class="msg-divider" style="padding-left:4px">
					#{users[comment.userid].lastname}, #{users[comment.userid].firstname} 
					<span style="font-size:11px;color:gray;font-weight:normal;"> - Posted #{comment.dtposted}</span>
				</td>
			</tr>
			<tr>	
				<td valign="top"  style="padding-left:4px">
					#{comment.message}
				</td>
			</tr>
		</table>
	</div>
</c:if>

<c:if test="${showPost != 'false'}">
	<div class="post-message" style="width:90%">
		<div r:context="${context}" r:type="textarea" r:name="message.message" r:hint="Post message." class="inner">
			<div class="controls-wrapper">
				<div class="controls">
					<div class="right">
						<button r:context="${context}" r:name="send">Post</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>

<br/>
<table width="90%" r:context="${context}" r:model="listModel" r:varName="item" r:varStatus="stat" cellpadding="0" border="0"
	r:emptyText="No messages posted yet" cellspacing="0" class="${context}" r:name="selectedMessage">
	<tbody>
		<tr>
			<td valign="top" align="center" class="msg-divider" rowspan="${showComments != 'false'? '3' : '2'}">
				<img src="profile/photo.jsp?id=#{item.userid}&t=thumbnail&v=#{users[item.userid].info.photoversion}}" width="${!empty picSize ? picSize : '40px'}"/>
			</td>
			<td valign="top" id="sendername"  class="msg-divider" style="padding-left:4px;">
				#{users[item.userid].lastname}, #{users[item.userid].firstname}	
				<span style="font-size:11px;color:gray;font-weight:normal;"> - Posted #{item.dtposted}</span>
			</td>
			<td align="right" style="padding-right:2px;"  class="msg-divider">
				<c:if test="${canRemove}">
					<a r:context="${context}" r:name="removeMessage" title="remove message">x</a>
				</c:if>
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
						<a r:context="${context}" r:name="comment">Comment</a>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a r:context="${context}" r:name="viewComments" r:visibleWhen="#{item.expanded != 'true'}">View Comments (#{item.replies})</a>
						<a r:context="${context}" r:name="hideComments" r:visibleWhen="#{item.expanded == 'true'}">Hide Comments (#{item.replies})</a>
						&nbsp;
						<label r:context="${context}" class="notifycount" title="New comments unread" r:visibleWhen="#{item.notifycount}">#{item.notifycount}</label>
					</div>
					<div>
						<template r:context="${context}" r:id="comment_tpl" r:params="{objid:'#{item.objid}'}" />
					</div>
				</td>
			</tr>
		</c:if>
	</tbody>
</table>
<a r:context="${context}" r:name="listModel.fetchNext" r:visibleWhen="#{eof=='false'}">View More</a>
