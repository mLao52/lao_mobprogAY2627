import 'package:material_ui/material_ui.dart';

import '../models/social_post.dart';
import '../widgets/newsfeed_card.dart';

final _posts = <SocialPost>[
  SocialPost(
    userName: 'Cyrus Robles',
    content: 'Kamusta',
    numOfLikes: 100,
    date: DateTime(2026, 10, 11),
    avatarUrl: 'assets/icons/stars.jpg',
  ),
  SocialPost(
    userName: 'Roben Juanatas',
    content: 'Kicking off the holiday season with ICpEP-NCR!',
    numOfLikes: 200,
    date: DateTime(2026, 12, 2),
    hasImage: true,
    imageUrl: 'assets/images/froggie.jpg',
    avatarUrl: 'assets/icons/owl.jpg',
  ),
  SocialPost(
    userName: 'Leomary Mijares',
    content: 'Ribbit',
    numOfLikes: 999999999,
    date: DateTime(2026, 11, 27),
    hasImage: true,
    imageUrl: 'assets/images/froggie.jpg',
    avatarUrl: 'assets/images/froggie.jpg',
  ),
  SocialPost(
    userName: 'RAHHHHH',
    content: 'RAHHHHHHHHHHHHHHHHHHHHHHH',
    numOfLikes: 42,
    date: DateTime(2026, 11, 24),
    hasImage: true,
    avatarUrl: 'assets/icons/owl.jpg',
  ),
  SocialPost(
    userName: 'Gurt',
    content: 'Yo',
    numOfLikes: 42,
    date: DateTime(2026, 11, 24),
    hasImage: true,
  ),
  SocialPost(
    userName: 'Bleh',
    content: 'Bleh',
    numOfLikes: 42,
    date: DateTime(2026, 11, 24),
  ),
  SocialPost(
    userName: 'Mavric Lao',
    content: '*paws at u*',
    numOfLikes: 42,
    date: DateTime(2026, 11, 24),
    hasImage: true,
    imageUrl: 'assets/images/meimei.jpg',
  ),
  SocialPost(
    userName: 'Leomary Mijares',
    content: '*paws at u*',
    numOfLikes: 42,
    date: DateTime(2026, 11, 24),
    imageUrl: 'assets/images/meimei.jpg',
    hasImage: true,
  ),
  SocialPost(
    userName: 'The Observable Universe',
    content: 'Im expanding yo.',
    numOfLikes: 42,
    date: DateTime(2026, 11, 24),
    avatarUrl: 'assets/icons/stars.jpg',
  ),
  SocialPost(
    userName: 'Owl',
    content: 'LF cravings.',
    numOfLikes: 42,
    date: DateTime(2026, 11, 24),
    hasImage: true,
    avatarUrl: 'assets/icons/owl.jpg',
    imageUrl: 'assets/images/froggie.jpg',
  ),
  SocialPost(
    userName: 'Gragas',
    content: 'Bomba.',
    numOfLikes: 42,
    date: DateTime(2026, 11, 24),
  ),
  SocialPost(
    content: 'Dribble',
    userName: 'Balls Community',
    numOfLikes: 42,
    date: DateTime(2026, 11, 24),
  ),
];

class NewsFeedScreen extends StatelessWidget {
  final ImageProvider currentUserAvatar;

  const NewsFeedScreen({
    super.key,
    this.currentUserAvatar = const AssetImage('assets/icons/owl.jpg'),
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index];
        return NewsFeedCard(
          userName: post.userName,
          postContent: post.content,
          numOfLikes: post.numOfLikes,
          date: MaterialLocalizations.of(context).formatMediumDate(post.date),
          hasImage: post.hasImage,
          imageUrl: post.imageUrl,
          avatarUrl: post.avatarUrl,
          currentUserAvatar: currentUserAvatar,
        );
      },
    );
  }
}
