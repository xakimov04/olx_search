import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx/data/list_data.dart';
import 'package:olx/widgets/card_widget.dart';

class PlitkaPage extends StatelessWidget {
  const PlitkaPage({super.key});

  @override
  Widget build(BuildContext context) {
    Data data_list = Data();
    return GridView.builder(
      padding: const EdgeInsets.only(left: 10, right: 10),
      itemCount: data_list.data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 4 / 11.2, mainAxisSpacing: 5),
      itemBuilder: (context, index) {
        final item = data_list.data[index];
        return Expanded(
          child: GaleriyaCardWidget(
            image: item["images"],
            text: item["text"],
            price: item["price"],
            location: item["location"],
          ),
        );
      },
    );
  }
}
