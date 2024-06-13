import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/features/profile/presentation/manger/logout_bloc/logout_bloc.dart';
import 'package:thimar/features/profile/presentation/views/widgets/profile_list__view_item.dart';
import 'package:thimar/features/profile/presentation/views/widgets/profile_photo_widget.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}
final bloc = KiwiContainer().resolve<LogoutBloc>();
class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        const ProfilePhotoWidget(),
        SizedBox(height: 19.h,),
        ProfileListViewItem(title: 'البيانات الشخصية', icon: CupertinoIcons.person, onPress: (){
          GoRouter.of(context).push(AppRouter.kPersonalInfoView);
        }),
        ProfileListViewItem(title: 'المحفظة', icon: Icons.wallet_outlined, onPress: (){
          GoRouter.of(context).push(AppRouter.kWalletView);
        }),
        ProfileListViewItem(title: 'العناوين', icon: Icons.location_on_outlined, onPress: (){}),
        ProfileListViewItem(title: 'الدفع', icon: FontAwesomeIcons.dollarSign, onPress: (){}),
        ProfileListViewItem(title: 'أسئلة متكررة', icon: Icons.question_mark_outlined, onPress: (){
          GoRouter.of(context).push(AppRouter.kQuestionsView);
        }),
        ProfileListViewItem(title: 'سياسة الخصوصية', icon: Icons.check_box_outlined, onPress: (){
          GoRouter.of(context).push(AppRouter.kPrivacyView);
        }),
        ProfileListViewItem(title: 'تواصل معنا', icon: Icons.phone_in_talk_rounded, onPress: (){
          GoRouter.of(context).push(AppRouter.kContactUsView);
        }),
        ProfileListViewItem(title: 'الشكاوي والأقتراحات', icon: FontAwesomeIcons.pencil, onPress: (){
          GoRouter.of(context).push(AppRouter.kSuggestionsView);
        }),
        ProfileListViewItem(title: 'مشاركة التطبيق', icon: Icons.share_outlined, onPress: (){}),
        ProfileListViewItem(title: 'عن التطبيق', icon: FontAwesomeIcons.exclamation, onPress: (){
          GoRouter.of(context).push(AppRouter.kAboutView);
        }),
        ProfileListViewItem(title: 'الشروط والأحكام', icon: Icons.newspaper_rounded, onPress: (){}),
        ProfileListViewItem(title: 'تقييم التطبيق', icon: Icons.star_border_outlined, onPress: (){}),
        ProfileListViewItem(title: 'تسجيل الخروج', icon: Icons.logout, onPress: (){
          bloc.add(SendLogoutEvent());
          BlocConsumer(
          bloc: bloc,
          builder: (BuildContext context, state) {
            if(state is LogoutLoading){
              return Center(child: CircularProgressIndicator(),);
            }
            else {


              return Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 16.w,
                  vertical: 10.h,
              ),
              );
            }
            }, listener: (BuildContext context, Object? state) {
            if(state is LogoutSuccess){
              GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
            }
          },
          );

        }
        ),
      ],
    );
  }
}
