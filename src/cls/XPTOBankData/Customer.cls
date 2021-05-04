/// XPTO Bank's customer
Class XPTOBankData.Customer Extends (%Persistent, %Populate)
{

Property Name As %String [ Required, SqlFieldName = CUST_NAME ];

Property SSN As %String [ Required, SqlFieldName = CUST_SSN ];

Property DOB As %Date(POPSPEC = "Date(30000, 60266)") [ Required, SqlFieldName = CUST_DOB ];

Property MobilePhone As %String(POPSPEC = "USPhone()") [ Required, SqlFieldName = CUST_MOBILE_PHONE ];

Property HomeStreet As %String(POPSPEC = "Street()") [ SqlFieldName = CUST_HOME_STREET ];

Property HomeCity As %String(POPSPEC = "City()") [ SqlFieldName = CUST_HOME_CITY ];

Property HomeState As %String(POPSPEC = "USState()") [ SqlFieldName = CUST_HOME_STATE ];

Property HomeZip As %String(POPSPEC = "USZip()") [ SqlFieldName = CUST_HOME_ZIP ];

Index SSNIndex On SSN [ Unique ];

Storage Default
{
<Data name="CustomerDefaultData">
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
<Value>Address</Value>
</Value>
<Value name="6">
<Value>HomeStreet</Value>
</Value>
<Value name="7">
<Value>HomeNumber</Value>
</Value>
<Value name="8">
<Value>HomeCity</Value>
</Value>
<Value name="9">
<Value>HomeState</Value>
</Value>
<Value name="10">
<Value>DOB</Value>
</Value>
<Value name="11">
<Value>HomeZip</Value>
</Value>
</Data>
<DataLocation>^XPTOBankData.CustomerD</DataLocation>
<DefaultData>CustomerDefaultData</DefaultData>
<IdLocation>^XPTOBankData.CustomerD</IdLocation>
<IndexLocation>^XPTOBankData.CustomerI</IndexLocation>
<StreamLocation>^XPTOBankData.CustomerS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
