<div style="background:#666666; margin:5pt 5pt">
<table cellspacing="1" width="100%">
   <% if(title != '') { %>
      <tr>
         <td colspan="${headers.size()}" class="innertitle">$title</td>
      </tr>
   <% } %>

   <tr>
      <% for(a in 0..headers.size() - 1) {%>
         <% if(headers[a] instanceof String) {%>
            <td>
               ${headers[a]}
            </td>
         <% } else if(headers[a] instanceof Map){ %>
            <td width="100%">
               ${headers[a].caption}
            </td>
      <%    }
         }%>
   </tr>
   
   <% if(items.size() > 1) { %>
      <tr>
         <% for(i in items) {%>
            <td>
               <table width="100%">
                  <% for(a in headers) {%>
                     <% for(b in i.get(a.name)) {%>
                        <tr>
                           <td valign="top">
                              $b
                           </td>
                        </tr>
                     <% } %>
                  <% } %>
               </table>
            </td>
         <% } %>
      </tr>
   <% } %>
   
   <% 
         if(leftItems != '' && rightItems != '' && data != '') {
            for(a in 0..leftItems.size() - 1) {%>
            <tr>
               <td>
                  ${leftItems[a]}
               </td>
               <td>
                  <table cellspacing="1" width="100%">
                    <% for(b in data.get(leftItems[a])) { %>
                       <tr>
                        <% for(c in rightItems) {%>
                           <td>
                              ${b.get(c)}
                           </td>
                        <% } %>
                       </tr>
                     <% } %>
                  </table>
               </td>
            </tr>
      <%
            }
      } %>
      
</table>
</div>
<br>
