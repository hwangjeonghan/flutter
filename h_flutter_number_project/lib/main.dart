import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:h_flutter_example_project/controllers/NumberViewModel.dart';
import 'package:h_flutter_example_project/controllers/FavoriteViewModel.dart';
import 'package:h_flutter_example_project/models/NumberItem.dart';
import 'package:h_flutter_example_project/models/FavoriteItem.dart';
import 'package:h_flutter_example_project/services/CoffeeService.dart';
import 'package:h_flutter_example_project/services/FavoriteService.dart';
import 'package:h_flutter_example_project/themes/NumberTheme.dart';
import 'package:h_flutter_example_project/widgets/Layout.dart';
import 'package:h_flutter_example_project/widgets/ThemeProviderWidget.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

/*
* 임포트 lib 목록
* $flutter pub add hive           : 경량 nosql
* $flutter pub add http           : api 요청
* $flutter pub add provider       : 상태 관리
* $flutter pub add path_provider  : 어플리케이션의 경로를 취득하기 위함.
* $flutter pub add camera         : 카메라 모듈
* $flutter pub add build_runner   : 클래스의 반복적인 부분을 하나의 코드로 변환함
* $flutter pub add hive_generator : hive에 model을 저장할 때 직렬화를 위해서 사용됨
* */
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(NumberItemAdapter());
  Hive.registerAdapter(FavoriteItemAdapter());

  // box 열기
  await Hive.openBox<FavoriteItem>("favoriteBox");

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => NumberViewModel(NumberService()),
      ),
      ChangeNotifierProvider(
        create: (context) => FavoriteViewModel(FavoriteService()),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(), // Add ThemeProvider here
      ),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 화면의 가장 자리까지 공간을 차지하겠다
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "my number",
          theme: Numbertheme.lightTheme,
          darkTheme: Numbertheme.darkTheme,
          themeMode: themeProvider.themeMode,
          // Apply theme mode here
          initialRoute: "/",
          routes: {
            "/": (context) => Layout()
          },
        );
      },
    );
  }
}