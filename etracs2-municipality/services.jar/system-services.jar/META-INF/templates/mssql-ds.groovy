<datasources>
	<local-tx-datasource>
		<jndi-name>${data.dsname}</jndi-name>
		<connection-url>jdbc:sqlserver://${data.host}:1433;DatabaseName=${data.dbname};</connection-url>
		<driver-class>com.microsoft.sqlserver.jdbc.SQLServerDriver</driver-class> 
		<user-name>${data.user}</user-name>
		<password>${data.pwd}</password>
		<metadata>
			<type-mapping>MS SQLSERVER2000</type-mapping>
		</metadata>
		<min-pool-size>5</min-pool-size>
		<max-pool-size>50</max-pool-size>
		<check-valid-connection-sql>SELECT 1</check-valid-connection-sql>      
	</local-tx-datasource>
   
</datasources>
