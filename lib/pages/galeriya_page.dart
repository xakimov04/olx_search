import 'package:flutter/material.dart'; // Cupertino o'chirildi
import 'package:olx/data/list_data.dart';
import 'package:olx/widgets/card_widget.dart';

class GaleriyaPage extends StatelessWidget {
  const GaleriyaPage({super.key});

  @override
  Widget build(BuildContext context) {
    Data data_list = Data();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: data_list.data.length,
              itemBuilder: (context, index) {
                final item = data_list.data[index];
                return GaleriyaCardWidget(
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
