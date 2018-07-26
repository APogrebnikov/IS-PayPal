Class ispp.message.ExecuteRequest Extends %SerialObject
{
Property Token As %String(MAXLEN = "");

Property PayerId As %String(MAXLEN = "");

Property PaymentId As %String(MAXLEN = "");

Property AccessToken As %String(MAXLEN = "");

Storage Default
{
<Data name="ExecuteRequestState">
<Value name="1">
<Value>Token</Value>
</Value>
<Value name="2">
<Value>PayerId</Value>
</Value>
<Value name="3">
<Value>PaymentId</Value>
</Value>
<Value name="4">
<Value>AccessToken</Value>
</Value>
</Data>
<State>ExecuteRequestState</State>
<StreamLocation>^ispp.message.ExecuteRequestS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}