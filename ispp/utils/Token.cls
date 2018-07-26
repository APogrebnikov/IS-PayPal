Class ispp.utils.Token
{

/// Get Init PayPal token For this ClientID
ClassMethod GetToken(Output response As ispp.message.TokenResponse) As %Status
{
	try {
		set URL=##class(Settings).#AUTHURL
	
		set object = {}
		set object.ClientId = ##class(Settings).#CLIENTID
		set object.Secret = ##class(Settings).#SECRET
		
		set oauth = "Basic "_$System.Encryption.Base64Encode(object.ClientId_":"_object.Secret)
		set oauth = $REPLACE(oauth, $c(13,10), "")
		
		set httpRequestIn = ##class(%Net.HttpRequest).%New()
		set httpRequestIn.ContentType="application/x-www-form-urlencoded"
      	set httpRequestIn.Port=##class(Settings).#PAYPORT
     	set httpRequestIn.Server=##class(Settings).#BASEURL
     	set httpRequestIn.SSLConfiguration="PayPal"
     	set httpRequestIn.Https = 1
     	set httpRequestIn.ContentCharset="utf-8"
     	
     	do httpRequestIn.InsertFormData("grant_type","client_credentials")
     	do httpRequestIn.SetHeader("Authorization", oauth)
     	
     	set sc = httpRequestIn.Post(URL)
     	set httpResponse = httpRequestIn.HttpResponse
     	
     	if $$$ISERR(sc) && $IsObject(httpResponse) && $IsObject(httpResponse.Data) && httpResponse.Data.Size {
	     	set sc=httpResponse.Data.Read()
	    }
	    quit:$$$ISERR(sc)
	    
     	if $IsObject(httpResponse) {
        	// Instantiate the response object
        	set response = ##class(ispp.message.TokenResponse).%New()
        	// Convert JSON into a Proxy Cache Object
         	set sc = ##class(ispp.utils.Common).JSONStreamToObject(httpResponse.Data, .proxy)
         	if (sc){
	         	set response.AccessToken = proxy."access_token"
	        }
	    }
	} catch e {
		set sc =  e.AsStatus()
	}
	quit sc
}

}
