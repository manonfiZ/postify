import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:postify/core/models/user.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key, required this.user, required this.onComplete});

  final void Function()? onComplete;

  final User user;

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            StoryView(
              storyItems: [
                StoryItem.text(
                  title: "Story One",
                  backgroundColor: Colors.blue,
                ),
                StoryItem.text(
                  title: "Story Two",
                  backgroundColor: Colors.green,
                ),
                StoryItem.text(
                  title: "Story Three 👀",
                  backgroundColor: Colors.amber,
                ),
                StoryItem.text(
                  title: "Nice!\n\nTap to continue. 🏄",
                  backgroundColor: Colors.red,
                ),
                StoryItem.text(
                  title: "It's the end. 😎",
                  backgroundColor: Colors.black,
                ),
              ],
              onStoryShow: (storyItem, index) {
                print("Showing a story");
              },
              onComplete: () {
                widget.onComplete!.call();

                // Navigator.pop(context);
              },
              progressPosition: ProgressPosition.top,
              repeat: false,
              controller: storyController,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            widget.user.picture,
                            width: 32,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.user.name,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 32,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 0,
              left: 0,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white30),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          hintText: 'Send message',
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'JosefinSansRegular',
                          ),
                          filled: false,
                          fillColor: Colors.white10,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      PhosphorIcons.heart,
                      color: Colors.white,
                      size: 32,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      PhosphorIcons.paper_plane_tilt,
                      color: Colors.white,
                      size: 32,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
