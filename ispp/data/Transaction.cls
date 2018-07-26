Class ispp.data.Transaction Extends %Persistent
{

Property Referenceid As %String;

Property Amount As ispp.data.Amount;

Storage Default
{
<Data name="TransactionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Referenceid</Value>
</Value>
<Value name="3">
<Value>Amount</Value>
</Value>
</Data>
<DataLocation>^ispp.data.TransactionD</DataLocation>
<DefaultData>TransactionDefaultData</DefaultData>
<IdLocation>^ispp.data.TransactionD</IdLocation>
<IndexLocation>^ispp.data.TransactionI</IndexLocation>
<StreamLocation>^ispp.data.TransactionS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}