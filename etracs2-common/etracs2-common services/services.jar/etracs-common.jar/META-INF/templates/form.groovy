<br>
<table>
   <tr>
      <td style="font-weight:bold">$title</td>
   </tr>
   <% for(i in data) {%>
      <tr>
         <td>
            $i.caption
         </td>
         <td style="font-weight:bold">
            <% if(i.value != null) {%>
               $i.value
            <% } %>
         </td>
      </tr>
   <% } %>
</table>
<br>

