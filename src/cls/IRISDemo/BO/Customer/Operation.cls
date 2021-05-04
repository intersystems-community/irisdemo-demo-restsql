/// Description
Class IRISDemo.BO.Customer.Operation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Method GetCustomer(pRequest As IRISDemo.BO.Customer.Operation.GetCustomerReq, pResponse As IRISDemo.BO.Customer.Operation.GetCustomerResp) As %Status
{
    Set status = $$$OK
    Try 
    {
        Set pResponse = ##class(IRISDemo.BO.Customer.Operation.GetCustomerResp).%New()

        Set sql="SELECT CUST_HOME_CITY, CUST_HOME_STATE, CUST_HOME_STREET, CUST_MOBILE_PHONE, CUST_NAME, CUST_SSN "_
                "FROM XPTOBankData.Customer "_
                "WHERE ID=?"

        Set status = ..Adapter.ExecuteQuery(.resultSet, sql, pRequest.CustomerId)
        $$$ThrowOnError(status)

        If resultSet.Next()
        {
            Set pResponse.Found=1
            Set pResponse.Name=resultSet.Get("CUST_NAME")
            Set pResponse.SSN=resultSet.Get("CUST_SSN")
            Set pResponse.MobilePhone=resultSet.Get("CUST_MOBILE_PHONE")
            Set pResponse.HomeStreet=resultSet.Get("CUST_HOME_STREET")
            Set pResponse.HomeState=resultSet.Get("CUST_HOME_STATE")
            Set pResponse.HomeCity=resultSet.Get("CUST_HOME_CITY")
        }

    } 
    Catch (oException)
    {
        Set status = oException.AsStatus()
    }

    Quit status
}

Method CreateOrUpdateCustomer(pRequest As IRISDemo.BO.Customer.Operation.CreateOrUpdateCustomerReq, pResponse As IRISDemo.BO.Customer.Operation.CreateOrUpdateCustomerResp) As %Status
{
    Set status = $$$OK
    Try 
    {
        Set pResponse = ##class(IRISDemo.BO.Customer.Operation.CreateOrUpdateCustomerResp).%New()

        Set sql="INSERT OR UPDATE "_
                "INTO XPTOBankData.Customer "_
                "(CUST_SSN, CUST_NAME, CUST_MOBILE_PHONE, CUST_HOME_CITY, CUST_HOME_STATE, CUST_HOME_STREET)"_
                "VALUES (?, ?, ?, ?, ?, ?)"

        Set status = ..Adapter.ExecuteUpdate(.rowsAffected, sql, pRequest.SSN, 
                                                                 pRequest.Name, 
                                                                 pRequest.MobilePhone, 
                                                                 pRequest.HomeCity,
                                                                 pRequest.HomeState,
                                                                 pRequest.HomeStreet)
        $$$ThrowOnError(status)

        Set sql="SELECT ID "_
                "FROM XPTOBankData.Customer "_
                "WHERE CUST_SSN=?"

        Set status = ..Adapter.ExecuteQuery(.resultSet, sql, pRequest.SSN)
        $$$ThrowOnError(status)

        If resultSet.Next()
        {
            Set pResponse.CustomerId=resultSet.Get("ID")
        }
    } 
    Catch (oException)
    {
        Set status = oException.AsStatus()
    }

    Quit status
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="IRISDemo.BO.Customer.Operation.GetCustomerReq">
        <Method>GetCustomer</Method>
    </MapItem>
    <MapItem MessageType="IRISDemo.BO.Customer.Operation.CreateOrUpdateCustomerReq">
        <Method>CreateOrUpdateCustomer</Method>
    </MapItem>
</MapItems>
}

}
