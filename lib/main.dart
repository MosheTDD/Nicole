import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Nicole());
}

class Nicole extends StatelessWidget {
  const Nicole({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.rubikTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<AssetImage> beautifulImages = const [
    AssetImage("assets/beautiful/img1.jpeg"),
    AssetImage("assets/beautiful/img2.jpeg"),
    AssetImage("assets/beautiful/img3.jpeg"),
    AssetImage("assets/beautiful/img4.jpeg"),
    AssetImage("assets/beautiful/img5.jpeg"),
  ];

  List<AssetImage> cuteImages = const [
    AssetImage("assets/cute/img1.jpeg"),
    AssetImage("assets/cute/img2.jpeg"),
    AssetImage("assets/cute/img3.jpeg"),
    AssetImage("assets/cute/img4.jpeg"),
    AssetImage("assets/cute/img5.jpeg"),
  ];

  List<AssetImage> funImages = const [
    AssetImage("assets/fun/img1.jpeg"),
    AssetImage("assets/fun/img2.jpeg"),
    AssetImage("assets/fun/img3.jpeg"),
    AssetImage("assets/fun/img4.jpeg"),
    AssetImage("assets/fun/img5.jpeg"),
  ];

  List<AssetImage> perfectImages = const [
    AssetImage("assets/perfect/img1.jpeg"),
    AssetImage("assets/perfect/img2.jpeg"),
    AssetImage("assets/perfect/img3.jpeg"),
    AssetImage("assets/perfect/img4.jpeg"),
    AssetImage("assets/perfect/img5.jpeg"),
  ];

  List<AssetImage> usImages = const [
    AssetImage("assets/us/img1.jpeg"),
    AssetImage("assets/us/img2.jpeg"),
    AssetImage("assets/us/img3.jpeg"),
    AssetImage("assets/us/img4.jpeg"),
    AssetImage("assets/us/img5.jpeg"),
    AssetImage("assets/us/img6.jpeg"),
    AssetImage("assets/us/img7.jpeg"),
  ];

  late final AnimationController heartUnfilledController = AnimationController(
    duration: const Duration(seconds: 1),
    value: 1,
    vsync: this,
  );
  late final AnimationController heartFillController = AnimationController(
    duration: const Duration(seconds: 1),
    value: 0,
    vsync: this,
  );
  double textOpacity = 1;
  double secondScreenOpacity = 0;
  ValueNotifier<Color> containerColor =
      ValueNotifier(const Color.fromARGB(255, 250, 185, 114));
  ValueNotifier<bool> secondScreenVisibility = ValueNotifier(false);

  void showCustomBottomSheet(List<AssetImage> images, String wrapTitle) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: Color.fromARGB(255, 250, 110, 100),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      wrapTitle,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor * 30,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 253, 170, 170),
                      ),
                    )),
              ),
              Expanded(
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    for (AssetImage image in images)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.45,
                            child: Image(
                              image: image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showAboutBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: Color.fromARGB(255, 250, 110, 100),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "נ י ק ו ל י",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaleFactor * 35,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 253, 170, 170),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "ניקולי שלי,\nהאדם הכי חשוב לי,\nגם כשקשה את איתי ואני איתך,\nגם אם אנחנו לא מוצאים את כל החתיכות של הפזל,\nאנחנו נחפש מתחת למיטה עד שנמצא ונוכל ביחד לראות את התמונה המלאה.\n\nאני כל כך אוהב אותך,\nאת העיניים שלך,\nהשפתיים שלך,\nהקול שלך,\nהגוף שלך,\nאת החיוך שלך,\nאני אוהב את כולך,\nגם כל מה שאת חושבת שאני לא אוהב.\n\nאני רוצה לטייל איתך,\nלראות איתך טלוויזיה ולצחוק על האנשים שהולכים לתוכניות ריאליטי,\nאני רוצה ללכת איתך לבית קפה, לשתות הפוך עם שתיים סוכר ואת עם כפית אחת ולפעמים גם מעט.\n\nאז ניקולי שלי,\nאני אוהב אותך,\nרוצה לחבק אותך,\nולנשק אותך,\n\nלניקולי שלי",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor * 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    textOpacity = 1;
    containerColor = ValueNotifier(const Color.fromARGB(255, 250, 185, 114));
    secondScreenOpacity = 0;
    secondScreenVisibility.value = false;
  }

  @override
  void dispose() {
    super.dispose();
    heartUnfilledController.dispose();
    heartFillController.dispose();
    secondScreenVisibility.dispose();
    containerColor.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 250, 185, 114),
        body: Center(
          child: Stack(
            children: [
              ValueListenableBuilder(
                valueListenable: containerColor,
                builder: (context, value, child) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    color: value,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            ScaleTransition(
                              scale: CurvedAnimation(
                                parent: heartUnfilledController,
                                curve: Curves.easeOut,
                              ),
                              child: GestureDetector(
                                onTap: () async {
                                  heartUnfilledController.reverse(from: 1);
                                  setState(() {
                                    textOpacity = 0;
                                  });
                                  await Future.delayed(
                                          const Duration(seconds: 1))
                                      .then((value) {
                                    heartFillController.forward(from: 1);
                                    setState(() {
                                      secondScreenVisibility.value = true;
                                    });
                                  });
                                  Future.delayed(
                                          const Duration(milliseconds: 1500))
                                      .then((value) {
                                    containerColor.value = const Color.fromARGB(
                                        255, 250, 110, 100);
                                    setState(() {
                                      secondScreenOpacity = 1;
                                    });
                                  });
                                },
                                child: const Icon(
                                  CupertinoIcons.heart,
                                  size: 124,
                                  color: Color.fromARGB(255, 250, 110, 100),
                                ),
                              ),
                            ),
                            ScaleTransition(
                              scale: CurvedAnimation(
                                  parent: heartFillController,
                                  curve: Curves.easeOut,
                                  reverseCurve: Curves.easeOut),
                              child: const Icon(
                                CupertinoIcons.heart_fill,
                                size: 124,
                                color: Color.fromARGB(255, 250, 110, 100),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: MediaQuery.of(context).size.height * 0.35,
                          child: AnimatedOpacity(
                            duration: const Duration(seconds: 1),
                            opacity: textOpacity,
                            child: Text(
                              "Press the heart",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 25,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 250, 110, 100),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: secondScreenVisibility,
                builder: (context, value, child) {
                  return Visibility(
                    visible: value,
                    child: AnimatedOpacity(
                      duration: const Duration(seconds: 1),
                      opacity: secondScreenOpacity,
                      child: Stack(
                        fit: StackFit.loose,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.07),
                              child: Text(
                                "PRESS THE BUTTONS",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          25,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 253, 170, 170),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.2,
                            right: MediaQuery.of(context).size.width * 0.1,
                            child: GestureDetector(
                              onTap: () {
                                showCustomBottomSheet(
                                    perfectImages, "P E R F E C T");
                              },
                              child: const CustomButton(
                                title: "P E R F E C T",
                              ),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.65,
                            right: MediaQuery.of(context).size.width * 0.35,
                            child: GestureDetector(
                              onTap: () {
                                showCustomBottomSheet(
                                    beautifulImages, "B E A U T I F U L");
                              },
                              child: const CustomButton(
                                title: "B E A U T I F U L",
                              ),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.3,
                            right: MediaQuery.of(context).size.width * 0.7,
                            child: GestureDetector(
                              onTap: () {
                                showCustomBottomSheet(cuteImages, "C U T E");
                              },
                              child: const CustomButton(
                                title: "C U T E",
                              ),
                            ),
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                showCustomBottomSheet(usImages, "U S");
                              },
                              child: const CustomButton(
                                title: "U S",
                              ),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.55,
                            right: MediaQuery.of(context).size.width * 0.1,
                            child: GestureDetector(
                              onTap: () {
                                showCustomBottomSheet(funImages, "F U N");
                              },
                              child: const CustomButton(
                                title: "F U N",
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 40),
                                child: GestureDetector(
                                  onTap: () => showAboutBottomSheet(),
                                  child: Text(
                                    "נ י ק ו ל י",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context)
                                              .textScaleFactor *
                                          25,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                          255, 253, 170, 170),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: title == "U S" ? 130 : title.length * 15,
      height: title == "U S" ? 130 : 80,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 250, 110, 100),
        borderRadius: BorderRadius.circular(title == "U S" ? 50 : 25),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 254, 151, 143),
            offset: Offset(-4, -4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Color.fromARGB(255, 220, 74, 64),
            offset: Offset(4, 4),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
        child: title != "U S"
            ? FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 253, 170, 170),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.heart_circle,
                    size: 80,
                    color: Color.fromARGB(255, 253, 170, 170),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 253, 170, 170),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
