import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/widgets/helper_methods.dart';
import '../../../../../core/utils/dio_helper.dart';
import '../../../data/models/orders.dart';
import '../../../data/models/orders_details.dart';
import 'orders_event.dart';
import 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvents, OrdersStates> {
  OrdersBloc() : super(OrdersStates()) {
    on<GetOrdersDataEvent>(getData);
    on<PostOrderDataEvent>(storeOrder);
    on<GetOrderDetailsDataEvent>(getDetails);
    on<CancelOrderDataEvent>(cancelOrder);
  }

  bool isLoading = true;

  Future<void> getData(
      GetOrdersDataEvent event, Emitter<OrdersStates> emit) async {
    if(isLoading) {
      emit(
        GetOrdersDataLoadingState(),
      );
    }

    final response = await DioHelper().getFromServer(
      url: "client/orders/${event.type}",
    );
    if (response.success) {

      final list = OrdersData.fromJson(response.response!.data).data;
print('=====================================');
print('success');
print(response.response!.data);
print('=====================================');
      emit(
        GetOrdersDataSuccessState(
          data: list,
        ),
      );
    } else {
      print('=====================================');
      print('fail');
      print('=====================================');
      emit(
        GetOrdersDataFailedState(),
      );
    }
  }

  Future<void> storeOrder(
      PostOrderDataEvent event, Emitter<OrdersStates> emit) async {
    emit(
      PostOrdersDataLoadingState(),
    );

    final response =
    await DioHelper().sendToServer(url: "client/orders", body: {
      "address_id": event.addressModel!.id,
      "date": event.date,
      "time": event.time,
      "note": event.noteController!.text,
      "pay_type": event.payType,
      "transaction_id": event.transactionId,
      "coupon_code": event.couponCodeController!.text,
    });

    if (response.success) {
      emit(
        PostOrdersDataSuccessState(
          msg: response.msg,
        ),
      );
    } else {
      emit(
        PostOrdersDataFailedState(
          msg: response.msg,
        ),
      );
    }
  }

  Future<void> getDetails(
      GetOrderDetailsDataEvent event, Emitter<OrdersStates> emit) async {
    emit(
      GetOrderDetailsDataLoadingState(),
    );

    final response = await DioHelper().getFromServer(
      url: "client/orders/${event.num}",
    );
    if (response.success) {
      final data = OrderDetailsData.fromJson(response.response!.data).data;
      emit(
        GetOrderDetailsDataSuccessState(
          data: data,
        ),
      );
    } else {
      emit(
        GetOrderDetailsDataFailedState(),
      );
    }
  }

  Future<void> cancelOrder(CancelOrderDataEvent event, Emitter<OrdersStates> emit) async {
    emit(CancelOrdersDataLoadingState());

    final response = await DioHelper().sendToServer(
      url: "client/orders/${event.orderNum}/cancel",
    );

    if(response.success){
      showSnackBar(response.msg,
      typ: MessageType.success);
      emit(CancelOrdersDataSuccessState(msg: response.msg),);
    } else {
      emit(CancelOrdersDataFailedState(),);
    }
  }
}
