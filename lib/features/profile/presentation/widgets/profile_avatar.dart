import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mentroverso/core/utils/color_resources.dart';

class ProfileAvatar extends StatelessWidget {
  final String? currentImageUrl;
  final bool isEditable;
  final VoidCallback? onEdit;

  const ProfileAvatar({
    super.key,
    this.currentImageUrl,
    this.isEditable = false,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Avatar Circle
        SizedBox(
          width: 120,
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: currentImageUrl != null && currentImageUrl!.isNotEmpty
                ? Image.network(currentImageUrl!, fit: BoxFit.cover)
                :  CircleAvatar(
              backgroundColor: ColorResources.darkTransparentGray,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 60,
              ),
            ),
          ),
        ),

        // Green edit icon (only in editable mode)
        if (isEditable)
          Positioned(
            bottom: 0,
            right: 7,
            child: GestureDetector(
              onTap: onEdit,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.green,
                ),
                child: const Icon(
                  LineAwesomeIcons.pen_solid,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
