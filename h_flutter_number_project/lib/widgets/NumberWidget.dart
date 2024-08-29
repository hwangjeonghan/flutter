import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h_flutter_example_project/controllers/NumberViewModel.dart';
import 'package:h_flutter_example_project/controllers/FavoriteViewModel.dart';
import 'package:h_flutter_example_project/models/NumberItem.dart';
import 'package:h_flutter_example_project/widgets/ImageWidget.dart';
import 'package:provider/provider.dart';

class NumberWidget extends StatelessWidget {
  final NumberItem numberItem;
  final int index;

  const NumberWidget({required this.numberItem, required this.index});

  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = Provider.of<FavoriteViewModel>(context);
    final numberViewModel = Provider.of<NumberViewModel>(context);

    bool isTrue = favoriteViewModel!.isFavorite(index);

    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white10,
          border: Border.all(color: Colors.black, width: 2.0)),
      child: ElevatedButton(
        onPressed: () => numberViewModel.detailsNumberItem(context, index),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start, // Row 간의 기본 간격 조절
            children: [
              Text("$index"),
              const SizedBox(width: 10), // 첫 번째 간격
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2.0), // 2px 보더
                ),
                child: ClipOval(
                  child: SizedBox(
                    width: 70, // 이미지의 너비 조정
                    height: 70, // 이미지의 높이 조정
                    child: ImageWidget(image: numberItem!.image.toString()),
                  ),
                ),
              ),
              const SizedBox(width: 15), // 두 번째 간격
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("제목 : ${numberItem!.title}"),
                    Text("전화번호 : ${numberItem!.phoneNumber}"),
                    Text(
                      "내용 : ${numberItem!.description}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10), // 세 번째 간격
              SizedBox(
                width: 50,
                height: 50,
                child: IconButton(
                  onPressed: () {
                    favoriteViewModel.toggleFavorite(index);
                  },
                  icon: Icon(
                    isTrue ? Icons.star : Icons.star_border,
                    color: isTrue ? Colors.blue : Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 10), // 네 번째 간격
              SizedBox(
                width: 50,
                height: 50,
                child: IconButton(
                  onPressed: () {
                    numberViewModel.deleteItem(context, index - 1);
                  },
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
