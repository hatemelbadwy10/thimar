class NotificationsModel{
  late final String message,status;
late final NotificationsData notificationsData;
NotificationsModel.fromJson(Map<String,dynamic>json){
  message=json['message'];
  status=json['status'];
  notificationsData=NotificationsData.fromJson(json['data']);
}
}
class NotificationsData{
  late final int unreadNotificationsCount;
late final List<Notifications>notifications;
NotificationsData.fromJson(Map<String,dynamic>json){
  unreadNotificationsCount=json['unreadnotifications_count'];
  notifications=List.from(json['notifications'])
      .map((e) => Notifications.fromJson(e))
      .toList();
  }

}
class Notifications {
late final String id,title,body,notifyType,image,readAt,createdAt;
late final Order orders;
Notifications.fromJson(Map<String,dynamic>json){
  id=json['id'];
  title=json['title'];
  body=json['body'];
  notifyType=json['notify_type'];
  image=json['image'];
  readAt=json['read_at'];
  createdAt=json['created_at'];
  orders=Order.fromJson(json['order']);
}



}
class Order{
late  final int  orderId,clientId,driverId;
late final String orderStatus;
Order.fromJson(Map<String,dynamic>json){
  orderId=json['order_id'];
clientId =json['client_id'];
driverId=json['driver_id'];
orderStatus=json['order_status'];

}
}