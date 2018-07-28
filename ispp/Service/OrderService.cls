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
 		set order.NoteToPayer="По любым вопросам обращайтеся в службу поддержки"
		set order.CancelUrl=##class(ispp.utils.Settings).#STORURL_"/cancel"
		set order.ReturnUrl=##class(ispp.utils.Settings).#STORURL_"/paypal/commit"
		
		set order.Items=[]
		
		if (obj.items'=""){
			for i=0:1:obj.items.%Size()-1
			{
				set value=obj.items.%Get(i)
				set newItem = {}
				set newItem.Name = value.item.name
				set newItem.Description = value.item.description
				set newItem.Price = value.item.price
				set newItem.Serial = value.item.serial
				set newItem.Tax = 0.02
				set newItem.Quantity = value.count
				
				do order.Items.%Push(newItem)
			}
		}
		
		set adress=##class(ispp.data.Adress).%New()
		set adress.RecipientName = "Тестовый адрес"
		set adress.Line1 = "4-й этаж"
		set adress.Line2 = "у двери"
		set adress.City = "SAn Jose"
		set adress.CountryCode = "US"
		set adress.PostalCode = "95131"
		set adress.Phone = "011862212345678"
		set adress.State = "CA"
		set order.ShippingAddress = adress
		return order	
	}
 
}