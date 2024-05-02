class ProductRateModel{
  late final String status , message;
late final List<RatingData>ratingData;
ProductRateModel.fromJson(Map<String,dynamic>json){
  status =json ['status']??"";
  message = json['message']??"";
  ratingData = List.from(json['data']).map((e) => RatingData.fromJson(e)).toList();
  }
}
class RatingData{
  late  double value;
  late final String comment, clientImage,clientName;
   RatingData.fromJson(Map<String,dynamic>json){
     value = double.parse(json['value'].toString());;
     comment =json['comment']??"";
     clientImage = json['client_image']??"";
     clientName =json['client_name']??"";
   }
}