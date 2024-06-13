part of 'confirm_code_bloc.dart';

@immutable
sealed class ConfirmCodeState {}

final class ConfirmCodeInitial extends ConfirmCodeState {}

class ConfirmCodeLoadingState extends ConfirmCodeState {}

class ConfirmCodeFailedState extends ConfirmCodeState {}

class ConfirmCodeSuccessState extends ConfirmCodeState {}
