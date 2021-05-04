/// Description
Class IRISDemo.BO.Customer.Operation.CreateOrUpdateCustomerReq Extends (%Persistent, Ens.Request)
{

Property Name As %String;

Property SSN As %String;

Property MobilePhone As %String;

Property HomeStreet As %String;

Property HomeCity As %String;

Property HomeState As %String;

Storage Default
{
<Data name="CreateOrUpdateCustomerReqDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>SSN</Value>
</Value>
<Value name="4">
<Value>MobilePhone</Value>
</Value>
<Value name="5">
<Value>HomeStreet</Value>
</Value>
<Value name="6">
<Value>HomeCity</Value>
</Value>
<Value name="7">
<Value>HomeState</Value>
</Value>
</Data>
<DataLocation>^IRISDemo.B52AF.CreateOrUpdAE95D</DataLocation>
<DefaultData>CreateOrUpdateCustomerReqDefaultData</DefaultData>
<IdLocation>^IRISDemo.B52AF.CreateOrUpdAE95D</IdLocation>
<IndexLocation>^IRISDemo.B52AF.CreateOrUpdAE95I</IndexLocation>
<StreamLocation>^IRISDemo.B52AF.CreateOrUpdAE95S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
