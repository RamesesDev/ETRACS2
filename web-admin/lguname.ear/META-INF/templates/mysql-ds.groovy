<datasources>

   <local-tx-datasource>
      <jndi-name>${data.dsname}</jndi-name>
        <connection-url>jdbc:mysql://${data.host}/${data.dbname}</connection-url>
        <driver-class>com.mysql.jdbc.Driver</driver-class>
        <user-name>${data.user}</user-name>
        <password>${data.pwd}</password>
        <min-pool-size>1</min-pool-size>
        <max-pool-size>20</max-pool-size>
		<check-valid-connection-sql>select 1</check-valid-connection-sql>
   </local-tx-datasource>


</datasources>