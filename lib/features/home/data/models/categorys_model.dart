class CategoryModel{
  late final String status,message;
  late final List<CategoryData> categoryData;
  late final Meta meta;
  late final Links links;
  CategoryModel.fromJson(Map<String,dynamic>json){
    status =json['status'];
    message =json['message'];
categoryData = List.from(json['data']??[]).map((e) => CategoryData.fromJson(e)).toList();

  }

}
class Meta{
  late final int currentPage,form,lastPage,perPage,to,total;
  late final String path ;
  late final List<Links> links;



}
class CategoryData{
  late final String media,name,description;
  late final int id;
  CategoryData.fromJson(Map<String,dynamic>json){
    name=json['name']??'';
    description=json['description']??'';
    media =json['media']??"";
    id=json['id']??'0';
  }
}
class Links{
  late final String url,label;
  late final bool active;
  Links.fromJson(Map<String,dynamic>json){
    url =json['url'];
    label =json['label'];
    active= json['active'];
  }

}