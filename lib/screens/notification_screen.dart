import '../widgets/notification.dart' as notif;

import 'package:material_ui/material_ui.dart';

import '../models/app_notification.dart';

final _notifications = <AppNotification>[
  AppNotification(
    name: 'Test',
    post: 'Post',
    description: 'Description',
    createdAt: DateTime(2026, 11, 24),
  ),
  AppNotification(
    name: 'Test1',
    post: 'Post1',
    description: 'Description1',
    createdAt: DateTime(2026, 11, 23),
  ),
  AppNotification(
    name: 'Cyrus Robles',
    post: 'Kamusta',
    description: 'Reacted to your post',
    createdAt: DateTime(2026, 11, 22),
  ),
  AppNotification(
    name: 'Mavric Lao',
    post: 'Ribbit',
    description: 'Liked your post',
    createdAt: DateTime(2026, 11, 22),
  ),
  AppNotification(
    name: 'Froggie5',
    post: 'Ribbit',
    description: 'Liked your post',
    createdAt: DateTime(2026, 11, 22),
  ),
  AppNotification(
    name: 'Froggie6',
    post: 'Ribbit',
    description: 'Liked your post',
    createdAt: DateTime(2026, 11, 22),
  ),
  AppNotification(
    name: 'Froggie7',
    post: 'Ribbit',
    description: 'Liked your post',
    createdAt: DateTime(2026, 11, 22),
  ),
  AppNotification(
    name: 'Froggie8',
    post: 'Ribbit',
    description: 'Liked your post',
    createdAt: DateTime(2026, 11, 22),
  ),
  AppNotification(
    name: 'Froggie9',
    post: 'Ribbit',
    description: 'Liked your post',
    createdAt: DateTime(2026, 11, 22),
  ),
  AppNotification(
    name: 'Froggie10',
    post: 'Ribbit',
    description: 'Liked your post',
    createdAt: DateTime(2026, 11, 22),
  ),
  AppNotification(
    name: 'Froggie11',
    post: 'Ribbit',
    description: 'Liked your post',
    createdAt: DateTime(2026, 11, 22),
  ),
  AppNotification(
    name: 'Froggie11',
    post: 'Ribbit',
    description: 'Liked your post',
    createdAt: DateTime(2026, 11, 22),
  ),
  AppNotification(
    name: 'Froggie12',
    post: 'Ribbit',
    description: 'Liked your post',
    createdAt: DateTime(2026, 11, 22),
  ),
  AppNotification(
    name: 'Froggie13',
    post: 'Ribbit',
    description: 'Liked your post',
    createdAt: DateTime(2026, 11, 22),
  ),
  AppNotification(
    name: 'Froggie14',
    post: 'Ribbit',
    description: 'Liked your post',
    createdAt: DateTime(2026, 11, 22),
  ),
  AppNotification(
    name: 'Froggie15',
    post: 'Ribbit',
    description: 'Liked your post',
    createdAt: DateTime(2026, 11, 22),
  ),
  AppNotification(
    name: 'Froggie16',
    post: 'Ribbit',
    description: 'Liked your post',
    createdAt: DateTime(2026, 11, 22),
  ),
  AppNotification(
    name: 'Froggie17',
    post: 'Ribbit',
    description: 'Liked your post',
    createdAt: DateTime(2026, 11, 22),
  ),
  AppNotification(
    name: 'Froggie18',
    post: 'Ribbit',
    description: 'Liked your post',
    createdAt: DateTime(2026, 11, 22),
  ),
  AppNotification(
    name: 'Froggie19',
    post: 'Ribbit',
    description: 'Liked your post',
    createdAt: DateTime(2026, 11, 22),
  ),
  AppNotification(
    name: 'Froggie20',
    post: 'Ribbit',
    description: 'Liked your post',
    createdAt: DateTime(2026, 11, 22),
  ),
];

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.separated(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return notif.Notification(
            name: notification.name,
            post: notification.post,
            description: notification.description,
            createdAt: notification.createdAt,
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 1),
      ),
    );
  }
}
