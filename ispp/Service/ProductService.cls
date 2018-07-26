Class ispp.Service.ProductService
{
	// получение всех объектов
	ClassMethod GetAll() As %Status
	{
		set status = $$$OK
		
		try{
			set sql = "SELECT id FROM ispp_data.Product"
			set rs = ##class(%ResultSet).%New("%DynamicQuery:SQL")
			$$$ThrowOnError(rs.Prepare(sql))
			$$$ThrowOnError(rs.Execute())
			
			set result = []
			while (rs.%Next() '= 0) {
				#dim product As ispp.data.Product = rs.GetObject()
				set proxy = {
					"id": (product.%Id()),
					"serial": (product.Serial),
					"name": (product.Name),
					"description": (product.Description),
					"price": (product.Price),
					"image": "http://joygayler.com/wp-content/uploads/2014/03/Product_Chair-1024x791.jpg"
				}
				do result.%Push(proxy)
			}
			write result.%ToJSON()
		}
		catch ex{
			set status = ex.AsStatus()
		}
		return status
	}
}