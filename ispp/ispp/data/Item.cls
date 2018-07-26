Class ispp.data.Item Extends %Persistent
{
Property Product As ispp.data.Product;

Property Quantity As %Integer;
Storage Default
{
<Data name="ItemDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Product</Value>
</Value>
<Value name="3">
<Value>Quantity</Value>
</Value>
</Data>
<DataLocation>^ispp.data.ItemD</DataLocation>
<DefaultData>ItemDefaultData</DefaultData>
<IdLocation>^ispp.data.ItemD</IdLocation>
<IndexLocation>^ispp.data.ItemI</IndexLocation>
<StreamLocation>^ispp.data.ItemS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}