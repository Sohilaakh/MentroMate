import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/core/widgets/text_field.dart';
import 'package:mentroverso/features/profile/data/models/user_model.dart';
import 'package:mentroverso/features/profile/presentation/widgets/profile_avatar.dart';
import '../../bloc/profile_bloc.dart';
import '../../bloc/profile_event.dart';

class UpdateProfileViewBody extends StatefulWidget {
  final UserModel user;

  const UpdateProfileViewBody({super.key, required this.user});

  @override
  State<UpdateProfileViewBody> createState() => _UpdateProfileViewBodyState();
}

class _UpdateProfileViewBodyState extends State<UpdateProfileViewBody> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController facultyController;
  late TextEditingController majorController;
  late TextEditingController graduationYearController;
  late TextEditingController graduationStatusController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(text: widget.user.firstName);
    lastNameController = TextEditingController(text: widget.user.lastName);
    emailController = TextEditingController(text: widget.user.email);
    phoneController = TextEditingController(text: widget.user.phoneNumber);
    facultyController = TextEditingController(text: widget.user.faculty);
    majorController = TextEditingController(text: widget.user.major);
    graduationYearController = TextEditingController(text: widget.user.graduationYear);
    graduationStatusController = TextEditingController(text: widget.user.graduationStatus);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          ProfileAvatar(),
          const SizedBox(height: 30),

          CustomTextFormField(
            text: 'First Name',
            label: '',
            color: ColorResources.lightTransparentGray,
            validator: (value) => null,
            controller: firstNameController,
          ),
          CustomTextFormField(
            text: 'Last Name',
            label: '',
            color: ColorResources.lightTransparentGray,
            validator: (value) => null,
            controller: lastNameController,
          ),
          CustomTextFormField(
            text: 'Email',
            label: '',
            color: ColorResources.lightTransparentGray,
            validator: (value) => null,
            controller: emailController,
          ),
          CustomTextFormField(
            text: 'Phone no',
            label: '',
            color: ColorResources.lightTransparentGray,
            validator: (value) => null,
            controller: phoneController,
          ),
          CustomTextFormField(
            text: 'Faculty',
            label: '',
            color: ColorResources.lightTransparentGray,
            validator: (value) => null,
            controller: facultyController,
          ),
          CustomTextFormField(
            text: 'Major',
            label: '',
            color: ColorResources.lightTransparentGray,
            validator: (value) => null,
            controller: majorController,
          ),
          CustomTextFormField(
            text: 'Graduation Year',
            label: '',
            color: ColorResources.lightTransparentGray,
            validator: (value) => null,
            controller: graduationYearController,
          ),
          CustomTextFormField(
            text: 'Graduation Status',
            label: '',
            color: ColorResources.lightTransparentGray,
            validator: (value) => null,
            controller: graduationStatusController,
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<ProfileBloc>().add(UpdateUserProfile(
                widget.user.uid,
                {
                  'firstName': firstNameController.text.trim(),
                  'lastName': lastNameController.text.trim(),
                  'email': emailController.text.trim(),
                  'phoneNumber': phoneController.text.trim(),
                  'faculty': facultyController.text.trim(),
                  'major': majorController.text.trim(),
                  'graduationYear': graduationYearController.text.trim(),
                  'graduationStatus': graduationStatusController.text.trim(),
                },
              ));

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Profile updated successfully'),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Save Changes'),
          ),
        ],
      ),
    );
  }
}
