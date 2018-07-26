Class ispp.utils.Token
{

Method GenerateToken(pRequest As ispp.message.TokenRequest, Output pResponse As ispp.message.TokenResponse) As %Status
{
	try {
		set tURL = ..Adapter.URL
		set object = ##class(%Object).%New()
		set object.ClientId = "ClietnId"
		set object.Secret = "Secret"
		set oauth = "Basic "_$System.Encryption.Base64Encode(object.ClientId_":"_object.Secret)
		set oauth = $REPLACE(oauth, $c(13,10), "")
		
		set tHttpRequestIn = ##class(%Net.HttpRequest).%New()
		set tHttpRequestIn.ContentType="application/x-www-form-urlencoded"
      	set tHttpRequestIn.Port=..Adapter.HTTPPort
     	set tHttpRequestIn.Server=..Adapter.HTTPServer
     	set tHttpRequestIn.SSLConfiguration="PayPal"
     	set tHttpRequestIn.Https = 1
     	set tHttpRequestIn.ContentCharset="utf-8"
     	do tHttpRequestIn.InsertFormData("grant_type","client_credentials")
     	do tHttpRequestIn.SetHeader("Authorization", oauth)
     	
     	set tSC = tHttpRequestIn.Post(tURL)
     	set tHttpResponse = tHttpRequestIn.HttpResponse
     	If $$$ISERR(tSC)&&$IsObject(tHttpResponse)&&$IsObject(tHttpResponse.Data)&&tHttpResponse.Data.Size {
	     	Set tSC=$$$ERROR($$$EnsErrGeneral,$$$StatusDisplayString(tSC)_":"_tHttpResponse.Data.Read())
	     	}
	    Quit:$$$ISERR(tSC)
     	If $IsObject(tHttpResponse) {
        	// Instantiate the response object
        	set pResponse = ##class(PayPal.Message.TokenResponse).%New()
        	// Convert JSON into a Proxy Cache Object
         	set tSC = ..JSONStreamToObject(tHttpResponse.Data, .tProxy)
         	if (tSC){
	         	set pResponse.AccessToken = tProxy."access_token"
	        }
	    }
	} catch {
		set tSC = $$$SystemError
	}
	quit tSC
}

}