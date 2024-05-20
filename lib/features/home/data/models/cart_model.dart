class CartModel{
  late final  String massage, status, vipMassage;
  late final num totalBeforeDiscount, totalDiscount,deliveryCost,freeDeliveryPrice,isVip,vipDiscount,price;
  late final List<CartData> cartData;
  CartModel.fromJson(Map<String,dynamic>json){
    massage=json['message']??'';
    status=json['status']??'';
    vipMassage =json['vip_message'];
    price= json['total_price_with_vat']??0;
    totalBeforeDiscount = json['total_price_before_discount']??0;
    totalDiscount= json['total_discount']??0;
    deliveryCost = json['delivery_cost']??0;
    freeDeliveryPrice=json['free_delivery_price']??0;
    isVip= json['is_vip']??0;
    vipDiscount=json['vip_discount_percentage']??0;
    cartData= List.from(json['data']).map((e) => CartData.fromJson(e)).toList();

  }

}
class CartData{
  late final int id,amount,remainingAmount;
  late final String title, image;
  late final num priceBeforeDiscount,discount,price;
  CartData.fromJson(Map<String,dynamic>json){
    id= json['id'];
    amount= json['amount'];
    remainingAmount= json['remaining_amount'];
    title = json['title'];
    image= json['image'];
    priceBeforeDiscount= json['price_before_discount'];
    discount = json['discount'];
    price = json['price'];
  }
}