Class ispp.message.OrderResponse Extends %SerialObject
{
Property Url As %String(MAXLEN = "");

Storage Default
{
<Data name="OrderResponseState">
<Value name="1">
<Value>Url</Value>
</Value>
</Data>
<State>OrderResponseState</State>
<StreamLocation>^ispp.message.OrderResponseS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}