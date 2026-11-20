import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsFeedImage extends StatelessWidget {
  final String? imageUrl;

  const NewsFeedImage({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return _imagePlaceholder();
    }

    return Image.asset(
      imageUrl!,
      width: double.infinity,
      height: 220.h,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return _imagePlaceholder();
      },
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      width: double.infinity,
      height: 220.h,
      color: Colors.grey.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image_outlined, size: 60.sp, color: Colors.grey),
          SizedBox(height: 8.h),
          Text(
            'Image unavailable',
            style: TextStyle(color: Colors.grey.shade700, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
