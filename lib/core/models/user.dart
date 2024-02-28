class User {
  String name, picture, userName;

  User({
    required this.userName,
    required this.name,
    required this.picture,
  });
}

final List<User> users = [
  User(
      name: 'Rebika Tommy',
      picture: 'assets/images/user.jpg',
      userName: 'rebika_tommy'),
  User(
      name: 'Ricchard D.',
      picture: 'assets/images/user1.png',
      userName: 'ricch_d'),
  User(
      name: 'Michreal',
      picture: 'assets/images/user2.png',
      userName: 'ricch_d'),
  User(
      name: 'Asfiya',
      picture: 'assets/images/user3.jpg',
      userName: 'asfiya_uidesigner'),
  User(
      name: 'Edwin Aldo',
      picture: 'assets/images/user.jpg',
      userName: 'edwin_aldo'),
];

class Post {
  final String? video;
  final String likesCount;
  final String commentsCount;
  final String? image;
  final String body;
  final String tag;
  final User author;
  final String timeAgo;

  Post(
      {this.video,
      required this.likesCount,
      required this.commentsCount,
      this.image,
      required this.body,
      required this.tag,
      required this.author,
      required this.timeAgo});
}

final List<Post> posts = [
  Post(
      likesCount: '256',
      commentsCount: '21',
      image: 'assets/images/1.jpg',
      body: "Sometimes roads take us to new destination which gives us",
      tag: 'Hawayien | Arijit Singh | Original',
      author: users[3],
      timeAgo: "25"),
  Post(
      likesCount: '1.5 k',
      commentsCount: '10',
      image: 'assets/images/4.jpg',
      body: "Sometimes roads take us to new destination which gives us",
      tag: 'Bengaluru | the pizza cafe',
      author: users[4],
      timeAgo: "26"),
  Post(
      likesCount: '500',
      commentsCount: '100',
      image: 'assets/images/6.jpg',
      body: "Sometimes roads take us to new destination which gives us",
      tag: 'Cotonou | Amazon place',
      author: users[0],
      timeAgo: "50"),
  Post(
      likesCount: '50',
      commentsCount: '20',
      video: 'assets/videos/bee.mp4',
      body: "Sometimes roads take us to new destination which gives us",
      tag: 'Somewhere in the world',
      author: users[1],
      timeAgo: "5"),
];
