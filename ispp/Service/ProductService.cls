Class ispp.Service.ProductService
{
	// получение всех объектов
	ClassMethod GetAll() As %Status
	{
		set status = $$$OK
		
		try{
			set sql = "SELECT ID, Name, Serial, Description, Price FROM ispp.data.Product"
			set rs = ##class(%ResultSet).%New("%DynamicQuery:SQL")
			$$$ThrowOnError(rs.Prepare(sql))
			$$$ThrowOnError(rs.Execute(ID, Name, Serial, Description, Price))
			
			set result = {}
			set result.products = []
			while (rs.%Next() '= 0) {
				set newProduct = rs.GetObject()
				set proxy = {
					"id": (newProduct.ID),
					"serial": (newProduct.Serial),
					"name": (product.Name),
					"description": (product.Description),
					"price": (product.Price),
					"image": "http://joygayler.com/wp-content/uploads/2014/03/Product_Chair-1024x791.jpg"
				}
				do result.products.%Push(proxy)
			}
			write result.%ToJSON()
		}
		catch ex{
			set status = ex.AsStatus()
		}
		return status
	}
}