part of 'notifications_bloc.dart';

@immutable
sealed class NotificationsEvent {}
class GetNotificationsEvent extends NotificationsEvent {}
