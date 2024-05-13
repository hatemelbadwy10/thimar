part of 'contact_bloc.dart';

@immutable
sealed class ContactState {}

final class ContactInitial extends ContactState {}
final class ContactSuccess extends ContactState{}
final class ContactFailure extends ContactState{}
final class ContactLoading extends ContactState{}
