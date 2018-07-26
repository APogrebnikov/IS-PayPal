Class ispp.Service.OrderService
{
 	/// конвертиция в %DynamicArray
 	/*ClassMethod ConvertItemsArray(items) As %DynamicArray 
 	{ 		
 		set iter = items.%GetIterator()
 		while iter.%GetNext(.key, .item) {
 			set serial = item.serial
 			&sql(SELECT id INTO :id FROM ispp.data.Product WHERE serial = :serial)
 			set newProduct = ##class(ispp.data.Product).%OpenId(id)
 		}
 		return 
 	}
 	
 	ClassMethod Save() As %Status
 	{
 		set st = $$$OK
 		
 		TSTART
 		try{
 			set obj = {}.%FromJSON($ZCVT(%request.Content.Read($$$MaxStringLength),"I","UTF8"))
 		}catch ex{
			set status = ex.AsStatus()
		}
		return
 	}*/
 	
}