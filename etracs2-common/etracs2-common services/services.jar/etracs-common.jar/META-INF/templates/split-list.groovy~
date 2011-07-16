<table>
   <tr>
      <td>$title</td>
   </tr>
   <tr>
      <% for(a in 1..cols ){
            for(i in headers) {%>
            <td>
               $i.caption
            </td>
            <% }
         } %>
   </tr>
   
   <% def nameList=[] 
      for(i in items) {
         nameList.add(i.name)
      }
   %>
   <tr>
      <% def a = 0
         def b = (int)(nameList.size()/cols + nameList.size()%cols)
         for(c in 1..cols) { %>
            <td>
               <table>
               <% for(d in a..b - 1) {%>
                  <tr>
                     <td>
                        ${nameList[d]}
                     </td>
                  </tr>
               <% } 
                  if(c == 1)
                     a = b
                  else
                     a += (int)(nameList.size()/cols)
              
                  b = (int)(nameList.size()/cols) + a %>
               </table>
            </td>
      <% } %>
   </tr>
</table>

