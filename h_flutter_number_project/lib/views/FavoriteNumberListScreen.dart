
import 'package:flutter/cupertino.dart';
import 'package:h_flutter_example_project/controllers/NumberViewModel.dart';
import 'package:h_flutter_example_project/controllers/FavoriteViewModel.dart';
import 'package:h_flutter_example_project/models/NumberItem.dart';
import 'package:h_flutter_example_project/widgets/NumberWidget.dart';
import 'package:provider/provider.dart';

class FavoriteNumberListScreen extends StatelessWidget{

  FavoriteNumberListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = Provider.of<FavoriteViewModel>(context);
    final numberViewModel = Provider.of<NumberViewModel>(context);

    List<int> favoriteIndices = favoriteViewModel.getFavoriteIndices();
    List<NumberItem> favoriteItems = favoriteIndices.map((index) => numberViewModel.numberItems[index-1]).toList();

    return ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index){
          final favoriteNumber = favoriteItems[index];
          return NumberWidget(numberItem: favoriteNumber, index: favoriteIndices[index]);
        }
    );

  }
}