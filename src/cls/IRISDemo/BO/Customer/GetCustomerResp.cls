/// Description
Class IRISDemo.BO.Customer.Operation.GetCustomerResp Extends (%Persistent, Ens.Request)
{

Property Found As %Boolean [ InitialExpression = 0, Required ];

Property Name As %String;

Property SSN As %String;

Property MobilePhone As %String;

Property HomeStreet As %String;

Property HomeCity As %String;

Property HomeState As %String;

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
<Value>Name</Value>
</Value>
<Value name="4">
<Value>SSN</Value>
</Value>
<Value name="5">
<Value>MobilePhone</Value>
</Value>
<Value name="6">
<Value>HomeStreet</Value>
</Value>
<Value name="7">
<Value>HomeCity</Value>
</Value>
<Value name="8">
<Value>HomeState</Value>
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
