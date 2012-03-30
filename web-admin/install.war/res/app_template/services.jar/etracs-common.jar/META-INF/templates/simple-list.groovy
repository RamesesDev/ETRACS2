<div style="background:#666666">
<table cellspacing="1" width="100%">
   <tr>
      <td colspan="${headers.size()}" style="font-weight:bold">
         $title
      </td>
   </tr>
   <tr>
      <% for(o in headers) {%>
         <td>$o.caption</td>      
      <% } %>   
   </tr>
   <% for(i in items) {%>
      <tr>
         <% for(o in headers) {%>
            <td>
               ${i.get(o.name)}
            </td> 
         <%}%>
      </tr>
   <% } %>
</table>
</div>

