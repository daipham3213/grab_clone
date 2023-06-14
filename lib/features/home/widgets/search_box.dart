import 'package:flutter/material.dart';
import 'package:grab_clone/generated/l10n.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: TextField(
        decoration: InputDecoration(
          hintText: S.of(context).searchHint,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          border: InputBorder.none,
          suffixIcon: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1,
                ),
              ),
            ),
            child: const Icon(
              Icons.favorite_outline,
              color: Colors.black,
            ),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
