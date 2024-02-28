import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:postify/core/models/user.dart';
import 'package:postify/screens/home/_partials/post_action_button.dart';
import 'package:video_player/video_player.dart';

class PostItem extends StatefulWidget {
  const PostItem({
    super.key,
    this.subscribed = false,
    this.isVideo = false,
    required this.post,
  });

  final Post post;
  final bool subscribed;
  final bool isVideo;

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> with TickerProviderStateMixin {
  bool liked = false;
  bool _saved = false;

  Future? _initializeVideoPlayerFuture;

  AnimationController? _bookmarkAnimationController;
  AnimationController? _animationController;
  Animation<double>? _likeAnimation;
  Animation<double>? _bookMarkAnimation;
  VideoPlayerController? _videoPlayerController;

  @override
  initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _bookmarkAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _likeAnimation =
        Tween<double>(begin: 0.5, end: 1.0).animate(_animationController!);

    _bookMarkAnimation = Tween<double>(begin: 0.9, end: 1.0)
        .animate(_bookmarkAnimationController!);

    _animationController?.forward();

    _animationController?.addListener(() {
      setState(() {});
    });

    _bookmarkAnimationController?.forward();

    _bookmarkAnimationController?.addListener(() {
      setState(() {});
    });

    if (widget.post.video != null) {
      _videoPlayerController =
          VideoPlayerController.asset('assets/videos/bee.mp4');

      _initializeVideoPlayerFuture = _videoPlayerController?.initialize();
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _bookmarkAnimationController?.dispose();
    _videoPlayerController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            widget.post.video != null
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * .5,
                    child: FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          _videoPlayerController?.play().then((value) {
                            setState(() {});
                          });
                          return AspectRatio(
                            aspectRatio:
                                _videoPlayerController!.value.aspectRatio,
                            child: VideoPlayer(_videoPlayerController!),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  )
                : Image.asset(
                    widget.post.image!,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .5,
                    fit: BoxFit.cover,
                  ),
            Container(
              color: widget.post.video != null
                  ? Colors.transparent
                  : Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 52,
                                height: 52,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.red,
                                    width: 3,
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    widget.post.author.picture,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.post.author.userName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: widget.post.video != null
                                          ? Colors.white
                                          : null),
                                ),
                                Text(
                                  widget.post.tag,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: widget.post.video != null
                                          ? Colors.white
                                          : null),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.subscribed
                          ? const SizedBox.shrink()
                          : InkWell(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                        color: widget.post.video != null
                                            ? Colors.white
                                            : Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .color!)),
                                child: Text('Follow',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: widget.post.video != null
                                            ? Colors.white
                                            : null)),
                              ),
                            ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(PhosphorIcons.dots_three,
                              color: widget.post.video != null
                                  ? Colors.white
                                  : null))
                    ],
                  )),
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  PostActionButton(
                    onTap: () {
                      setState(() {
                        liked = !liked;
                      });

                      _animationController?.reset();
                      _animationController?.forward();
                    },
                    icon: AnimatedBuilder(
                      animation: _animationController!,
                      builder: (BuildContext context, Widget? child) {
                        return ScaleTransition(
                            scale: _likeAnimation!, child: child!);
                      },
                      child: Icon(
                        liked ? PhosphorIcons.heart_fill : PhosphorIcons.heart,
                        size: 32,
                        color: liked ? Colors.red : null,
                      ),
                    ),
                    value: widget.post.likesCount,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  PostActionButton(
                    onTap: () {
                      showModalBottomSheet(
                        showDragHandle: true,
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * .8,
                            child: const Column(
                              children: [
                                Text(
                                  'Comments',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      PhosphorIcons.chat_circle_dots,
                      size: 32,
                    ),
                    value: widget.post.commentsCount,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const PostActionButton(
                    icon: Icon(
                      PhosphorIcons.paper_plane_tilt,
                      size: 32,
                    ),
                    value: '',
                  ),
                  const Spacer(),
                  PostActionButton(
                    onTap: () {
                      setState(() {
                        _saved = !_saved;
                      });

                      _bookmarkAnimationController?.reset();
                      _bookmarkAnimationController?.forward();
                    },
                    icon: AnimatedBuilder(
                      animation: _bookMarkAnimation!,
                      builder: (BuildContext context, Widget? child) {
                        return ScaleTransition(
                          scale: _bookMarkAnimation!,
                          child: child,
                        );
                      },
                      child: Icon(
                        _saved
                            ? PhosphorIcons.bookmark_simple_fill
                            : PhosphorIcons.bookmark_simple,
                        color: _saved ? Colors.red : null,
                        size: 40,
                      ),
                    ),
                    value: '',
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              RichText(
                text: TextSpan(
                  text: '${widget.post.author.userName} ',
                  style: TextStyle(
                    fontFamily: 'JosefinSansRegular',
                    color: Theme.of(context).textTheme.bodyLarge!.color!,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${widget.post.body} ...',
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                    TextSpan(
                        text: ' more',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color
                                ?.withOpacity(.6))),
                  ],
                ),
              ),
              Text('${widget.post.timeAgo} min ago',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color
                          ?.withOpacity(.6)))
            ],
          ),
        )
      ],
    );
  }
}
