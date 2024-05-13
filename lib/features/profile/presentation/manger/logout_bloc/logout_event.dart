part of 'logout_bloc.dart';

@immutable
sealed class LogoutEvent {}
class SendLogoutEvent extends LogoutEvent{}
