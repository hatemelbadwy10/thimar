part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class CategoryLoading extends CategoryState{
}final class CategorySuccess extends CategoryState{
  final List<CategoryData> categoryData;

  CategorySuccess({required this.categoryData});
}
final class CategoryFailure extends CategoryState{}
