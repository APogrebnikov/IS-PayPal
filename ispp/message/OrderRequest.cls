Class ispp.message.OrderRequest Extends %SerialObject
{
Property Summ As %String;

Property SubTotal As %Decimal(SCALE = 2);

Property Organisation As %String;

Property Items As %DynamicArray;

Property AccessToken As %String(MAXLEN = "");

Property Currency As %String;

Property ReturnUrl As %String(MAXLEN = "");

Property CancelUrl As %String(MAXLEN = "");

Property NoteToPayer As %String(MAXLEN = "");

Property Tax As %Decimal(SCALE = 2);

Property Shipping As %Decimal(SCALE = 2);

Property ShippingDiscount As %Decimal(SCALE = 2);

Property HandlingFee As %Decimal(SCALE = 2);

Property Insurance As %Decimal(SCALE = 2);

Property TransDescription As %String(MAXLEN = "");

Property Custom As %String(MAXLEN = "");

Property InvoiceNumber As %String(MAXLEN = "");

Property SoftDescriptor As %String(MAXLEN = "");

Property ShippingAddress As ispp.data.Adress;

Storage Default
{
<Data name="OrderRequestState">
<Value name="1">
<Value>Summ</Value>
</Value>
<Value name="2">
<Value>Organisation</Value>
</Value>
<Value name="3">
<Value>Items</Value>
</Value>
<Value name="4">
<Value>AccessToken</Value>
</Value>
<Value name="5">
<Value>Currency</Value>
</Value>
<Value name="6">
<Value>ReturnUrl</Value>
</Value>
<Value name="7">
<Value>CancelUrl</Value>
</Value>
<Value name="8">
<Value>noteToPayer</Value>
</Value>
<Value name="9">
<Value>NoteToPayer</Value>
</Value>
<Value name="10">
<Value>Tax</Value>
</Value>
<Value name="11">
<Value>Shipping</Value>
</Value>
<Value name="12">
<Value>ShippingDiscount</Value>
</Value>
<Value name="13">
<Value>HandlingFee</Value>
</Value>
<Value name="14">
<Value>Insurance</Value>
</Value>
<Value name="15">
<Value>TransDescription</Value>
</Value>
<Value name="16">
<Value>Custom</Value>
</Value>
<Value name="17">
<Value>InvoiceNumber</Value>
</Value>
<Value name="18">
<Value>SoftDescriptor</Value>
</Value>
<Value name="19">
<Value>ShippingAddress</Value>
</Value>
<Value name="20">
<Value>SubTotal</Value>
</Value>
</Data>
<State>OrderRequestState</State>
<StreamLocation>^ispp.message.OrderRequestS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}