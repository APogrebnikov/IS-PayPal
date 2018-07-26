Class ispp.data.Intent Extends %Persistent
{
Property Intent As %String;

Storage Default
{
<Data name="IntentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Intent</Value>
</Value>
</Data>
<DataLocation>^ispp.data.IntentD</DataLocation>
<DefaultData>IntentDefaultData</DefaultData>
<IdLocation>^ispp.data.IntentD</IdLocation>
<IndexLocation>^ispp.data.IntentI</IndexLocation>
<StreamLocation>^ispp.data.IntentS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}