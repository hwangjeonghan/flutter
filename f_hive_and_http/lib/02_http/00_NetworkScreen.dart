import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkScreen extends StatefulWidget {

  @override
  _NetworkState createState() => _NetworkState();
}

class _NetworkState extends State<NetworkScreen> {
  final String url = "https://api.agify.io?name=";
  String? name = "";
  String inference = "";

  Future<void> inputName(String? input) async {
    setState(() {
      name = input;
    });

    if (name!.isNotEmpty) {
      try {
        final reponse = await http.get(Uri.parse("$url$name"));

        if (reponse.statusCode == 200) {
          final data = json.decode(reponse.body);
          //{"key" : "value"}
          setState(() {
            inference = "${data["age"]}";
          });
        } else {
          _handleError();
        }
      } catch (e) {
        _handleError();
      }
    }
  }

  void _handleError() {
    setState(() {
      inference = "네트워크 요청 실패";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        inference.isNotEmpty
            ? ItemWidget(inference: inference)
            : SizedBox.shrink(),
        const SizedBox(height: 40),
        FormWidget(onSave: inputName)
      ],
    );
  }
}

class ItemWidget extends StatelessWidget {
  final String inference;

  ItemWidget({required this.inference});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.0)
      ),
      child: Center(
        child: Text(
          "당신의 추정 나이는 : $inference",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class FormWidget extends StatelessWidget {

  final Function(String?)? onSave;
  final _formKey = GlobalKey<FormState>();

  FormWidget({required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "이름을 입력하세요"),
              validator: (value){
                // null인지 체크
                if(value == null || value.isEmpty){
                  return "이름을 입력해주세요";
                }

                final RegExp englishRegExp = RegExp(r'^[a-zA-Z]+$');
                if(!englishRegExp.hasMatch(value)){
                  return "영어만 입력이 가능합니다.";
                }

                return null;
              },
              onSaved: onSave,
            ),

            ElevatedButton(onPressed: (){
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
              }
            }, child: const Text("요청하기"))
          ],
        )
    );
  }
}