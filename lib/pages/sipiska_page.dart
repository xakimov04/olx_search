import 'package:flutter/material.dart';
import 'package:olx/data/list_data.dart';
import 'package:olx/widgets/card_widget.dart';

class SipiskaPage extends StatelessWidget {
  const SipiskaPage({super.key});

  @override
  Widget build(BuildContext context) {
    Data dataList = Data();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dataList.data.length,
              itemBuilder: (context, index) {
                final item = dataList.data[index];
                return SpiskaCardWidget(
                  image: item["images"],
                  text: item["text"],
                  price: item["price"],
                  location: item["location"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
