import 'package:c_stateless_widget/01_basic_widget/01_TextWidget.dart';
import 'package:c_stateless_widget/01_basic_widget/02_IconWidget.dart';
import 'package:c_stateless_widget/01_basic_widget/03_ImageWidget.dart';
import 'package:c_stateless_widget/01_basic_widget/04_PlaceholderWidget.dart';
import 'package:c_stateless_widget/01_basic_widget/05_TooltipWidget.dart';
import 'package:c_stateless_widget/01_basic_widget/06_ShowDialogWidget.dart';
import 'package:c_stateless_widget/01_basic_widget/07_SnackBarWidget.dart';
import 'package:flutter/cupertino.dart';

/*
* StatelessWidget
* flutter에서 상태가 변하지 않는 ui를 만들 때 사용하는 기본 위젯이다.
* 이 위젯은 생성된 후에 내부 상태를 변경하지 않으며, 주로 고정된 데이터나 불변의 ui를 표시하는데 사용된다.
*
* 주요 특징
* 1. 불변성 : StatelessWidget은 한번 생성되면 상태를 변경할 수 없다. 즉, 위젯이 다시 빌드되어도 상태가 유지되지 않는다.
* 2. 간단한 구조 : 상태를 관리할 필요가 없기 때문에 구조가 간단하여 UI를 정의하는데 집중할 수 있다.
* 3. 상위 위젯에서 전달 : 필요한 데이터나 상태는 상위 위젯에서 전달받아서 사용될 수 있다.
* */

class Combination extends StatelessWidget{
  const Combination({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            TextWidget(),
            IconWidget(),
            ImageWidget(),
            PlaceholderWidget(),
            TooltipWidget(),
            ShowDialogWidget(),
            SnackBarWidget()
          ],
        )
      ],
    );
  }
}