import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h_flutter_example_project/models/NumberItem.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class NumberDetailScreen extends StatelessWidget{
  NumberItem? numberItem;

  NumberDetailScreen({required this.numberItem, super.key});

  @override
  Widget build(BuildContext context) {
    Widget widget;
    if(numberItem!.image == null || numberItem!.image!.isEmpty){
      widget = Container(
        width: double.infinity,
        height: 500,
        color: Colors.grey,
        child: const Center(child: Text("이미지가 없습니다.")),
      );
    }else{
      bool isFile = numberItem!.image.toString().startsWith("file://") || File(numberItem!.image.toString()).existsSync();
      widget = isFile
          ? FutureBuilder<File>(
            future: File(numberItem!.image.toString()).existsSync() ? Future.value(File(numberItem!.image.toString())) : null,
            builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('이미지 로드 실패'));
              } else if (snapshot.hasData) {
                return Image.file(snapshot.data!, fit: BoxFit.fill,);
              } else {
                return const Center(child: Text('파일 없음'));
              }
            },
      ): Image.network(
        numberItem!.image.toString(),
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        },
      );
    }

    final uri = Uri.parse("tel:+82${numberItem!.phoneNumber}");
    return Scaffold(
      appBar: AppBar(title: Text(numberItem!.title.toString())),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 500,
            child: widget,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text("전화번호 : ${numberItem!.phoneNumber}"),
              IconButton(onPressed: () async{
                var status = await Permission.phone.request();
                if(status.isGranted){
                  if(await canLaunchUrl(uri)){
                    await launchUrl(uri);
                  }else{
                    print("전화걸기 실패");
                  }
                }else{
                  print("권한을 승인해주세요");
                }
              }, icon: Icon(Icons.call))
            ],
          ),

          Text("설명 : ${numberItem!.description}")
        ],
      ),
    );
  }
}