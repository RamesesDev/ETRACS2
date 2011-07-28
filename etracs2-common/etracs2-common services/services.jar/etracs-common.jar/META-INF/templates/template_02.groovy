<div style="background:#666666; margin:5pt 5pt">
<table cellspacing="1" width="100%">
   <% if(title != '') { %>
   <tr>
      <% if(cols == null || cols == 0)
            cols = 1
      %>
      <td colspan="${cols}"class="innertitle">
         $title
      </td>
   </tr>
   <% } %>
   
   <% def captionList=[] 
      def valueList=[]
      for(i in items) {
         if(i.caption == null)
            captionList.add('')
         else
            captionList.add(i.caption)
            
         if(i.value == null)
            valueList.add('')
         else
            valueList.add(i.value)
      }

   %>
   
   <tr>
      <% def a = 0
         def b = (int)(captionList.size()/cols + captionList.size()%cols)
         for(c in 1..cols) { %>
            <td valign="top">
               <table>
               <% for(d in a..b - 1) {%>
                  <tr>
                     <td>
                        ${captionList[d]}
                     </td>
                     <td>
                     :
                     </td>
                     <td>
                        ${valueList[d]}
                     </td>
                  </tr>
               <% } 
                  if(c == 1)
                     a = b
                  else
                     a += (int)(captionList.size()/cols)
              
                  b = (int)(captionList.size()/cols) + a %>
               </table>
            </td>
      <% } %>
   </tr>
</table>
</div>
<br>
