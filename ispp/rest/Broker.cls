Class ispp.rest.Broker Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
	 <Route Url="/start" Method="POST" Call="PostStartPayment"/>
	 <Route Url="/commit" Method="GET" Call="PostCommitPayment"/>
	 <Route Url="/test" Method="GET" Call="Test"/>
</Routes>
}

Method Test(pInput As %Library.AbstractStream, Output pOutput As %Stream.Object) As %Status
{
	Write "{""Status"": ""Îêè äîêè"",""Message"":""ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏĞÑÒÓÔÕÖ×ØÙÚÛÜİŞß_àáâãäåæçèéêëìíîïğñòóôõö÷øùúûüışÿ""}"
    Quit $$$OK
}
}