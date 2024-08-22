# flutter_intro
> flutter의 개요와 기본 구조의 대하여 학습을 한다.

```
my_flutter_app/
│
├── android/
├── build/
├── ios/
├── lib/
│   └── main.dart
├── test/
├── .gitignore
├── .metadata
├── pubspec.yaml
├── README.md
└── <기타 파일들>
```
## 구조 살펴보기
1. android : 안드로이드 플랫폼 관련 파일들이 위치하는 디렉토리로 네이티브 코드를 작성하거나 설정을 수정할 때 사용한다.
2. build : 빌드된 파일들이 저장되는 디렉토리로 해당 디렉토리는 자동으로 생성되며, 보통 신경 쓸 필요가 없다.
3. ios : IOS 플랫폼 관련 파일들이 위치하는 디렉토리로 ios 네이티브 코드를 작성하거나 설정을 수정할 때 사용한다.
4. lib : dart 코드를 작성하는 주요 디렉토리로 main.dart 파일이 이쪽에 위치를하게 된다.
        - 애플리케이션의 진입점(Entry Point)가 된다.
5. test : 테스트 코드를 작성하는 디렉토리로 유닛 테스트, 위젯 테스트 등을 작성할 때 사용한다.
6. .metadata : 프로젝트의 메타데이터를 저장하는 파일이다. 직접 수정하는 일은 거의 없다.
7. pubspec.yaml : flutter 프로젝트의 설정 파일로 프로젝트의 의존성(dependencies), 자산(assets), 패키지 정보 등을 설정한다.

## 실행하기 (VSCode)
1. Flutter SDK : 설치하기 https://docs.flutter.dev/get-started/install
2. VSCode : 확장 툴에서 flutter install (install시 dart도 함께 다운된다.) 
3. android studio : 에뮬레이터를 설치한다.
4. F1 : 에뮬레이터 실행
5. TERMINAL : 
```
$flutter run
// 실행 디바이스 선택 목록에서 디바이스 선택
``` 