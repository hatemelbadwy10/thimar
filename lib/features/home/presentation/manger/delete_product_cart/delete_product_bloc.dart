import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar/core/utils/dio_helper.dart';

import '../../../../../core/widgets/helper_methods.dart';

part 'delete_product_event.dart';
part 'delete_product_state.dart';

class DeleteProductBloc extends Bloc<DeleteProductEvent, DeleteProductState> {
  DeleteProductBloc() : super(DeleteProductInitial()) {
    on<SendDeletedProductEvent>(sendDeletedProduct);
  }
  Future<void> sendDeletedProduct(SendDeletedProductEvent event,Emitter<DeleteProductState>emitter) async {
    emit(DeleteProductLoading());
    final response = await DioHelper().removeFromServer(url: 'client/cart/delete_item/${event.id}');
    if(response.success){
      emit(DeleteProductSuccess(msg: response.msg));

    }
    else{
      emit(DeleteProductFailure(msg: response.msg));
    }
  }
}
