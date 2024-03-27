import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/features/profile/presentation/views/widgets/profile_list__view_item.dart';
import 'package:thimar/features/profile/presentation/views/widgets/profile_photo_widget.dart';
class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

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
      ],
    );
  }
}
