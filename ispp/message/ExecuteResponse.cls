Class ispp.message.ExecuteResponse Extends %SerialObject
{
Property Id As %String(MAXLEN = "");

Property State As %String;

Storage Default
{
<Data name="ExecuteResponseState">
<Value name="1">
<Value>Id</Value>
</Value>
<Value name="2">
<Value>State</Value>
</Value>
</Data>
<State>ExecuteResponseState</State>
<StreamLocation>^ispp.message.ExecuteResponseS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}