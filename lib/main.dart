import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   MyApp({Key? key}) : super(key: key);
//   int counter = 0;
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Hot',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(),
//         body: Center(
//             child:
//                 Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           const Text('You have pushed the button this many times :'),
//           Text('$counter', style: Theme.of(context).textTheme.displayMedium),
//         ])),
//         floatingActionButton: FloatingActionButton(
//           child: const Icon(Icons.add),
//           onPressed: () {
//             counter++;
//             debugPrint("$counter");
//           },
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // @override
  // State<MyApp> createState() => _MyAppState(); // mutable

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// state 클래스 <MyApp> : generic 타입
class _MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('You have pushed the button this many times :'),
          Text('$counter', style: Theme.of(context).textTheme.displayMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: const Text(
                  '+',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    counter--;
                  });
                },
                child: const Text(
                  '-',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ])),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              counter++;
              debugPrint("$counter");
            });
            // counter++;
            // debugPrint("$counter");
          },
        ),
      ),
    );
  }
}

// 매운맛

// state
// UI 가 변경되도록 영향을 미치는 데이터
// app 수준과 widget 수준의 데이터
// stateless widget : state가 변하지 않는 위젯
// widget tree - Element tree - Render tree
// widget tree : 하나의 설계도
// Element tree : widget tree, Render tree 연결
// widget tree 안의 하나하나의 widget 들이 하나하나의 widget element로 연결 (1:1 대응)
// Render tree : high level 시스템
// Element tree 의 하나하나의 element들을 하나하나의 Render object와 연결 (1:1대응)
// container widget <- 포인트 <- Container element

// reload vs rebuild
// 타이어 바꿀꺼냐 차바꿀꺼냐

// 위치나 타입 속성 등이 일치할 때에 한해서 reload
// 바뀐 부분만 render tree에서 다시 그려줌

// container widget(white->black) -> Hot reload -> build method -> widget tree rebuild -> element tree link update -> elemenet tree info -> render tree -> Render object re-rendering

// stateless 위젯은 rebuild만을 통해서 새로운 state 적용가능
// flutter 초당 60프레임

// 상속
// extend
// 자식 - 중간 -부모
// 부모 생성자 최상위

// stateful widget 은 내부에 또다른 state 클래스를 가짐
// stateful widget (state)- build method - Render UI
// stateful widget - build method - Render UI

//state
// child 위젯의 생성자를 통해서 데이터가 전달될떄
// internal state 가 바뀔떄


// createState() 필요

// state 를 바꾸려면 Buildmethod를 호출해서 rebuild 하는 방법밖에는 없다.
// setstate() 필요 : 매개변수 호출, Buildmethod를 호출
// setstate 보여준 위젯들을 dirty라고 한다. 예) 숫자가 변하는것을 보여주는 text 위젯
// state object 에서 변화를 감지해서 변화된 stateful widget tree를 가르키고 이것을 stateful element에 알려줌
// stateful element는 단순히 새로운 stateful widget tree만을 link함
// 
