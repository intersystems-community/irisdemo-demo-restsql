Include %occInclude

Class IRISConfig.Installer Extends IRISConfig.InstallerBase
{

ClassMethod CreateCredentials() As %Status
{
	Set tSC = $$$OK
	Try
	{
        Set tNS = $Namespace
        ZN "USER" 
		
		Set tSC = ##class(Ens.Config.Credentials).SetCredential("XPTOBankDB", "SuperUser", "sys", 1)
		Quit:$System.Status.IsError(tSC)		
	}
	Catch (oException)
	{
		Set tSC = oException.AsStatus()
	}
	
	ZN tNS
	
	Quit tSC
}

ClassMethod ImportSwaggerAPIDefinition() As %Status
{
    Set tSC = $System.Status.OK()

    Try
    {
        Set tNS = $Namespace
        ZN "USER" 
        Set file = "/swagger/swagger.json"
        Set obj = ##class(%DynamicAbstractObject).%FromJSON(file)
        
        Set tSC = ##class(%REST.API).CreateApplication("xptobank.API.v1",.obj)
        Quit:$$$ISERR(tSC)

        set tSC = ##class(%SYS.REST).DeployApplication("xptobank.API.v1", "/xptobank/API/v1")
    }

    Catch (oException)
	{
		Set tSC = oException.AsStatus()
	}
    ZN tNS

    Quit tSC
}

ClassMethod PopulateCustomerTable() As %Status
{
    Set tSC = $System.Status.OK()

    Try
    {
        Set tNS = $Namespace
        ZN "USER" 
        
        Set tSC = ##class(XPTOBankData.Customer).Populate(1000)
        Quit:$$$ISERR(tSC)

    }

    Catch (oException)
	{
		Set tSC = oException.AsStatus()
	}
    ZN tNS

    Quit tSC
}

/// You can customize this to run code during docker build
XData Install [ XMLNamespace = INSTALLER ]
{
<Manifest>
	<Namespace Name="${Namespace}" Create="no">
		<IfDef Var="SourceDir">
            <Log Text="SourceDir defined - offline install from ${SourceDir}" Level="0"/>
            <Import File="${SourceDir}" Recurse="true"/>
        </IfDef>
	</Namespace>


    <Log Text="Importing API Swagger Definitions" Level="0"/>
        <Invoke Class="IRISConfig.Installer" Method="ImportSwaggerAPIDefinition" CheckStatus="true">
    </Invoke>

    <Log Text="Populate database" Level="0"/>
        <Invoke Class="IRISConfig.Installer" Method="PopulateCustomerTable" CheckStatus="true">
    </Invoke>

    <Log Text="Create credentials" Level="0"/>
        <Invoke Class="IRISConfig.Installer" Method="CreateCredentials" CheckStatus="true">
    </Invoke>



</Manifest>
}

}
