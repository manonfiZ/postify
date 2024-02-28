import 'package:flutter/material.dart';

class ProfileTile extends StatefulWidget {
  final String label;
  final IconData icon;
  const ProfileTile({super.key, required this.label, required this.icon});

  @override
  State<ProfileTile> createState() => _ProfileTileState();
}

class _ProfileTileState extends State<ProfileTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(136, 235, 234, 234)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(widget.icon),
          const SizedBox(width: 11,),
          Text(widget.label),
        ],
      ),
    );
  }
}
