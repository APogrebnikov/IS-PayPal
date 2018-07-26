Class ispp.data.CreditCards Extends %Persistent
{
Property CreditCards As %ListOfObjects;

Storage Default
{
<Data name="CreditCardsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CreditCards</Value>
</Value>
</Data>
<DataLocation>^ispp.data.CreditCardsD</DataLocation>
<DefaultData>CreditCardsDefaultData</DefaultData>
<IdLocation>^ispp.data.CreditCardsD</IdLocation>
<IndexLocation>^ispp.data.CreditCardsI</IndexLocation>
<StreamLocation>^ispp.data.CreditCardsS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}