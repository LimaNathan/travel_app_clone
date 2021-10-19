import 'package:flutter/material.dart';

class TravelsBarSelector extends StatefulWidget {
  final List travelsLocations;
  const TravelsBarSelector({
    Key? key,
    required this.travelsLocations,
  }) : super(key: key);

  @override
  _TravelsBarSelectorState createState() => _TravelsBarSelectorState();
}

class _TravelsBarSelectorState extends State<TravelsBarSelector> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.travelsLocations.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            height: 20,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(
              left: 30,
              top: 10,
            ),
            child: Text(
              widget.travelsLocations[index],
              style: TextStyle(
                fontSize: 14,
                fontWeight:
                    selectedIndex == index ? FontWeight.bold : FontWeight.w300,
              ),
            ),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
