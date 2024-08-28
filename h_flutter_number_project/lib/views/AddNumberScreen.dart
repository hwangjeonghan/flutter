import 'package:flutter/material.dart';
import 'package:h_flutter_example_project/controllers/NumberViewModel.dart';
import 'package:h_flutter_example_project/widgets/CameraWidget.dart';
import 'package:h_flutter_example_project/widgets/FormWidget.dart';
import 'package:provider/provider.dart';
// flutter pub add camera

class AddNumberScreen extends StatelessWidget {
  final _numberForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NumberViewModel>(context);

    return ListView(
      children: [
        Form(
            key: _numberForm,
            child: Center(
                child: Column(
                  children: [
                    CameraWidget(imagePath: viewModel.numberItem?.image,
                        setMethod: viewModel.setImage),
                    FormWidget(value: viewModel.numberItem?.title ?? "",
                        setValue: viewModel.setTitle),
                    FormWidget(value: viewModel.numberItem?.phoneNumber ?? "",
                        setValue: viewModel.setPhoneNumber),
                    FormWidget(value: viewModel.numberItem?.description ?? "",
                        setValue: viewModel.setDescription),
                    ElevatedButton(onPressed: () {
                      viewModel.saveForm(_numberForm, context);
                    }, child: const Text("저장"))
                  ],
                )
            )
        )
      ],
    );
  }
}
