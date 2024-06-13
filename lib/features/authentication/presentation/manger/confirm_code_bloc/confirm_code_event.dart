part of 'confirm_code_bloc.dart';

@immutable
sealed class ConfirmCodeEvent {}
class VerifyCodeEvent extends ConfirmCodeEvent {
  final bool isActive;
  final String phone, pinCode;

  VerifyCodeEvent({required this.isActive, required this.phone, required this.pinCode});
}

class ResendCodeEvent extends ConfirmCodeEvent {
  final String phone;

  ResendCodeEvent({required this.phone});
}