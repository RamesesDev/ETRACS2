<html>
    <style>
        body {font-size:9px;font-family:Arial }
        th { text-align:left; }
    </style>

    <body>
        <div bgcolor="lightgrey">
            <table width="100%" cellpadding="1">
                <%info.each {%>
                    <tr>
                        <th width="120" valign="top"><%=it.key%> : </th>
                        <td valign="top"><%=(it.value) ? it.value : ''%></td>
                    </tr>    
                <%}%>
            </table>
        </div>
    </body>
</html>