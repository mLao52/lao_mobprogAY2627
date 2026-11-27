class AppNotification {
  const AppNotification({
    required this.name,
    required this.post,
    required this.description,
    required this.createdAt,
  });

  final String name;
  final String post;
  final String description;
  final DateTime createdAt;
}
