import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar/core/utils/dio_helper.dart';
import 'package:thimar/core/widgets/helper_methods.dart';

part 'add_product_to_cart_event.dart';
part 'add_product_to_cart_state.dart';

class AddProductToCartBloc extends Bloc<AddProductToCartEvent, AddProductToCartState> {
  AddProductToCartBloc() : super(AddProductToCartInitial()) {
   on<SendProductToCartEvent>(addProductToCart);

  }
  void addProductToCart(SendProductToCartEvent event,Emitter<AddProductToCartState>emitter)async{
    emit(AddProductToCartLoading());
    final response = await DioHelper().sendToServer(url: 'client/cart',
    body: {
      'product_id':event.productId,
      'amount': event.amount,
    }
    );
    if(response.success){

      emit(AddProductToCartSuccess(msg: response.msg));

    }
    else {
      emit(AddProductToCartFailure(msg: response.msg));
    }
  }
}
