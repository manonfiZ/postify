import 'package:flutter/material.dart';

class PostActionButton extends StatelessWidget {
  const PostActionButton({
    super.key,
    required this.icon,
    required this.value,
    this.onTap,
  });

  final Widget icon;
  final String value;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 5,
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
