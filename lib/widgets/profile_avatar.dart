import 'package:material_ui/material_ui.dart';

import '../constants.dart';

class ProfileAvatar extends StatelessWidget {
  final ImageProvider? image;
  final double radius;
  final VoidCallback? onTap;
  final bool showEditIndicator;

  const ProfileAvatar({
    super.key,
    required this.image,
    required this.radius,
    this.onTap,
    this.showEditIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    final avatar = Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: image,
          child: image == null
              ? Icon(Icons.person, color: Colors.white, size: radius)
              : null,
        ),
        if (showEditIndicator)
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: radius * 0.36,
              backgroundColor: FB_PRIMARY,
              child: Icon(Icons.edit, size: radius * 0.48, color: Colors.white),
            ),
          ),
      ],
    );

    if (onTap == null) {
      return avatar;
    }

    return GestureDetector(onTap: onTap, child: avatar);
  }
}
