import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            height: 150,
            color: Colors.teal[100],
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Đi Grab buổi sáng, tiết kiệm đến 50%',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        'Đi 1 chuyến tặng thêm 7 chuyến',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Container(
                          margin:
                              const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                          child: const Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 16,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.teal[100],
            height: 150,
            child: SvgPicture.asset(
              'assets/images/header_background.svg',
              semanticsLabel: 'Header background',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
