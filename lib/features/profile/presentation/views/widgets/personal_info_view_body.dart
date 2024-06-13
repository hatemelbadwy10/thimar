import 'dart:io';

import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar/core/utils/app_routers.dart';
import 'package:thimar/core/utils/cach_helper.dart';
import 'package:thimar/core/utils/styles.dart';
import 'package:thimar/core/widgets/custom_button.dart';
import 'package:thimar/features/home/presentation/views/widgets/custom_header.dart';
import 'package:thimar/features/profile/presentation/manger/edit_pofile_bloc/edit_profile_bloc.dart';

class PersonalInfoViewBody extends StatefulWidget {
  const PersonalInfoViewBody({super.key});

  @override
  State<PersonalInfoViewBody> createState() => _PersonalInfoViewBodyState();
}

class _PersonalInfoViewBodyState extends State<PersonalInfoViewBody> {
  final nameController = TextEditingController(
    text: CacheHelper.getFullName(),
  );

  final phoneNumberController = TextEditingController(
    text: CacheHelper.getPhone(),
  );

  final cityNameController = TextEditingController(
    text: CacheHelper.getCity(),
  );

  final passwordController = TextEditingController();

  File? selectedImage;
  final bloc = KiwiContainer().resolve<EditProfileBloc>();
  int cityId = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            CustomAppBarSec(
                text: 'البيانات الشخصية',
                onPress: () {
                  GoRouter.of(context).pop(AppRouter.kProfileView);
                }),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        15.r,
                      ),
                      topLeft: Radius.circular(
                        15.r,
                      ),
                    ),
                  ),
                  builder: (context) => SizedBox(
                    height: 150.h,
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        const Center(
                          child: Text(
                            "اختار الصورة من",
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Container(
                                width: 100.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                    15.r,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.camera_alt,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    const Text(
                                      "الكاميرا",
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () async {
                                final image = await ImagePicker
                                    .platform
                                    .pickImage(
                                  source: ImageSource.camera,
                                  imageQuality: 30,
                                );
                                if (image != null) {
                                  selectedImage =
                                      File(image.path);
                                  setState(() {});
                                }
                                Navigator.pop(
                                    context, selectedImage);
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                width: 120.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                    15.r,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons
                                          .photo_library_outlined,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    const Text(
                                      "المعرض",
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () async {
                                final image = await ImagePicker
                                    .platform
                                    .pickImage(
                                  source: ImageSource.gallery,
                                  imageQuality: 35,
                                );
                                if (image != null) {
                                  selectedImage =
                                      File(image.path);
                                  setState(() {});
                                }
                                Navigator.pop(
                                    context, selectedImage);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Container(
                height: 100.h,
                width: 100.w,
                decoration:  BoxDecoration(
                  image: DecorationImage(image: NetworkImage(CacheHelper.getImage())),
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 18.sp,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              CacheHelper.getFullName(),
              style: Styles.textStyle17,
            ),
            Text(
              CacheHelper.getPhone(),
              style: Styles.textStyle17.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            AppInput(
              controller: nameController,
              keyboardType: TextInputType.name,
              prefixIcon: Icon(Icons.person),
              labelText: "اسم المستخدم",
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                countryCode(context),
                 Expanded(
                    child: AppInput(
                        labelText: 'رقم الجوال',
                        controller: phoneNumberController,
                        prefixIcon:Icon(Icons.phone)))
              ],
            ),
            SizedBox(height: 16.h,),
             AppInput(labelText: 'المدينة', controller:cityNameController, prefixIcon:Icon(Icons.flag)),
            SizedBox(height: 16.h,),

             AppInput(
              controller: passwordController,
              labelText: "كلمة المرور",
              prefixIcon:Icon(Icons.password),
              keyboardType: TextInputType.visiblePassword,

              isEnabled: false,
              onPress: ()
              {

              },
              maxLines: 1,
            ),
            SizedBox(height: 180.h,),
            BlocBuilder(
              bloc:bloc,
  builder: (context, state) {
                if(state is EditProfileLoading){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else{
                  return CustomButton(onPress: (){

                    bloc.add(SendEditProfileEvent(

                      selectedImage,
                      nameController.text,
                      phoneNumberController.text,
                      cityId,
                    ));
                  }, btnText: 'تعديل البيانات');
                }

  },
),
            //Todo change Container color and password ui

          ],
        ),
      ),
    );
  }

  Widget countryCode(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: Container(
        height: 60.h,
        width: 69.w,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 6.h),
          child: Column(
            children: [
              Flag.fromCode(
                FlagsCode.SA,
                height: 20.h,
                width: 32.w,
                fit: BoxFit.cover,
                borderRadius: 8.0,
              ),
              SizedBox(
                height: 2.6.h,
              ),
              Text(
                '+966',
                style: Styles.textStyle15,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppInput extends StatefulWidget {
  const AppInput({
    super.key,
    this.controller,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.isSearch = false,
    this.isFilled = false,
    this.isEnabled = true,
    this.labelText,
    this.validator,
    this.minLines,
    this.maxLines,
    this.onPress,
    this.suffixIcon,
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final bool isPassword, isEnabled, isFilled, isSearch;
  final String? labelText;
  final Icon? prefixIcon;
  final TextInputType keyboardType;
  final FormFieldValidator<String?>? validator;
  final int? minLines, maxLines;
  final VoidCallback? onPress;
  final Widget? suffixIcon;
  final Function(String)? onChanged, onSubmitted;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: TextFormField(
        onFieldSubmitted: widget.onSubmitted,
        onChanged: widget.onChanged,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        decoration: InputDecoration(
          icon: widget.keyboardType == TextInputType.phone
              ? Container(
            height: 60.h,
            width: 69.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.white,
              border: Border.all(
                color: const Color(
                  0xffF3F3F3,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/icons/appInputIcons/saudi.png",
                  width: 32.w,
                  height: 20.h,
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "966+",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                ),
              ],
            ),
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(
              color: Color(
                0xffF3F3F3,
              ),
            ),
          ),
          filled: widget.isFilled,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(
              color: Color(
                0xffF3F3F3,
              ),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(
              color: Color(
                0xffF3F3F3,
              ),
            ),
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            fontSize: 15.sp,
          ),
          prefixIcon: widget.prefixIcon != null
              ? Padding(
            padding: EdgeInsetsDirectional.all(
              12.r,
            ),
            child: Icon(
           Icons.abc
            , fill: .5,
            size:  32

            ),
          )
              : null,
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              isPasswordHidden ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                isPasswordHidden = !isPasswordHidden;
              });
            },
          )
              : widget.suffixIcon,
        ),
        obscureText: isPasswordHidden && widget.isPassword,
        enabled: widget.isEnabled,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        autofocus: widget.isSearch,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
