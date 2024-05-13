import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/profile/presentation/manger/policy_bloc/policy_bloc.dart';
import 'package:thimar/features/profile/presentation/views/widgets/custom_text.dart';

import '../../../../../core/utils/styles.dart';
class PrivacyViewBody extends StatefulWidget {
  const PrivacyViewBody({super.key});

  @override
  State<PrivacyViewBody> createState() => _PrivacyViewBodyState();
}

class _PrivacyViewBodyState extends State<PrivacyViewBody> {
final bloc = KiwiContainer().resolve<PolicyBloc>()..add(GetPolicyEvent());
  
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder(
      bloc:bloc,
  builder: (context, state) {
    if(state is PolicyLoading){
      return CircularProgressIndicator();
    }
    else if( state is PolicySuccess){
      return SafeArea(
          child: Column(
              children: [
              CustomAppBarSec(text: 'سياسة الخصوصية', onPress: (){
            GoRouter.of(context).pop(AppRouter.kProfileView);
          }),
          SizedBox(height: 25.h,),
          Html(
data: state.policyData.policy

      )

          ]
      ),
    );
    }
    else {
      return SizedBox();
      }
  },
);
  ;
  }
}
