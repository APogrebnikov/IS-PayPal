Class ispp.utils.Payment
{
ClassMethod GetRedirect(request As ispp.message.OrderRequest, Output response As ispp.message.OrderResponse) As %Status
{
	try {
		set URL=##class(Settings).#PAYMENTURL
		set oauth = "Bearer "_request.AccessToken
		
		set items=[]
		set request.Tax=0
		set request.SubTotal=0
		 
		for i=0:1:request.Items.%Size()-1
		{

			set curItem=request.Items.%Get(i)
			
			set item={
				"name": (curItem.Name),
				"description": (curItem.Description),
				"quantity": (curItem.Quantity),
				"price": (curItem.Price),
				"tax": (curItem.Tax),
				"sku": (curItem.Serial),
				"currency": (request.Currency)
			}

			set request.Tax=request.Tax + (curItem.Tax * curItem.Quantity)
			set request.SubTotal=request.SubTotal + (curItem.Price * curItem.Quantity)

			do items.%Push(item)
		}
		
		set request.Summ=request.SubTotal + request.Tax + request.Insurance + request.Shipping
		
		set structure={
			  "intent": "sale",
			  "payer": {
			    "payment_method": "paypal"
			  },
			  "transactions": [{
			    "amount": {
			      "total": (request.Summ),
			      "currency": (request.Currency),
			      "details": {
			        "subtotal": (request.SubTotal),
			        "tax": (request.Tax),
			        "shipping": (request.Shipping),
			        "handling_fee": (request.HandlingFee),
			        "shipping_discount": (request.ShippingDiscount),
			        "insurance": (request.Insurance)
			      }
			    },
			    "description": (request.TransDescription),
			    "custom": (request.Custom),
			    "invoice_number": (request.InvoiceNumber),
			    "payment_options": {
			      "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
			    },
			    "soft_descriptor": (request.SoftDescriptor),
			    "item_list": {
			      "items": (items),
			      "shipping_address": {
			        "recipient_name": ($case(request.ShippingAddress, "":"", :request.ShippingAddress.RecipientName)),
			        "line1": ($case(request.ShippingAddress, "":"", :request.ShippingAddress.Line1)),
			        "line2": ($case(request.ShippingAddress, "":"", :request.ShippingAddress.Line2)),
			        "city": ($case(request.ShippingAddress, "":"", :request.ShippingAddress.City)),
			        "country_code": ($case(request.ShippingAddress, "":"", :request.ShippingAddress.CountryCode)),
			        "postal_code": ($case(request.ShippingAddress, "":"", :request.ShippingAddress.PostalCode)),
			        "phone": ($case(request.ShippingAddress, "":"", :request.ShippingAddress.Phone)),
			        "state": ($case(request.ShippingAddress, "":"", :request.ShippingAddress.State))
			      }
			    }
			  }],
			  "note_to_payer": (request.NoteToPayer),
			  "redirect_urls": {
			    "return_url": (request.ReturnUrl),
			    "cancel_url": (request.CancelUrl)
			  }
			}
		
		set consumedJSON = structure.%ToJSON()
		
		w consumedJSON
		
		set httpRequestIn = ##class(%Net.HttpRequest).%New()
		set httpRequestIn.ContentType="application/json"
      	set httpRequestIn.Port=##class(Settings).#PAYPORT
     	set httpRequestIn.Server=##class(Settings).#BASEURL
     	set httpRequestIn.SSLConfiguration="PayPal"
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
	    
     	if $IsObject(httpResponse) {
     		w httpResponse.StatusCode
        	set response = ##class(ispp.message.OrderResponse).%New()
         	set sc = ##class(ispp.utils.Common).JSONStreamToObject(httpResponse.Data, .proxy)
         	if (sc){
	         	for i=1:1:proxy.links.Count() {
		         	if (proxy.links.GetAt(i).rel = "approval_url") {
			         	set response.Url = proxy.links.GetAt(i).href
			         	w ">>"_response.Url_"<<"
		         	}
	         	}
	        }
	    }
	} catch e {
		set sc =  e.AsStatus()
	}
	quit sc
}
}