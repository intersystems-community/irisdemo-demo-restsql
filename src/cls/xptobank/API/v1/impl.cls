/// This API lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br/>
/// Business logic class defined by OpenAPI in xptobank.API.v1.spec<br/>
/// Created May 4, 2021 15:02:49
Class xptobank.API.v1.impl Extends %REST.Impl [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 0;

/// Get customer details by customer ID<br/>
/// The method arguments hold values for:<br/>
///     customerId<br/>
ClassMethod customerGetById(customerId As %Integer) As %Stream.Object
{
   
    Set status = ##class(Ens.Director).CreateBusinessService("Customer Services", .service)
    $$$ThrowOnError(status)

    Set serviceRequest = ##class(IRISDemo.BO.Customer.Operation.GetCustomerReq).%New()
    Set serviceRequest.CustomerId=customerId

    Set status = service.ProcessInput(serviceRequest, .serviceResponse)
    $$$ThrowOnError(status)

    Set status = serviceResponse.CustomerInfo.%JSONExportToString(.customerInfoJSONString)
    $$$ThrowOnError(status)

    Set response = {}
    Set response.customerId=customerId
    Set response.customerInfo={}.%FromJSON(customerInfoJSONString)

    Do ..%SetStatusCode(200)

    Return response
}

/// Create a new customer with the given information.<br/>
/// The method arguments hold values for:<br/>
///     customerInfo<br/>
ClassMethod customerCreate(customerInfo As %Stream.Object) As %Stream.Object
{
    Set status = ##class(Ens.Director).CreateBusinessService("Customer Services", .service)
    $$$ThrowOnError(status)

    Set serviceRequest = ##class(IRISDemo.BO.Customer.Operation.CreateOrUpdateCustomerReq).%New()
    Set status = serviceRequest.CustomerInfo.%JSONImport(customerInfo)
    $$$ThrowOnError(status)

    Set status = service.ProcessInput(serviceRequest, .serviceResponse)
    $$$ThrowOnError(status)

    Set response = {}
    Set response.customerId=serviceResponse.CustomerId
    Set response.customerInfo={}.%FromJSON(customerInfo)

    Do ..%SetStatusCode(200)

    Return response
}

}
