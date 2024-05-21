import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx/data/list_data.dart';
import 'package:olx/pages/galeriya_page.dart';
import 'package:olx/pages/plitka_page.dart';
import 'package:olx/pages/sipiska_page.dart';
import 'package:olx/widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int select = 0;
  String searchQuery = '';
  final List<Widget> pages = const [
    GaleriyaPage(),
    SipiskaPage(),
    PlitkaPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "МЫ НАШЛИ БОЛЕЕ 1 000 ОБЪЯВЛЕНИЙ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    Data().data.reversed;
                  });
                },
                icon: const Icon(CupertinoIcons.arrow_up_arrow_down),
              ),
              PopupMenuButton(
                onSelected: (value) {
                  setState(() {
                    select = value;
                  });
                },
                icon: select == 0
                    ? Image.asset("assets/icons/menu_galeriya.png")
                    : select == 1
                        ? const Icon(CupertinoIcons.list_bullet)
                        : Image.asset(
                            "assets/icons/menu.png",
                            width: 30,
                            height: 30,
                          ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Галерея",
                            style: TextStyle(
                                fontWeight: select == 0
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          if (select == 0)
                            Icon(
                              Icons.done,
                              color: Colors.greenAccent.shade400,
                            ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Список",
                            style: TextStyle(
                                fontWeight: select == 1
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          if (select == 1)
                            Icon(
                              Icons.done,
                              color: Colors.greenAccent.shade400,
                            ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Плитка",
                            style: TextStyle(
                                fontWeight: select == 2
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                          if (select == 2)
                            Icon(
                              Icons.done,
                              color: Colors.greenAccent.shade400,
                            ),
                        ],
                      ),
                    ),
                  ];
                },
              ),
            ],
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  color: Colors.blue,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                      Text(
                        "Сохранить поиск",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: searchQuery.isEmpty ? pages[select] : _buildSearchResults(),
    );
  }

  Widget _buildSearchResults() {
    final filteredData = Data().data.where((item) {
      final itemTitle = item["text"].toLowerCase();
      return itemTitle.contains(searchQuery);
    }).toList();

    return ListView.builder(
      itemCount: filteredData.length,
      itemBuilder: (context, index) {
        final item = filteredData[index];
        return GaleriyaCardWidget(
          image: item["images"],
          text: item["text"],
          price: item["price"],
          location: item["location"],
        );
      },
    );
  }
}
