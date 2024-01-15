import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    //final bool isEmpty = _controller.text.isEmpty;

    return TextField(
      controller: _controller,
      // decoration: InputDecoration(
      //   hintText: "Search for products...",
      //   prefixIcon: const Icon(Icons.search),
      //   suffixIcon: isEmpty
      //       ? null
      //       : IconButton(
      //           onPressed: () {
      //             _controller.clear();
      //           },
      //           icon: const Icon(Icons.clear),
      //         ),
      //   border: const OutlineInputBorder(),
      //   filled: true,
      // ),

      decoration: const InputDecoration(
        hintText: "Search for products...",
        prefixIcon: Icon(Icons.search),
        border: InputBorder.none,
        filled: true,
      ),
    );
  }
}
