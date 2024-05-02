
sealed class CategoryProductEvent {}
class GetCategoryProductEvent extends CategoryProductEvent{
  final int id;

  GetCategoryProductEvent(this.id);
}
