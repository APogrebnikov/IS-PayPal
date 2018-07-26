Class ispp.rest.Broker Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
	 <Route Url="/start" Method="POST" Call="PostStartPayment"/>
	 <Route Url="/commit" Method="GET" Call="PostCommitPayment"/>
	 <Route Url="get/product" Method="GET" Call="ispp.Service.ProductService:GetAll" />
	 <Route Url="/test" Method="GET" Call="Test"/>
	 <Route Url="/testpay" Method="GET" Call="TestPay"/>
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
	set order=##class(ispp.message.OrderRequest).%New()
	set order.AccessToken=response.AccessToken
	set order.Currency="RUB"
    set order.Shipping = 0.03
    set order.HandlingFee = 1.00
    set order.ShippingDiscount = -1.00
    set order.Insurance = 0.01
    
	set order.NoteToPayer="По любым вопросам идите лесом"
	set order.CancelUrl="http://cancel.com/"
	set order.ReturnUrl="https://www.pixar.com/404"
	
	set adress=##class(ispp.data.Adress).%New()
	set adress.RecipientName="Типичный адрес"
	set adress.Line1="4-й этаж"
	set adress.Line2="у двери"
	set adress.City="SAn Jose"
	set adress.CountryCode="US"
	set adress.PostalCode="95131"
	set adress.Phone="011862212345678"
	set adress.State="CA"
	set order.ShippingAddress=adress
	
	set order.Items=[]
	
	set item1={}
	set item1.Name="Совесть"
	set item1.Description="Вообще то совесть не продается"
	set item1.Quantity=1
	set item1.Price=100
	set item1.Tax=0.01
	set item1.Serial="DB1203V"
	
	set item2={}
	set item2.Name="Брови"
	set item2.Description="Высший сорт"
	set item2.Quantity=5
	set item2.Price=200
	set item2.Tax=0.02
	set item2.Serial="DB2204C"
	
	do order.Items.%Push(item1)
	do order.Items.%Push(item2)
	
	set sc=##class(ispp.utils.Payment).GetRedirect(order,.paymentResponse)
	
	if (paymentResponse'="")
	{
		w paymentResponse.Url
	}
	q $$$OK
}
}