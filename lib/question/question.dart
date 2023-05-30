import 'package:flutter/material.dart';
const List<Widget> Level = [
  Text('ระดับ1',style:TextStyle(fontSize: 30)),
  Text('ระดับ2',style:TextStyle(fontSize: 30,)),
  Text('ระดับ3',style:TextStyle(fontSize: 30)),
  Text('ระดับ4',style:TextStyle(fontSize: 30))
];

class question extends StatefulWidget {
  const question({super.key});

  @override
  State<question> createState() => _questionState();
}

class _questionState extends State<question> {
  final List<bool> _selectedLevel = [true, false, false,false];
  final _controller = PageController();
  void jump() {
    setState(() {
      _controller.animateToPage(1,
          duration: Duration(milliseconds: 400), curve: Curves.ease);
    });
  }

  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/question.png"),
                  fit: BoxFit.cover),
            ),
          ),
          PageView(
            physics: isLastPage ? null : NeverScrollableScrollPhysics(),
            controller: _controller,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 1);
            },
            children: [
              Align(
                alignment: Alignment(0, 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
                  // alignment: Alignment(0,1),
                  // color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          textAlign: TextAlign.center,
                          "คุณกำลังรู้สึกกังวลหรือไม่?",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //open HomePage
                              },
                              child: Icon(
                                Icons.close,
                                size: 50,
                              ),
                            ),
                            GestureDetector(
                                onTap: () => jump(),
                                child: Icon(Icons.done, size: 50))
                          ]),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                  height: 400,
                  width: 350,
                ),
              ),
              Align(
                alignment: Alignment(0, 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
                  // alignment: Alignment(0,1),
                  // color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 100,
                        width: 280,
                        child: Text(
                          textAlign: TextAlign.center,
                          "คุณคิดว่าความกังวลของคุณอยู่ระดับไหน?",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      ToggleButtons(
                        direction: Axis.vertical,
                        onPressed: (int index) {
                          setState(() {
                            // The button that is tapped is set to true, and the others to false.
                            for (int i = 0; i < 4; i++) {
                              _selectedLevel[i] = i == index;
                            }
                          });
                        },
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        selectedBorderColor: Color(0xFF2980B9),
                        selectedColor: Colors.white,
                        fillColor: Color(0xFFa8c0ff),
                        color: Color(0xFF005AA7),
                        constraints: const BoxConstraints(
                          minHeight: 60.0,
                          minWidth: 160.0,
                        ),
                        isSelected: _selectedLevel,
                        children: Level,
                      ),
                    ],
                  ),
                  height: 400,
                  width: 350,
                ),
              )
            ],
          ),
          AnimatedPositioned(
            right: isLastPage ? 20 : -40,
            bottom: 30,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: GestureDetector(
                onTap: () {
                  //click to the home page
                },
                child: Icon(Icons.arrow_forward_ios, size: 50)),
          ),
        ],
      ),
    );
  }
}
