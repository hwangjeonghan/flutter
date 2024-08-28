import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h_flutter_example_project/controllers/NumberViewModel.dart';
import 'package:h_flutter_example_project/models/NumberItem.dart';
import 'package:h_flutter_example_project/widgets/NumberWidget.dart';
import 'package:provider/provider.dart';

class Rootscreen extends StatelessWidget {
  const Rootscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NumberViewModel>(builder: (context, viewModel, child) {
      return Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: viewModel.numberItems.length,
            itemBuilder: (context, index) {
              final coffeeItem = viewModel.numberItems[index];
              return NumberWidget(numberItem: coffeeItem, index: index + 1);
            }),
      );
    });
  }
}
