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

        Set sql="SELECT CUST_HOME_CITY, CUST_HOME_STATE, CUST_HOME_STREET, CUST_MOBILE_PHONE, CUST_NAME, CUST_SSN, CUST_DOB, CUST_HOME_ZIP "_
                "FROM XPTOBankData.Customer "_
                "WHERE ID=?"

        Set status = ..Adapter.ExecuteQuery(.resultSet, sql, pRequest.CustomerId)
        $$$ThrowOnError(status)

        If resultSet.Next()
        {
            Set pResponse.Found=1
            Set pResponse.CustomerInfo.lastName=$Piece(resultSet.Get("CUST_NAME"),",",1)
            Set pResponse.CustomerInfo.firstName=$Piece($Piece(resultSet.Get("CUST_NAME"),",",2)," ",1)
            Set pResponse.CustomerInfo.middleName=$Piece($Piece(resultSet.Get("CUST_NAME"),",",2)," ",2)
            
            Set pResponse.CustomerInfo.SSN=resultSet.Get("CUST_SSN")
            Set pResponse.CustomerInfo.DOB=$ZDateH(resultSet.Get("CUST_DOB"),3)
            Set pResponse.CustomerInfo.mobilePhone=resultSet.Get("CUST_MOBILE_PHONE")
            Set pResponse.CustomerInfo.address.street=resultSet.Get("CUST_HOME_STREET")
            Set pResponse.CustomerInfo.address.state=resultSet.Get("CUST_HOME_STATE")
            Set pResponse.CustomerInfo.address.city=resultSet.Get("CUST_HOME_CITY")
            Set pResponse.CustomerInfo.address.ZIP=resultSet.Get("CUST_HOME_ZIP")
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
                "(CUST_SSN, CUST_NAME, CUST_DOB, CUST_MOBILE_PHONE, CUST_HOME_CITY, CUST_HOME_STATE, CUST_HOME_STREET, CUST_HOME_ZIP)"_
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)"

        Set customerName = pRequest.CustomerInfo.lastName_","_pRequest.CustomerInfo.firstName_" "_pRequest.CustomerInfo.middleName

        Set status = ..Adapter.ExecuteUpdate(.rowsAffected, sql, pRequest.CustomerInfo.SSN, 
                                                                 customerName, 
                                                                 $ZDate(pRequest.CustomerInfo.DOB, 3),
                                                                 pRequest.CustomerInfo.mobilePhone, 
                                                                 pRequest.CustomerInfo.address.city,
                                                                 pRequest.CustomerInfo.address.state,
                                                                 pRequest.CustomerInfo.address.street,
                                                                 pRequest.CustomerInfo.address.ZIP)
        $$$ThrowOnError(status)

        Set sql="SELECT ID "_
                "FROM XPTOBankData.Customer "_
                "WHERE CUST_SSN=?"

        Set status = ..Adapter.ExecuteQuery(.resultSet, sql, pRequest.CustomerInfo.SSN)
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
