import 'dart:io';

import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';
import 'newsfeed_screen.dart';
import '../widgets/profile_avatar.dart';

const _navigationItems = <_NavigationItem>[
  _NavigationItem(icon: Icons.home, label: 'Home'),
  _NavigationItem(icon: Icons.people, label: 'Friends'),
  _NavigationItem(icon: Icons.person, label: 'Profile'),
  _NavigationItem(
    icon: Icons.notifications,
    label: 'Notifications',
    route: '/Notification',
  ),
  _NavigationItem(icon: Icons.menu, label: 'Menu'),
  _NavigationItem(icon: Icons.star, label: 'TestTest'),
];

class _NavigationItem {
  const _NavigationItem({required this.icon, required this.label, this.route});

  final IconData icon;
  final String label;
  final String? route;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  File? _selectedProfileAvatar;
  final ImagePicker _imagePicker = ImagePicker();

  ImageProvider get _profileAvatarImage {
    if (_selectedProfileAvatar != null) {
      return FileImage(_selectedProfileAvatar!);
    }
    return const AssetImage('assets/icons/owl.jpg');
  }

  Future<void> _changeProfileAvatar() async {
    try {
      final pickedImage = await _imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (!mounted || pickedImage == null) {
        return;
      }

      setState(() {
        _selectedProfileAvatar = File(pickedImage.path);
      });
    } on PlatformException catch (error) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Could not select a profile photo: ${error.message ?? error.code}',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FB_BACKGROUND,
      appBar: AppBar(
        backgroundColor: FB_BACKGROUND,
        elevation: 0,
        title: Text(
          selectedIndex == 0 ? APP_NAME : _navigationItems[selectedIndex].label,
          style: TextStyle(
            color: FB_PRIMARY,
            fontSize: selectedIndex == 0 ? 30 : 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle, color: FB_DARK_PRIMARY),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: FB_DARK_PRIMARY),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message, color: FB_DARK_PRIMARY),
          ),
        ],
      ),
      body: _buildSelectedTab(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: FB_PRIMARY,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          final route = _navigationItems[index].route;
          if (route != null) {
            Navigator.pushNamed(context, route);
            return;
          }

          setState(() {
            selectedIndex = index;
          });
        },
        items: _navigationItems
            .map(
              (item) => BottomNavigationBarItem(
                icon: Icon(item.icon),
                label: item.label,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildSelectedTab() {
    if (selectedIndex == 0) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Row(
              children: [
                ProfileAvatar(
                  image: _profileAvatarImage,
                  radius: 22.r,
                  onTap: _changeProfileAvatar,
                  showEditIndicator: true,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: const Text('What\'s on your mind?'),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.photo_library, color: FB_DARK_PRIMARY),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: NewsFeedScreen(currentUserAvatar: _profileAvatarImage),
          ),
        ],
      );
    }

    return Center(child: Text(_navigationItems[selectedIndex].label));
  }
}
