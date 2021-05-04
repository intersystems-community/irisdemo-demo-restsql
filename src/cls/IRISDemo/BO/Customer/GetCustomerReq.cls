/// Description
Class IRISDemo.BO.Customer.Operation.GetCustomerReq Extends (%Persistent, Ens.Request)
{

Property CustomerId As %String [ Required ];

Storage Default
{
<Data name="GetCustomerReqDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CustomerId</Value>
</Value>
</Data>
<DataLocation>^IRISDemo.BO52AF.GetCustomerReqD</DataLocation>
<DefaultData>GetCustomerReqDefaultData</DefaultData>
<IdLocation>^IRISDemo.BO52AF.GetCustomerReqD</IdLocation>
<IndexLocation>^IRISDemo.BO52AF.GetCustomerReqI</IndexLocation>
<StreamLocation>^IRISDemo.BO52AF.GetCustomerReqS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
