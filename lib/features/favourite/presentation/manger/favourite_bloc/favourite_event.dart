part of 'favourite_bloc.dart';

@immutable
sealed class FavouriteEvent {}
class GetFavouriteListEvent extends FavouriteEvent{}
class AddToFavouriteEvent extends FavouriteEvent{
 final int id;

  AddToFavouriteEvent({required this.id});
}
class RemoveFromFavouriteEvent extends FavouriteEvent{
  final int id;

  RemoveFromFavouriteEvent({required this.id});

}
