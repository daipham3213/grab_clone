import 'package:flutter/material.dart';
import 'package:grab_clone/features/home/widgets/banner.dart';
import 'package:grab_clone/features/home/widgets/qr_scanner.dart';
import 'package:grab_clone/features/home/widgets/search_box.dart';
import 'package:grab_clone/features/home/widgets/utilites_bar.dart';
import 'package:grab_clone/injector/injector.dart';
import 'package:grab_clone/services/log_service/log_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _logService = Injector.instance<LogService>();

  _onQRScannerPressed() {
    _logService.info('QRScanner pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const HomeBanner(),
                  SizedBox(
                    height: 200,
                    child: Container(),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 20,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: QRScanner(
                            onPressed: _onQRScannerPressed,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: const SearchBox(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
