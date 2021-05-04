/// Description
Class IRISDemo.BO.Customer.Operation.CreateOrUpdateCustomerResp Extends (%Persistent, Ens.Request)
{

Property CustomerId As %String;

Storage Default
{
<Data name="CreateOrUpdateCustomerRespDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CustomerId</Value>
</Value>
</Data>
<DataLocation>^IRISDemo.B52AF.CreateOrUpdEB6ED</DataLocation>
<DefaultData>CreateOrUpdateCustomerRespDefaultData</DefaultData>
<IdLocation>^IRISDemo.B52AF.CreateOrUpdEB6ED</IdLocation>
<IndexLocation>^IRISDemo.B52AF.CreateOrUpdEB6EI</IndexLocation>
<StreamLocation>^IRISDemo.B52AF.CreateOrUpdEB6ES</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
