import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/home_screen.dart';
import 'screens/newsfeed_screen.dart';
import 'screens/notification_screen.dart';
import 'constants.dart';

void main() => runApp(const LaoFacebook());

class LaoFacebook extends StatelessWidget {
  const LaoFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 715),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: APP_NAME,
          initialRoute: '/home',
          routes: {
            '/newsfeed': (context) => const NewsFeedScreen(),
            '/home': (context) => const HomeScreen(),
            '/Notification': (context) => const NotificationScreen(),
          },
        );
      },
    );
  }
}
