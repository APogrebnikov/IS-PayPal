Class ispp.rest.Broker Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
	 <Route Url="/start" Method="POST" Call="PostStartPayment"/>
	 <Route Url="/commit" Method="GET" Call="PostCommitPayment"/>
	 <Route Url="/get/product" Method="GET" Call="ispp.Service.ProductService:GetAll" />
	 <Route Url="/test" Method="GET" Call="Test"/>
	 <Route Url="/testpay" Method="GET" Call="TestPay"/>
	 <Route Url="/add/order" Method="POST" Call="ispp.Service.OrderService:ExecuteOrder" />
</Routes>
}

ClassMethod Test(pInput As %Library.AbstractStream, Output pOutput As %Stream.Object) As %Status
{
	set answer="{""Status"": ""Оки!"",""Message"":""АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ_абвгдеёжзийклмнопрстуфхцчшщьыъэюя""}"
	Write $ZCVT(answer, "I", "UTF8")
    Quit $$$OK
}

ClassMethod TestPay()
{
	set sc=##class(ispp.utils.Token).GetToken(.response)
	
	#dim order As ispp.message.OrderRequest
	set order=##class(ispp.Service.OrderService).ExecuteOrder(response)
	
	set sc=##class(ispp.utils.Payment).GetRedirect(order,.paymentResponse)
	
	if (paymentResponse'="")
	{
		w paymentResponse.Url
	}
	q $$$OK
}

ClassMethod PostCommitPayment() As %Status
{
	set sc=$$$OK
	set answer = "<h1>Платеж "_%request.Get("paymentId")_" успешно проведен</h1>"
	write $ZCVT(answer, "I", "UTF8") 
	set inner = ##class(ispp.message.ExecuteRequest).%New()
	set inner.PayerId=%request.Get("PayerID")
	set inner.PaymentId=%request.Get("paymentId")
	set inner.Token=%request.Get("token")
	set sc = ##class(ispp.utils.Execute).Execute(inner,.response)
    return sc
}

}