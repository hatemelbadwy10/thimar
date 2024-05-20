import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:thimar/core/utils/dio_helper.dart';
import 'package:thimar/core/widgets/helper_methods.dart';

part 'add_cupon_event.dart';
part 'add_cupon_state.dart';

class AddCouponBloc extends Bloc<AddCouponEvent, AddCouponState> {
  final couponController = TextEditingController();

  AddCouponBloc() : super(AddCouponInitial()) {
  on<SendCouponEvent>(sendCoupon);
  }
  void sendCoupon(SendCouponEvent event,Emitter<AddCouponState>emitter)async{
    emit(AddCouponLoading());
    final response = await DioHelper().sendToServer(url: 'client/cart/apply_coupon',
    body: {
      'code': couponController.text
    }
    );
    if(response.success){
      emit(AddCouponSuccess());

    }
    else
    {
      showSnackBar(response.msg);
      emit(AddCouponFailure());
    }
  }
}
