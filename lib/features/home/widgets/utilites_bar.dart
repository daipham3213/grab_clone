import 'package:flutter/material.dart';

class UtilitiesBar extends StatelessWidget {
  const UtilitiesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          UtilWidget(
            onPressed: () {},
            icon: const Icon(Icons.wallet_giftcard),
            label: "Rewards",
          ),
          UtilWidget(
            onPressed: () {},
            icon: const Icon(Icons.wallet_giftcard),
            label: "Rewards",
          ),
          UtilWidget(
            onPressed: () {},
            icon: const Icon(Icons.wallet_giftcard),
            label: "Rewards",
          ),
          UtilWidget(
            onPressed: () {},
            icon: const Icon(Icons.wallet_giftcard),
            label: "Rewards",
          ),
          UtilWidget(
            onPressed: () {},
            icon: const Icon(Icons.wallet_giftcard),
            label: "Rewards",
          ),
        ],
      ),
    );
  }
}

class UtilWidget extends StatelessWidget {
  const UtilWidget(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.label});

  final Function onPressed;
  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: IconButton(
              onPressed: () => onPressed(),
              icon: icon,
            ),
          ),
          Expanded(child: Text(label)),
        ],
      ),
    );
  }
}
