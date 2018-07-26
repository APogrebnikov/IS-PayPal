Class ispp.message.TokenResponse Extends %SerialObject
{
Property AccessToken As %String(MAXLEN = "");

Storage Default
{
<Data name="TokenResponseState">
<Value name="1">
<Value>AccessToken</Value>
</Value>
</Data>
<State>TokenResponseState</State>
<StreamLocation>^ispp.message.TokenResponseS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}