Class ispp.utils.Execute
{
ClassMethod Execute(request As ispp.message.ExecuteRequest, Output response As ispp.message.ExecuteResponse) As %Status
{
	try {
		set URL=##class(Settings).#PAYMENTURL
		set oauth = "Bearer "_request.AccessToken
		set object = {}
		set object."payer_id" = request.PayerId
		
		set consumedJSON = object.%ToJSON()
		
		set httpRequestIn = ##class(%Net.HttpRequest).%New()
		set httpRequestIn.ContentType="application/json"
      	set httpRequestIn.Port=##class(Settings).#PAYPORT
     	set httpRequestIn.Server=##class(Settings).#BASEURL
     	set httpRequestIn.SSLConfiguration=##class(Settings).#SSLCONF
     	set httpRequestIn.Https = 1
     	set httpRequestIn.ContentCharset="ISO-8859-1"
     	do httpRequestIn.EntityBody.Write(consumedJSON)
     	do httpRequestIn.SetHeader("Authorization", oauth)
     	
     	set sc = httpRequestIn.Post(URL)
     	set httpResponse = httpRequestIn.HttpResponse
     	
     	if $$$ISERR(sc) && $IsObject(httpResponse) && $IsObject(httpResponse.Data) && httpResponse.Data.Size {
	     	set sc=httpResponse.StatusCode
	    }
	    quit:$$$ISERR(sc)
	    
     	If $IsObject(httpResponse) {
     	
        	set response = ##class(ispp.message.ExecuteResponse).%New()
        	
         	set sc = ##class(ispp.utils.Common).JSONStreamToObject(httpResponse.Data, .proxy)
         	if (sc){
	         	set response.Id = proxy.id
	         	set response.State = proxy.state	         
	         	}
	        }
	} catch e {
		set sc =  e.AsStatus()
	}
	quit sc
}
}