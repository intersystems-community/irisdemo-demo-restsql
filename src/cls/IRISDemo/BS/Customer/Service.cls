/// Description
Class IRISDemo.BS.Customer.Service Extends Ens.BusinessService
{

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{
	Quit ..SendRequestSync("Customer Operations", pInput, .pOutput)
}

}
