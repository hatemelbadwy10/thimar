class ProductDetailsModel{
  late String message;
  late String status;
  late ProductDetailsData productDetailsData;
  ProductDetailsModel.fromJson(Map<String,dynamic>json){
    message = json['message']??'';
    status = json['status']??"";
    productDetailsData= ProductDetailsData.fromJson(json['data']) ;
  }
}
class ProductDetailsData{
  late int categoryId,price_before_discount,amount,id,priceBeforeDiscount,isActive;
  late double discount;
  late var price;
  late String title,description,mainImage,code;
  late bool isFavorite;
late Unit unit;
late List<Images> images;

  ProductDetailsData.fromJson(Map<String, dynamic> json){
    categoryId = json['category_id'] ?? 0;
    id = json['id'] ?? 0;
    title = json['title'] ?? "";
    description = json['description'] ?? "";
    code = json['code'] ?? "";
    priceBeforeDiscount = json['price_before_discount'] ?? 0;
    price = json['price'] ?? 0;
    discount = json['discount'] ?? 0;
    amount = json['amount'] ?? 0;
    isActive = json['is_active'] ?? 0;
    isFavorite = json['is_favorite'] ?? "";
    unit = Unit.fromJson(json['unit']);
    images = List.from(json['images']).map((e) => Images.fromJson(e)).toList();
    mainImage = json['main_image'] ?? "";

  }


}
class Unit{
  late String name,type;
late int id;
Unit.fromJson(Map<String,dynamic>json){
  name= json['name']??'';
  type =json['type']??'';
  id= json['id']??0;
  }
}
class Images {
  late final String name;
  late final String url;

  Images.fromJson(Map<String, dynamic> json){
    name = json['name'];
    url = json['url'];
  }
}
