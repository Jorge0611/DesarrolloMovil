import 'package:flutter/material.dart';

class CategoryTextWidget extends StatefulWidget {
  const CategoryTextWidget({Key? key}) : super(key: key);

  @override
  State<CategoryTextWidget> createState() => _CategoryTextWidgetState();
}

class _CategoryTextWidgetState extends State<CategoryTextWidget> {
  final List<String> _categoryName = [
    "All",
    "Fruits",
    "Vegetables",
    "Meat",
    "Fish",
    "Bakery",
    "Dairy",
    "Beverages",
    "Snacks",
    "Others"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Categories",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 40,
          child: Row(
            children: [
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: _categoryName.length,
                  itemBuilder: (context, index) {
                    return ActionChip(
                      label: Text(_categoryName[index]),
                      onPressed: () {
                        debugPrint(_categoryName[index]);
                      },
                    );
                  },
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
        )
      ],
    );
  }
}
