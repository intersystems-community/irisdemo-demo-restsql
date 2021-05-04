/// Description
Class IRISDemo.BO.Customer.Operation.GetCustomerResp Extends (%Persistent, Ens.Request)
{

Property Found As %Boolean [ InitialExpression = 0, Required ];

Property CustomerInfo As IRISDemo.BO.Customer.Operation.CustomerInfo;

Storage Default
{
<Data name="GetCustomerRespDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Found</Value>
</Value>
<Value name="3">
<Value>CustomerInfo</Value>
</Value>
</Data>
<DataLocation>^IRISDemo.B52AF.GetCustomerD027D</DataLocation>
<DefaultData>GetCustomerRespDefaultData</DefaultData>
<IdLocation>^IRISDemo.B52AF.GetCustomerD027D</IdLocation>
<IndexLocation>^IRISDemo.B52AF.GetCustomerD027I</IndexLocation>
<StreamLocation>^IRISDemo.B52AF.GetCustomerD027S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
