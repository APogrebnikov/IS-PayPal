Class ispp.data.Details Extends %Persistent
{
	Property Subtotal As %String;
	
	Property Shipping As %String;
	
	Property Tax As %String;
	
	Property Handlingfee As %String;
	
	Property ShippingDiscount As %String;
	
	Property Insurance As %String;
	
	Property GiftWrap As %String;
Storage Default
{
<Data name="DetailsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Subtotal</Value>
</Value>
<Value name="3">
<Value>Shipping</Value>
</Value>
<Value name="4">
<Value>Tax</Value>
</Value>
<Value name="5">
<Value>Handlingfee</Value>
</Value>
<Value name="6">
<Value>ShippingDiscount</Value>
</Value>
<Value name="7">
<Value>Insurance</Value>
</Value>
<Value name="8">
<Value>GiftWrap</Value>
</Value>
</Data>
<DataLocation>^ispp.data.DetailsD</DataLocation>
<DefaultData>DetailsDefaultData</DefaultData>
<IdLocation>^ispp.data.DetailsD</IdLocation>
<IndexLocation>^ispp.data.DetailsI</IndexLocation>
<StreamLocation>^ispp.data.DetailsS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}