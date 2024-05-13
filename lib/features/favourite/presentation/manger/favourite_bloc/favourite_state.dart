part of 'favourite_bloc.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}
final class FavouriteLoading extends FavouriteState{}
final class FavouriteSuccess extends FavouriteState{
  final List<FavouritesModel> list;

  FavouriteSuccess({required this.list});
}
final class FavouriteFailure extends FavouriteState{}
final class AddToFavouritesSuccessState extends FavouriteState{}
final class RemoveFromFavouritesSuccessState extends FavouriteState{}


