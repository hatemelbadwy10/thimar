class AboutModel{
  late final String message,status;
  late final AboutData aboutData;
  AboutModel.fromJson(Map<String,dynamic>json){
    message = json['message']??'';
    status = json['message']??'';
    aboutData = AboutData.fromJson(json['data']);
  }
}
class AboutData{
  late final String about;
  AboutData.fromJson(Map<String,dynamic>json){
    about =json['policy']??'';
  }
}