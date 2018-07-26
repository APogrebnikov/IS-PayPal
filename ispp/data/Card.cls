Class ispp.data.Card Extends %Persistent
{
Property Id As %String;

Property State As %String;

Property Payerid As %String;

Property Type As %String;

Property Number As %String;

Property ExpireMonth As %String;

Property ExpireYear As %String;

Property FirstName As %String;

Property LastName As %String;

Property BillingAdress As ispp.data.Adress;

Property ValidUntil As %String;

Property CreateTime As %String;

Property UpdateTime As %String;

	
Storage Default
{
<Data name="CardDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Id</Value>
</Value>
<Value name="3">
<Value>State</Value>
</Value>
<Value name="4">
<Value>Payerid</Value>
</Value>
<Value name="5">
<Value>Type</Value>
</Value>
<Value name="6">
<Value>Number</Value>
</Value>
<Value name="7">
<Value>ExpireMonth</Value>
</Value>
<Value name="8">
<Value>ExpireYear</Value>
</Value>
<Value name="9">
<Value>FirstName</Value>
</Value>
<Value name="10">
<Value>LastName</Value>
</Value>
<Value name="11">
<Value>BillingAdress</Value>
</Value>
<Value name="12">
<Value>ValidUntil</Value>
</Value>
<Value name="13">
<Value>CreateTime</Value>
</Value>
<Value name="14">
<Value>UpdateTime</Value>
</Value>
</Data>
<DataLocation>^ispp.data.CardD</DataLocation>
<DefaultData>CardDefaultData</DefaultData>
<IdLocation>^ispp.data.CardD</IdLocation>
<IndexLocation>^ispp.data.CardI</IndexLocation>
<StreamLocation>^ispp.data.CardS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}