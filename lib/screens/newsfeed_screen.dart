import 'package:material_ui/material_ui.dart';

import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  final ImageProvider currentUserAvatar;

  const NewsFeedScreen({
    super.key,
    this.currentUserAvatar = const AssetImage('assets/icons/owl.jpg'),
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NewsFeedCard(
          userName: 'Cyrus Robles',
          postContent: 'Kamusta',
          numOfLikes: 100,
          date: 'October 11',
          avatarUrl: 'assets/icons/stars.jpg',
          currentUserAvatar: currentUserAvatar,
        ),
        NewsFeedCard(
          userName: 'Roben Juanatas',
          postContent: 'Kicking off the holiday season with ICpEP-NCR!',
          numOfLikes: 200,
          date: 'December 2',
          hasImage: true,
          imageUrl: 'assets/images/froggie.jpg',
          avatarUrl: 'assets/icons/owl.jpg',
          currentUserAvatar: currentUserAvatar,
        ),
      ],
    );
  }
}
