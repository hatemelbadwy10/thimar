part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}
class GetCategoryEvent extends CategoryEvent{}
class GetSearchDataEvent extends CategoryEvent{
final String keyWord;

  GetSearchDataEvent({required this.keyWord});
}