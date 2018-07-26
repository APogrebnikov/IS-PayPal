Class ispp.data.Product Extends %Persistent
{
Property Name As %String;

Property Cost As %String;

Property Serial As %String;

Storage Default
{
<Data name="ProductDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Cost</Value>
</Value>
<Value name="4">
<Value>Serial</Value>
</Value>
</Data>
<DataLocation>^ispp.data.ProductD</DataLocation>
<DefaultData>ProductDefaultData</DefaultData>
<IdLocation>^ispp.data.ProductD</IdLocation>
<IndexLocation>^ispp.data.ProductI</IndexLocation>
<StreamLocation>^ispp.data.ProductS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}