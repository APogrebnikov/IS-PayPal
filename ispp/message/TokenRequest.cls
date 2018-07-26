Class ispp.message.TokenRequest Extends %SerialObject
{
Property ClientId As %String(MAXLEN = "");

Property Secret As %String(MAXLEN = "");

Storage Default
{
<Data name="TokenRequestState">
<Value name="1">
<Value>ClientId</Value>
</Value>
<Value name="2">
<Value>Secret</Value>
</Value>
</Data>
<State>TokenRequestState</State>
<StreamLocation>^ispp.message.TokenRequestS</StreamLocation>
<Type>%Library.CacheSerialState</Type>
}

}