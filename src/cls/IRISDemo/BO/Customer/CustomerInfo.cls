/// Description
Class IRISDemo.BO.Customer.Operation.CustomerInfo Extends (%SerialObject, %JSON.Adaptor, %XML.Adaptor)
{

Property firstName As %String(MAXLEN = 5);

Property middleName As %String;

Property lastName As %String;

Property DOB As %Date;

Property SSN As %String;

Property mobilePhone As %String;

Property address As Address;

Storage Default
{
<Data name="CustomerInfoState">
<Value name="1">
<Value>firstName</Value>
</Value>
<Value name="2">
<Value>middleName</Value>
</Value>
<Value name="3">
<Value>lastName</Value>
</Value>
<Value name="4">
<Value>DOB</Value>
</Value>
<Value name="5">
<Value>SSN</Value>
</Value>
<Value name="6">
<Value>mobilePhone</Value>
</Value>
<Value name="7">
<Value>address</Value>
</Value>
</Data>
<State>CustomerInfoState</State>
<StreamLocation>^IRISDemo.BO.C52AF.CustomerInfoS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
