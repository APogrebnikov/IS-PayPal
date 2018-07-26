Class ispp.data.Adress Extends %Persistent
{
Property RecipientName As %String;

Property Line1 As %String;

Property Line2 As %String;

Property City As %String;

Property CountryCode As %String;

Property PostalCode As %String;

Property Phone As %String;

Property State As %String;

Storage Default
{
<Data name="AdressDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Line1</Value>
</Value>
<Value name="3">
<Value>City</Value>
</Value>
<Value name="4">
<Value>State</Value>
</Value>
<Value name="5">
<Value>PostalCode</Value>
</Value>
<Value name="6">
<Value>CountryCode</Value>
</Value>
<Value name="7">
<Value>RecipientName</Value>
</Value>
<Value name="8">
<Value>Line2</Value>
</Value>
<Value name="9">
<Value>Phone</Value>
</Value>
</Data>
<DataLocation>^ispp.data.AdressD</DataLocation>
<DefaultData>AdressDefaultData</DefaultData>
<IdLocation>^ispp.data.AdressD</IdLocation>
<IndexLocation>^ispp.data.AdressI</IndexLocation>
<StreamLocation>^ispp.data.AdressS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}