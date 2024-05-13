import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/features/profile/presentation/manger/contact_bloc/contact_bloc.dart';
class ContactWidget extends StatefulWidget {
  const ContactWidget({super.key});

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}
final bloc = KiwiContainer().resolve<ContactBloc>();
class _ContactWidgetState extends State<ContactWidget> {
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Text('أو يمكنك إرسال رسالة ',
            style: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 20.h,),
          customFormField(context, 'الاسم',1,1,
            bloc.nameController

          ),
          SizedBox(height: 20.h,),

          customFormField(context, 'رقم الموبيل',1,1,
          bloc.phoneNumberController),
          SizedBox(height: 20.h,),
          customFormField(context, 'الموضوع ',3,5,
          bloc.subjectController
          ),
          SizedBox(height: 20.h,),
          CustomButton(onPress: (){
            bloc.add(SendContactEvent());

          }, btnText: 'إرسال')

        ],
      ),
    );
  }

  Widget customFormField(BuildContext context ,String hint,int? minLines,int? mixLines,TextEditingController controller){
    return       TextFormField(
      controller:  controller,
      keyboardType: TextInputType.multiline,
      maxLines: mixLines?? 1,
      minLines: minLines??1,
      decoration:InputDecoration(

        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary
            )
        ),
        hintText: hint,


        hintStyle: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.bold
        ),


      ),
    );
  }
}
