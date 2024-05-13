import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar/core/utils/dio_helper.dart';
import 'package:thimar/features/profile/data/policy_model.dart';

part 'policy_event.dart';
part 'policy_state.dart';

class PolicyBloc extends Bloc<PolicyEvent, PolicyState> {
  PolicyBloc() : super(PolicyInitial()) {
    on<GetPolicyEvent>(getPolicy);
  }
  void getPolicy(GetPolicyEvent event,Emitter<PolicyState>emitter)async{
    emit(PolicyLoading());
    final response = await DioHelper().getFromServer(url: 'policy');
    if(response.success){
      final model = PolicyModel.fromJson(response.response!.data).policyData;
      print(model);
      emit(PolicySuccess(policyData: model));
    }
    else {
      emit(PolicyFailure());
    }
  }
}
