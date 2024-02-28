import 'package:flutter/material.dart';

class AppSnackbar extends StatelessWidget {
  final SnackbarType type;

  final String content;

  const AppSnackbar({super.key, required this.type, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          _resolveSnackbarIcon(type),
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            content,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _resolveSnackbarIcon(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return Icons.check;
      case SnackbarType.error:
        return Icons.error;
      case SnackbarType.warning:
        return Icons.warning;
      case SnackbarType.info:
        return Icons.info;
      default:
    }
  }
}

resolveSnackbarType(SnackbarType type) {
  switch (type) {
    case SnackbarType.success:
      return Colors.green;
    case SnackbarType.error:
      return Colors.red;
    case SnackbarType.warning:
      return Colors.orange;
    case SnackbarType.info:
      return Colors.blue;
    default:
  }
}

enum SnackbarType { success, error, warning, info }
