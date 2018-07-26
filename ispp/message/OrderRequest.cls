Class ispp.message.OrderRequest Extends %SerialObject
{
Property Summ As %String;

Property Organisation As %String;

Property Items As %DynamicArray;

Property AccessToken As %String(MAXLEN = "");

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
</Data>
<State>OrderRequestState</State>
<StreamLocation>^ispp.message.OrderRequestS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}