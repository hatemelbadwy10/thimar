part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}
class RegisterUserDataEvent extends RegisterEvent {}

