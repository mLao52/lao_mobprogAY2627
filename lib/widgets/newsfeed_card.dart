import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import 'custom_text.dart';
import 'newsfeed_image.dart';
import 'custom_button.dart';

import 'package:flutter/services.dart';

import 'profile_avatar.dart';

class NewsFeedCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final bool hasImage;
  final String? imageUrl;
  final String? avatarUrl;
  final ImageProvider currentUserAvatar;

  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.numOfLikes,
    required this.date,
    this.hasImage = false,
    this.imageUrl,
    this.avatarUrl,
    required this.currentUserAvatar,
  });

  @override
  State<NewsFeedCard> createState() => _NewsFeedCardState();
}

class _NewsFeedCardState extends State<NewsFeedCard> {
  late int likes;
  bool isLiked = false;

  final FocusNode commentFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    likes = widget.numOfLikes;
  }

  @override
  void dispose() {
    commentFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ImageProvider? avatarImage =
        widget.avatarUrl == null || widget.avatarUrl!.isEmpty
        ? null
        : AssetImage(widget.avatarUrl!);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ProfileAvatar(image: avatarImage, radius: 22.r),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: widget.userName,
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        text: widget.date,
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            CustomText(
              text: widget.postContent,
              fontSize: 14.sp,
              color: Colors.black,
            ),
            if (widget.hasImage) ...[
              SizedBox(height: 12.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: NewsFeedImage(imageUrl: widget.imageUrl),
              ),
            ],
            SizedBox(height: 12.h),
            Row(
              children: [
                const Icon(Icons.thumb_up, color: FB_PRIMARY, size: 18),
                SizedBox(width: 6.w),
                CustomText(
                  text: likes.toString(),
                  fontSize: 13.sp,
                  color: Colors.grey,
                ),
                const Spacer(),
                CustomText(
                  text: '12 comments',
                  fontSize: 13.sp,
                  color: Colors.grey,
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  icon: isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                  label: 'Like',
                  color: isLiked ? FB_PRIMARY : Colors.grey,
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                      likes += isLiked ? 1 : -1;
                    });
                  },
                ),
                CustomButton(
                  icon: Icons.comment_outlined,
                  label: 'Comment',
                  onPressed: () {
                    FocusScope.of(context).requestFocus(commentFocusNode);
                  },
                ),
                CustomButton(
                  icon: Icons.share_outlined,
                  label: 'Share',
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(
                        text: '${widget.userName}: ${widget.postContent}',
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Post copied!')),
                    );
                  },
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                ProfileAvatar(image: widget.currentUserAvatar, radius: 16),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextField(
                    focusNode: commentFocusNode,
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 8.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            CustomText(
              text: 'View comments',
              fontSize: 13.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
