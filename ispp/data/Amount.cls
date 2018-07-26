Class ispp.data.Amount Extends %Persistent
{
Property Currency As %String;

Property Total As %String;

Property Details As ispp.data.Details;
	
Storage Default
{
<Data name="AmountDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Currency</Value>
</Value>
<Value name="3">
<Value>Total</Value>
</Value>
<Value name="4">
<Value>Details</Value>
</Value>
</Data>
<DataLocation>^ispp.data.AmountD</DataLocation>
<DefaultData>AmountDefaultData</DefaultData>
<IdLocation>^ispp.data.AmountD</IdLocation>
<IndexLocation>^ispp.data.AmountI</IndexLocation>
<StreamLocation>^ispp.data.AmountS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}