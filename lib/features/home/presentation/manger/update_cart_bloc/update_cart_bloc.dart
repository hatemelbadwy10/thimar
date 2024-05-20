import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar/core/utils/dio_helper.dart';

import '../../../../../core/widgets/helper_methods.dart';

part 'update_cart_event.dart';
part 'update_cart_state.dart';

class UpdateCartBloc extends Bloc<UpdateCartEvent, UpdateCartState> {
  UpdateCartBloc() : super(UpdateCartInitial()) {
  on<SendUpdateEvent>(updateProduct);
  }

  void updateProduct(SendUpdateEvent event,Emitter<UpdateCartState>emitter )async{
    emit(UpdateCartLoading());
    final response = await DioHelper().sendToServer(url: 'client/cart/${event.id}',
    body: {
      'amount': event.amount,"_method":"PUT"
    }
    );
    if(response.success){
      emit(UpdateCartSuccess(msg: response.msg));

    }
    else{
      emit(UpdateCartFailure(msg: response.msg));
    }
  }
}
