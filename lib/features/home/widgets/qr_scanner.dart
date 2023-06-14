import 'package:flutter/material.dart';

class QRScanner extends StatelessWidget {
  final Function() onPressed;

  const QRScanner({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: IconButton.outlined(
          onPressed: onPressed,
          icon: const Icon(Icons.flip_outlined),
          splashColor: Colors.transparent,
        )
      ),
    );
  }
}
