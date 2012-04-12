<html>
    <body>
        <h1>Rule: $rule.rulename</h1>
        $rule.description
        <hr>
        <br>
        <br>
        <h2>Conditions</h2>
        <% for( cond in rule.conditions ) { %>
            ${cond.displaytext}<br>
        <%}%>
        <br>
        <h2>Actions</h2>
         <% for( action in rule.actions ) { %>
            ${action.displaytext}<br>
            <%if (action.ranges) {%> 
                <table border="1">
                    <tr>
                        <th>Greater than or equal</th>
                        <th>Less than</th>
                        <th>Formula</th>
                    </tr>
                    <%action.ranges.each{%>
                        <tr>
                            <td>$it.from</td>          
                            <td>$it.to</td>
                            <td>$it.expr</td>
                        </tr>    
                    <%}%>    
                </table>
            <%}%>            
        <%}%>
    </body>
</html>
