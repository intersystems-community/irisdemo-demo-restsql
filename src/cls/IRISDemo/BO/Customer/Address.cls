/// Description
Class IRISDemo.BO.Customer.Operation.Address Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor)
{

Property street As %String;

Property city As %String;

Property state As %String;

Property ZIP As %String;

Storage Default
{
<Data name="ClassNameState">
<Value name="1">
<Value>street</Value>
</Value>
<Value name="2">
<Value>city</Value>
</Value>
<Value name="3">
<Value>state</Value>
</Value>
<Value name="4">
<Value>ZIP</Value>
</Value>
</Data>
<State>ClassNameState</State>
<StreamLocation>^PackageName.ClassNameS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
