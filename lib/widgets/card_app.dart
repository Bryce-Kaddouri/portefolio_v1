import 'package:flutter/material.dart';
import 'package:portefolio/util/app_constant.dart';

class CardApp extends StatefulWidget {
  String title;
  String imgURL;
  CardApp({super.key, required this.title, required this.imgURL});

  @override
  State<CardApp> createState() => _CardAppState();
}

class _CardAppState extends State<CardApp> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        //debugPrint('On Entry hover');
        print('On Entry hover');
        setState(() {
          isHover = true;
        });
      },
      onExit: (_) {
        print('On Exit hover');
        setState(() {
          isHover = false;
        });
        // debugPrint('On Exit hover');
      },
      child: Card(
        color: isHover
            ? AppConstant.APP_HOVER_CARD_COLOR
            : AppConstant.APP_CARD_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: AppConstant.APP_HOVER_BORDER_COLOR,
            width: 2,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          height: 100,
          width: 100,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.red,
                    ),
                    height: 100,
                    width: 100,
                    child: widget.imgURL.isEmpty
                        ? SizedBox()
                        : Image.asset(widget.imgURL),
                  ),
                  Text(
                    widget.title,
                    maxLines: 2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
