Class IRISDemo.Production Extends IRISDemo.BaseProduction
{

XData ProductionDefinition
{
<Production Name="IRISDemo.Production" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Customer Operations" Category="" ClassName="IRISDemo.BO.Customer.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="Credentials">XPTOBankDB</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:IRIS://localhost:1972/USER</Setting>
    <Setting Target="Adapter" Name="JGService">Java Gateway Service</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.intersystems.jdbc.IRISDriver</Setting>
  </Item>
  <Item Name="Java Gateway Service" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Customer Services" Category="" ClassName="IRISDemo.BS.Customer.Service" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
