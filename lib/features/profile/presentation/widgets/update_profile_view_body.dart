import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/color_resources.dart';
import 'package:mentroverso/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:mentroverso/features/profile/presentation/widgets/save_changes_button.dart';

import '../../../../core/widgets/gradient_outline_button.dart';
import '../../../../core/widgets/text_field.dart';

class UpdateProfileViewBody extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();

  UpdateProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const ProfileAvatar(),
          const SizedBox(height: 30),
          // BuildProfileForm(),
          CustomTextFormField(
            text: 'Name',
            label: '',
            color: ColorResources.lightTransparentGray,
            validator: (String) {},
            controller: firstNameController,
          ),
          CustomTextFormField(
            color: ColorResources.lightTransparentGray,
            text: 'Email',
            label: '',
            validator: (String) {},
            controller: firstNameController,
          ),
          CustomTextFormField(
            color: ColorResources.lightTransparentGray,
            text: 'Phone no',
            label: '',
            validator: (String) {},
            controller: firstNameController,
          ),
          CustomTextFormField(
            color: ColorResources.lightTransparentGray,
            text: 'Faculty',
            label: '',
            validator: (String) {},
            controller: firstNameController,
          ),
          CustomTextFormField(
            text: 'Major',
            label: '',
            validator: (String) {},
            controller: firstNameController,
            color: ColorResources.lightTransparentGray,
          ),
          CustomTextFormField(
            text: 'Graduation Year',
            label: '',
            validator: (String) {},
            controller: firstNameController,
            color: ColorResources.lightTransparentGray,
          ),
          CustomTextFormField(
            text: 'Graduation Status',
            label: '',
            validator: (String) {},
            controller: firstNameController,
            color: ColorResources.lightTransparentGray,
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Save Changes'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
