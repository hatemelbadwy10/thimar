part of 'notifications_bloc.dart';

@immutable

class NotificationsStates {}

class GetNotificationsLoadingState extends NotificationsStates {}

class GetNotificationsSuccessState extends NotificationsStates {

  final List<Notifications> list;

  GetNotificationsSuccessState({required this.list});

}

class GetNotificationsFailedState extends NotificationsStates {}
