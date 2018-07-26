Class ispp.data.Payer Extends %Persistent
{
Property PaymentMethod As %String;
Property Status As %String;

Storage Default
{
<Data name="PayerDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PaymentMethod</Value>
</Value>
<Value name="3">
<Value>Status</Value>
</Value>
</Data>
<DataLocation>^ispp.data.PayerD</DataLocation>
<DefaultData>PayerDefaultData</DefaultData>
<IdLocation>^ispp.data.PayerD</IdLocation>
<IndexLocation>^ispp.data.PayerI</IndexLocation>
<StreamLocation>^ispp.data.PayerS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}