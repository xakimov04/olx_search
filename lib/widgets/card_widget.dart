import 'package:flutter/material.dart';

class GaleriyaCardWidget extends StatefulWidget {
  final String image;
  final String text;
  final String price;
  final String location;

  const GaleriyaCardWidget({
    super.key,
    required this.image,
    required this.text,
    required this.price,
    required this.location,
  });

  @override
  State<GaleriyaCardWidget> createState() => _GaleriyaCardWidgetState();
}

class _GaleriyaCardWidgetState extends State<GaleriyaCardWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        width: double.infinity,
        height: 410,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                FadeInImage.assetNetwork(
                  placeholder: "assets/images/1.gif",
                  placeholderFit: BoxFit.contain,
                  image: widget.image,
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFF1EE1D7),
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(10))),
                    width: 50,
                    height: 25,
                    child: const Center(
                      child: Text(
                        "Top",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.text,
                          textAlign: TextAlign.start,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isSelected = !_isSelected;
                          });
                        },
                        icon: Icon(
                          _isSelected ? Icons.favorite : Icons.favorite_border,
                          color: _isSelected ? Colors.red : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 50,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade300,
                    ),
                    child: const Center(
                      child: Text(
                        "Новый",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(widget.location),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpiskaCardWidget extends StatefulWidget {
  final String image;
  final String text;
  final String price;
  final String location;

  const SpiskaCardWidget({
    Key? key,
    required this.image,
    required this.text,
    required this.price,
    required this.location,
  }) : super(key: key);

  @override
  State<SpiskaCardWidget> createState() => _SpiskaCardWidgetState();
}

class _SpiskaCardWidgetState extends State<SpiskaCardWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              width: 150,
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.text.substring(0, 20),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isSelected = !_isSelected;
                            });
                          },
                          icon: Icon(
                            _isSelected
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _isSelected ? Colors.red : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade300,
                      ),
                      child: const Text(
                        "Новый",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Text(
                      widget.price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(widget.location),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
