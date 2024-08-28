import 'package:f_hive_and_http/01_hive/00_HiveScreen.dart';
import 'package:f_hive_and_http/02_http/00_NetworkScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


/*
* hive
* hive는 flutter와 dart에서 사용할 수 있는 경량의 nosql 데이터베이스이다.
* 주로 로컬에 데이터를 저장하는 데 사용되며, 모바일 및 애플리케이션에서 빠르고 효율적인 데이터 저장 및
* 검색 기능을 제공한다. hive의 구조는 간단하고, 사용이 용이하며, 성능이 뛰어나기 때문에 많은 flutter
* 개발자들 사이에서 인기가 높다.
*
* 주요 특징
* 1. 경량 및 빠른 성능
*   hive는 메모리 내에서 작동하므로 데이터의 읽기 및 쓰기 속도가 매우 빠르다.
*   데이터베이스의 크기가 커져도 성능 저하가 적다는 특징이 있다.
*
* 2. NoSql 데이터베이스 :
*   hive는 스키마가 없는 NoSql 데이터베이스로, 다양한 형태의 데이터를 자유롭게 저장할 수 있다.
*   json과 같은 복잡한 데이터 구조도 쉽게 처리할 수 있다.
*
* 3. 간편한 사용
*   플러터는 애플리케이션에 쉽게 통합할 수 있으며, 직관적인 api를 제공한다.
*   데이터 저장, 조회, 삭제 등의 작업을 간단하게 수행할 수 있다.
*
* 4. 비동기 지원
*   hive는 비동기 작업을 지원하며 ui 스레드와 충돌 없이 데이터를 읽고 쓸 수 있다.
*   이는 사용자의 경험을 향상시키는데 도움이 된다.
*
* 5. 데이터 암호화
*   hive는 데이터를 안전하게 보호화기 위한 암호화 기능을 제공한다.
*   개인 정보다 민감한 데이터를 저장할 때 유용하다. (그러나 저장하지 않아야함.)
*
* */
void main() async {
  /*
  * flutter 바인딩 초기화
  * flutter 프레임워크와 상호작용하기 위해 필요한 바인딩을 초기화 한다.
  *
  * 애플리케이션의 초기화 과정에서 필수적인 호출로 애플리케이션이 비동기 작업을 수행하고,
  * 다양한 flutter 기능과 플러그인을 정상적으로 사용할 수 있도록 환경을 설정하기 위함.
  *
  * 주요 기능
  * flutter 프레임워크와 통신 준비 : flutter ui와 애플리케이션의 다른 부분간의 연결을 설정한다.
  * 비동기 작업 수행 : 애플리케이션의 초기화 과정에서 비동기 작업을 수행할 때 , flutter의 위젯 트리와 이벤트 루프가 준비되어 있어야한다.
  * 플러그인 사용 : flutter에서 제공하는 많은 플러그인은 flutter의 바인딩이 초기화된 후에만 제대로 동작하게 된다.
  * 위젯 트리의 상태 관리 : flutter 애플리케이션 구조에서 위젯 트리와 상태 관리가 잘 작동하기 위해서는 초기화가 필수 적이다.
  * */
  WidgetsFlutterBinding.ensureInitialized();

  final directory = await getApplicationDocumentsDirectory();

  Hive.init(directory.path);

  runApp(RootScreen());
}

class RootScreen extends StatefulWidget{
  RootScreen({super.key});

  @override
  RootState createState() => RootState();
}


class RootState extends State<RootScreen>{

  int _currentPage = 0;

  void _onPageTapped(int index){
    setState(() {
      _currentPage = index;
    });
  }

  final List<Widget> _pages = [
    HiveScreen(),
    NetworkScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "hive app",
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("hive and http"))),
        body: _pages[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.save), label: "hive"),
            BottomNavigationBarItem(icon: Icon(Icons.network_wifi), label: "netWork"),
          ],
          currentIndex: _currentPage,
          onTap: _onPageTapped,
        ),
      ),
    );
  }
}


