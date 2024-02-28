import 'package:flutter/material.dart';
import 'package:postify/utils/constants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text(
          'Maya Shanya',
          style: TextStyle(
            fontFamily: 'MontserratBold',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/icons/drawer.png',
              width: 32,
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/user.jpg',
                    width: 100,
                    height: 100,
                  ),
                  const Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InfoItem(
                        label: 'Photos',
                        value: '123',
                      ),
                      InfoItem(
                        label: 'Followers',
                        value: '22.5k',
                      ),
                      InfoItem(
                        label: 'Follows',
                        value: '128',
                      ),
                    ],
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Maya Shanya',
                style: TextStyle(
                    color: kAppColor,
                    fontFamily: 'MontserratBold',
                    fontSize:
                        Theme.of(context).textTheme.headlineSmall!.fontSize!),
              ),
              Text(
                '@mayashanaya',
                style: TextStyle(
                  //   color: kAppColor,
                  fontFamily: 'MontserratBold',
                  color: Theme.of(context).dividerColor.withOpacity(.9),

                  fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize!,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Designer by profession loves to travel and great foodie would love to connect with like minded people',
                style: TextStyle(
                  //   color: kAppColor,
                  // color: Theme.of(context).dividerColor.withOpacity(.9),
                  fontWeight: FontWeight.bold,

                  fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize!,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 120,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 60,
                          child: StackedFollowers(
                            image: 'assets/images/user.jpg',
                          ),
                        ),
                        Positioned(
                          left: 30,
                          child: StackedFollowers(
                            image: 'assets/images/user.jpg',
                          ),
                        ),
                        Positioned(
                          child: StackedFollowers(
                            image: 'assets/images/user.jpg',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Followed by ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Expanded(
                            child: Text(
                              'Shreya',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Riya',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            ' and ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            ' Ravi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              ' and ',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              ' 1 other',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: const ActionButton(
                        outlined: false,
                        label: 'Follow',
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: const ActionButton(
                        outlined: true,
                        label: 'Message',
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: const ActionButton(
                        outlined: true,
                        label: 'Email',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.black12,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const TabBarButton(
                      selected: true,
                      label: 'Feeds',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const TabBarButton(
                      selected: false,
                      label: 'Video',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const TabBarButton(
                      selected: false,
                      label: 'Tagged',
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: const TabBarButton(
                        selected: false,
                        label: '...',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      //   width: MediaQuery.of(context).size.width * 6,
                      height: MediaQuery.of(context).size.height * .43,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.133,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/4.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.133,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/3.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.133,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/2.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.label,
    required this.outlined,
  });

  final String label;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: outlined ? null : kAppColor,
          border: outlined
              ? Border.all(
                  color: kAppColor,
                )
              : null),
      child: Text(
        label,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: outlined
                ? Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(.8)
                : Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class TabBarButton extends StatelessWidget {
  const TabBarButton({
    super.key,
    required this.label,
    required this.selected,
  });

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: selected ? kAppColor : null,
      ),
      child: Text(
        label,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: selected
                ? Colors.white
                : Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(.8),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class StackedFollowers extends StatelessWidget {
  const StackedFollowers({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
        ),
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize!,
            color: Theme.of(context).dividerColor.withOpacity(.5),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
