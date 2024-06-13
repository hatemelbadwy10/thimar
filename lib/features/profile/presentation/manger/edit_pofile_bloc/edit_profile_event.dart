part of 'edit_profile_bloc.dart';

@immutable
sealed class EditProfileEvent {}
class  SendEditProfileEvent extends EditProfileEvent{
  File? image;
  String? name;
  String? phone;
  int? cityId;
  SendEditProfileEvent(
      this.image,
      this.name,
      this.phone,
      this.cityId,
      );

}
