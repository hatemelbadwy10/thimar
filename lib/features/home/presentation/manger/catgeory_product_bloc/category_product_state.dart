
import 'package:thimar/features/home/data/models/category_products_model.dart';

sealed class CategoryProductState {}

final class CategoryProductInitial extends CategoryProductState {}
final class CategoryProductLoading extends CategoryProductState{}
final class CategoryProductSuccess extends CategoryProductState{
  final List<ProductsData> list;

  CategoryProductSuccess({required this.list});
}
final class CategoryProductFailure extends CategoryProductState{}
