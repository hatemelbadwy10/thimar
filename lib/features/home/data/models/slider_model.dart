class SliderModel{
  late final String status ,message;
  late final List<Data> data;
SliderModel.fromJson(Map<String,dynamic>json){
  status =json['status'];
  message=json['massage']??'';
  data= List.from(json['data']).map((e) => Data.fromJson(e)).toList();


  }
}
class Data{
  late final int id;
  late final String media;
  Data.fromJson(Map<String,dynamic>json){
    id= json['id'];
    media =json['media'];
  }
}