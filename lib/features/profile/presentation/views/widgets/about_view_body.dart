import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/assets.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/profile/presentation/manger/about_bloc/about_bloc.dart';

class AboutViewBody extends StatefulWidget {
  const AboutViewBody({super.key});

  @override
  State<AboutViewBody> createState() => _AboutViewBodyState();
}

final bloc = KiwiContainer().resolve<AboutBloc>()
  ..add(GetAboutEvent());

class _AboutViewBodyState extends State<AboutViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if(state is AboutLoading){

          return Center(child: CircularProgressIndicator());
        }
        else if( state is AboutSuccess){

          return SafeArea(
            child: Column(
              children: [
                CustomAppBarSec(text: 'عن التطبيق', onPress: () {
                  GoRouter.of(context).pop(AppRouter.kProfileView);
                }),
                SizedBox(height: 24.h,),
                Center(child: Image.asset(AssetsData.logo)),
                SizedBox(height: 24.h,),
               Html(data: state.date.about)
              ],
            ),
          );
        }
        else{

          return SizedBox();
        }
      },
    );
  }
}
