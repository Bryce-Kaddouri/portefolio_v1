import 'package:flutter/material.dart';
import 'package:portefolio/util/app_constant.dart';
import 'package:portefolio/widgets/button_app.dart';
import 'package:portefolio/widgets/card_app.dart';
import 'package:rive/rive.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: AppConstant.APP_BACKGROUND_COLOR,
      ),
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 650, name: 'mobile'),
            const Breakpoint(start: 651, end: 900, name: 'portraitTablet'),
            const Breakpoint(start: 901, end: 1000, name: 'landscapeTablet'),
            const Breakpoint(start: 1001, end: 1920, name: 'desktop'),
            const Breakpoint(start: 1921, end: double.infinity, name: 'bigDesktop'),
          ],
        );
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 100,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: const RiveAnimation.asset(
                        'assets/rive/developer.riv',
                        fit: BoxFit.contain,
                        useArtboardSize: true,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.topLeft,
                      height: MediaQuery.of(context).size.height - 100,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bryce Kaddouri",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Full Stack Developer, I create things for the web",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ButtonApp(
                                text: "LinkedIn",
                                onPressed: () {},
                              ),
                              ButtonApp(
                                borderColor: AppConstant.APP_BORDER_COLOR,
                                bgColor: Colors.transparent,
                                text: "Github",
                                textColor: AppConstant.APP_TEXT_COLOR,
                                onPressed: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // end header section

            // start projects section
            SizedBox(
              height: 100,
            ),
            Container(
              height: 100,
              color: ResponsiveBreakpoints.of(context).equals('mobile')
                  ? Colors.red
                  : ResponsiveBreakpoints.of(context).equals('portraitTablet')
                      ? Colors.green
                      : ResponsiveBreakpoints.of(context).equals('landscapeTablet')
                          ? Colors.blue
                          : ResponsiveBreakpoints.of(context).equals('desktop')
                              ? Colors.yellow
                              : Colors.purple,
            ),


            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Text(
                    "Projects",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // grid view (max item size 300)
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: ResponsiveBreakpoints.of(context).equals('mobile')
                          ? 1
                          : ResponsiveBreakpoints.of(context).equals('portraitTablet') || ResponsiveBreakpoints.of(context).equals('landscapeTablet')
                              ? 2
                              : 3,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio:
                      MediaQuery.of(context).size.width > 350 && MediaQuery.of(context).size.width < 650 ? 1.5 : 1.1
                      ,
                    ),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return CardApp(
                        title: "Project ${index + 1}",
                        imgURL: "",
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
