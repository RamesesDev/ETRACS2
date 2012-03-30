<table width="100%">
   <tr>
      <td>
         <h1>$title</h1>
      </td>
   </tr>
   <tr>
      
      <td>
         <table>
            <tr  style="color:red; font-weight:bold">
               <% if(state != '') {%>
                  <td>
                        State
                  </td>
                  <td>
                     :
                  </td>
                  <td>
                     $state
                  </td>
               <% } %>
            </tr>
            <% for(a in 0..subheaders.size() - 1) {%>
               <tr>
                  <td>
                     ${subheaders[a].caption}
                  </td>
                  <td>
                     :
                  </td>
                  <td style="font-weight:bold">
                     <% if(subheaders[a].value != null) { %>
                        ${subheaders[a].value}
                     <% } %>   
                  </td>
               </tr>
            <% } %>
         </table>
      </td>
   </tr>
</table>
