import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/dio_helper.dart';
import '../../../../../core/widgets/helper_methods.dart';
import '../get_rates_bloc/get_rates_bloc.dart';

part 'get_rates_event.dart';
part 'get_rates_state.dart';

class GetRatesBloc extends Bloc<GetRatesEvent, GetProductsRatesStates> {
  GetRatesBloc() : super(GetRatesInitial()) {
    on<AddRateToProductEvent>(addRate);
  }
  void addRate(AddRateToProductEvent event, Emitter<GetProductsRatesStates> emit) async {
    emit(
      AddRateToProductLoadingState(),
    );

    final response = await DioHelper()
        .sendToServer(url: "client/products/${event.id}/rate", body: {
      "value": event.value,
      "comment": event.productComment!.text,
    });

    if (response.success) {
      showSnackBar(
        response.msg,
        typ: MessageType.success,
      );
      emit(
        AddRateToProductSuccessState(),
      );
    } else {
      emit(
        AddRateToProductFailedState(),
      );
    }
  }
}

