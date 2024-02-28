import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:postify/core/models/user.dart';
import 'package:postify/screens/home/_partials/post_item.dart';
import 'package:postify/screens/home/_partials/story_page.dart';
import 'package:postify/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController? _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7), color: kAppColor),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '250',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 5,
                ),
                Image.asset(
                  'assets/icons/coins.png',
                  width: 28,
                )
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              PhosphorIcons.magnifying_glass,
              size: 32,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Badge(
              largeSize: 18.0,
              child: Icon(
                PhosphorIcons.heart,
                size: 32,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Badge(
              largeSize: 18.0,
              label: const Text(
                '2',
                style: TextStyle(fontSize: 15),
              ),
              child: Image.asset(
                'assets/icons/chat.png',
                width: 32,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        if (index != 0) {
                          showModalBottomSheet(
                            useSafeArea: true,
                            useRootNavigator: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return PageView.builder(
                                controller: _pageController,
                                itemCount: users.length,
                                itemBuilder: (context, index) {
                                  return StoryPage(
                                    user: users[index],
                                    onComplete: () {
                                      int currentView = index + 1;

                                      if (currentView < users.length) {
                                        _pageController!
                                            .jumpToPage(currentView);
                                      }
                                      if (currentView == users.length) {
                                        Navigator.pop(context);
                                      }
                                    },
                                  );
                                },
                              );
                            },
                          );
                          //   Navigator.push(context, MaterialPageRoute(
                          //     builder: (context) {
                          //       return const StoryPage();
                          //     },
                          //   ));
                        }
                      },
                      child: StoryListItem(
                        isFirst: index == 0,
                        user: users[index].name,
                        profile: users[index].picture,
                      ));
                },
              ),
            ),
            ListView.builder(
              itemCount: posts.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final Post post = posts[index];
                return PostItem(
                  post: post,
                  subscribed: index.isOdd,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class StoryListItem extends StatelessWidget {
  const StoryListItem({
    super.key,
    this.isFirst = false,
    required this.user,
    required this.profile,
  });

  final bool isFirst;
  final String user;
  final String profile;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: isFirst ? Alignment.bottomRight : Alignment.center,
            children: [
              isFirst
                  ? const SizedBox.shrink()
                  : Container(
                      width: 90,
                      height: 90,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(color: Colors.greenAccent, width: 2),
                      ),
                    ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    profile,
                    width: isFirst ? 90 : 80,
                    height: isFirst ? 90 : 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              isFirst
                  ? GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kAppColor),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 90,
            child: Text(
              isFirst ? 'Your story' : user,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
