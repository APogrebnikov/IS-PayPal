Class ispp.Service.OrderService
{
 	ClassMethod ExecuteOrder(obj As %DynamicObject) As ispp.message.OrderRequest 
 	{
 		#dim order As ispp.message.OrderRequest=##class(ispp.message.OrderRequest).%New()
 		
 		//значение по дефолту
 		set order.Currency="RUB"
 		set order.Shipping = 0.03
 		set order.HandlingFee = 1.00
 		set order.ShippingDiscount = -1.00
 		set order.Insurance = 0.01
 		set order.NoteToPayer="По любым вопросам идите лесом"
		set order.CancelUrl="http://localhost:57772/cancel"
		set order.ReturnUrl="http://localhost:57772/paypal/commit"
		
		set iter = obj.items.%GetIterator()
		set newItem = {}
		while iter.%GetNext(, .value) {
			set newItem.Name = value.item.name
			set newItem.Description = value.item.description
			set newItem.Price = value.item.price
			set newItem.Serial = value.item.serial
			set newItem.Tax = 0.02
			set newItem.Quantity = value.count
			
			do order.Items.%Push(newItem)
		}
		set adress=##class(ispp.data.Adress).%New()
		set adress.RecipientName = obj.recipientName
		set adress.Line1 = "4-й этаж"
		set adress.Line2 = "у двери"
		set adress.City = obj.city
		set adress.CountryCode = obj.countryCode
		set adress.PostalCode = obj.postcalCode
		set adress.Phone = obj.code
		set adress.State = obj.state
		set order.ShippingAddress = adress
		
		return order	
	}
 
}