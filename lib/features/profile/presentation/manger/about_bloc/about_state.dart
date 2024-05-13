part of 'about_bloc.dart';

@immutable
sealed class AboutState {}

final class AboutInitial extends AboutState {}
final class AboutSuccess extends AboutState{
  final AboutData date;

  AboutSuccess({required this.date});
}
final class AboutFailure extends AboutState{}
final class AboutLoading extends AboutState{}
