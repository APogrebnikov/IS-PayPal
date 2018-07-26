Class ispp.data.RedirectUrls Extends %Persistent
{

Property CancelUrl As %String(MAXLEN = "");

Property ReturnUrl As %String(MAXLEN = "");

Storage Default
{
<Data name="RedirectUrlsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CancelUrl</Value>
</Value>
<Value name="3">
<Value>ReturnUrl</Value>
</Value>
</Data>
<DataLocation>^ispp.data.RedirectUrlsD</DataLocation>
<DefaultData>RedirectUrlsDefaultData</DefaultData>
<IdLocation>^ispp.data.RedirectUrlsD</IdLocation>
<IndexLocation>^ispp.data.RedirectUrlsI</IndexLocation>
<StreamLocation>^ispp.data.RedirectUrlsS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}