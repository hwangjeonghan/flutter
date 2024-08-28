
import 'package:d_stateful_widget/01_state_widget/01_ElevatedBtnWidget.dart';
import 'package:d_stateful_widget/01_state_widget/02_TextBtnWidget.dart';
import 'package:d_stateful_widget/01_state_widget/03_ButtonWidget.dart';
import 'package:d_stateful_widget/01_state_widget/04_CheckboxWidget.dart';
import 'package:d_stateful_widget/01_state_widget/05_SwitchWidget.dart';
import 'package:d_stateful_widget/01_state_widget/06_SliderWidget.dart';
import 'package:d_stateful_widget/01_state_widget/07_TextFieldWidget.dart';
import 'package:d_stateful_widget/01_state_widget/08_ProgressIndicatorWidget.dart';
import 'package:d_stateful_widget/01_state_widget/09_TextFormFieldWdiget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
* Statefulwidget
* flutter에서 상태를 가지는 위젯을 정의하는데 사용되는 클래스이다.
* 이 위젯은 내부 상태가 변경될 수 잇으며, 상태의 따라 ui가 동적으로 업데이트 된다.
*
* 특징
* 1. 상태 변화 가능 : StatefulWidget은 사용자 입력, 애니메이션, 네트워크 요청 등으로 인해
*                   상태가 변결될 수 있으며 상태가 변경될 때마다. build 메서드가 호출되어 ui를 업데이트 한다.
* 2. 상태 관리 : StatefulWidget은 두 부분으로 나뉘게 되는데 하나는 위젯 자체를 정의하는 StatefulWidget 클래스이고
*             다른 하나는 ui의 상태를 관리하는 State 클래스이다. 두 클래스는 연결되어 있으며 State 클래스에서 상태를 관리한다.
* 3. build 메서드 : State 클래스에서 build 메서드를 오버라이드하여 ui를 정의하고 이 메서드는 상태가 변경될 때 마다 호출되어
*                 ui를 렌더링하게 된다.
*
* 생명주기 메소드
* 1. createState() : statefulWidget이 생성될 때 호출된다. 이 메소드는 State 객체를 생성하여 반환한다.
* 2. initState : 상태가 생성된 후 가장 먼저 호출된다. 초기화 작업을 수행할 수 있는 곳이다.
*               이 메소드는 위젯이 트리에서 처음 생성될 때 한 번만 호출된다.
* 3. didChandgeDependencies : initState 다음에 호출되며, 위젯의 의존성이 변경될 때마다 호출된다.
*                      주로 inheritedWidget에 의존하는 경우 해당 위젯이 변경될 때 필요한 작업을 할 수 있다.
* 4. build : 위젯이 화면에 그려질 때 호출된다. ui를 구성하는 코드가 이곳에 위치하며 상태가 변경되면 이 메소드가 다시 호출되어 ui를 갱신한다.
* 5. didUpdateWidget : 부모 위젯이 재구성될 때 호출되며, 이전 위젯과 새로운 위젯을 비교하여 필요한 작업을 수행할 수 있다.
*               이 메소드는 상태가 변경되지 않고, 위젯의 속성이 변경되는 경우에 유용하다.
* 6. setState() : 상태를 변경하고 ui를 업데이트 하기 위해 호출된다. 이 메소드를 호출하여 build 메소드가 다시 호출된다.
* 7. deactivate : 위젯이 위젯 트리에서 제거될 때 호출된다. 이 메소드는 비활성화되는 위젯에 대한 정리 작업을 수행할 수 있다.
* 8. dispose () : 위젯이 완전히 제거될 때 호출된다. 리소스 해제, 애니메이션 컨트롤러 종료 등의 정리 작업을 수행하는데 사용된다.
*
* 생명주기 요약
* StatefulWidget의 생명주기는 위젯이 생성되고, 변경되고, 제거되는 과정을 관리한다. 이를 통해 개발자는 상태 변화를 효율적으로 처리하고,
* 사용자에게 일관된 경험을 제공할 수 있다. 생명주기 메소드를 적절히 활용하여 성능과 사용자 경험을 제공할 수 있다.
*
* 0. setState // 기본
* 1. provider  //
* 2. Bloc     //
* 3. Riverpod
* */
class InteractionWidget extends StatefulWidget{
  const InteractionWidget({super.key});

  @override
  _InteractionWidgetState createState() => _InteractionWidgetState();
}

/*
* State
* StatefulWidget과 함께 사용되는 클래스이다.
* 이 클래스는 위젯 상태를 관리하고, 상태가 변경될 때 ui를 업데이트 하는 역할을 한다.
* adbstract class State<T extends StatefulWidget> {
*
* }
*
* 주요 역할
* 1. 상태 저장 : state 클래스는 위젯의 상태를 저장하는 역할을 한다. 상태 변수는 ui의 현재 상태를 나타낸다.
* 2. ui 업데이트 : 상태가 변경되면 setState() 메서드를 호출하여 flutter에게 상태가 변경되었음을 알리며, ui를 다시 그린다.
* */

class _InteractionWidgetState extends State<InteractionWidget>{
  int _count = 0;

  _InteractionWidgetState();

  void _incrementCounter(){
    setState(() {
      _count++;
    });
  }

  void _decrementCounter(){
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("현재 카운트 : $_count"),
        ElevatedBtnWidget(count: _count,onPressed: _decrementCounter),
        TextBtnWidget(_incrementCounter,_count),
        const ButtonCombination(),
        CheckboxWidget(),
        SwitchWidget(),
        SliderWidget(),
        TextFieldWidget(),
        ProgressIndicatorWidget(),
        SingleChildScrollViewWidget()
      ],
    );
  }
}













