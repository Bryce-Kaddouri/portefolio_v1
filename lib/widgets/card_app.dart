import 'package:flutter/material.dart';
import 'package:portefolio/util/app_constant.dart';
import 'package:portefolio/widgets/chip_app.dart';

class CardApp extends StatefulWidget {
  String title;
  String imgURL;
  CardApp({super.key, required this.title, required this.imgURL});

  @override
  State<CardApp> createState() => _CardAppState();
}

class _CardAppState extends State<CardApp> {
  bool isHover = false;
  int count = 4;
  int currentLine = 0;

  int getNbLines(int total) {
    int nbLines = 0;
    if (total % 3 == 0) {
      nbLines = total ~/ 3;
    } else {
      nbLines = (total ~/ 3) + 1;
    }
    return nbLines;
  }




  @override
  Widget build(BuildContext context) {
    int test = getNbLines(count);
    print('test: ${1 % 3}');
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
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(child:

                  Text(
                    widget.title,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ),

                ],
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(child: SizedBox()),
              // max width of child 100
              Container(
                child:
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: MediaQuery.of(context).size.width > 420 && MediaQuery.of(context).size.width < 650 ? 2.8 : 2,
              children: [
                ChipApp(title: 'Flutter',),
                ChipApp(title: 'Dart',),
                ChipApp(title: 'Android',),
                ChipApp(title: 'Android',),


              ],
              )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
