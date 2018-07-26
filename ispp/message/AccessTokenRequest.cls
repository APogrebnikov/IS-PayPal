Class ispp.message.AccessTokenRequest Extends %SerialObject
{
Property Token As %String(MAXLEN = "");

Storage Default
{
<Data name="AccessTokenRequestState">
<Value name="1">
<Value>Token</Value>
</Value>
</Data>
<State>AccessTokenRequestState</State>
<StreamLocation>^ispp.message.AccessTokenFC2DS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}