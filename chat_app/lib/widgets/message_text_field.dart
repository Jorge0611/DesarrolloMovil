import 'package:flutter/material.dart';

class MessageTextField extends StatelessWidget {
  final underlineInputBorder = UnderlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(40),
  );

  final controller = TextEditingController();
  final focusNode = FocusNode();

  final void Function(String) onValue;

  MessageTextField({super.key, required this.onValue});

  void submitMessage(String message) {
    debugPrint('Submitted: $message');
    onValue(message);
    controller.clear();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        focusNode: focusNode,
        onTap: () {
          debugPrint('Tapped');
          focusNode.requestFocus();
        },
        onTapOutside: (event) {
          debugPrint('Tapped outside');
          focusNode.unfocus();
        },
        decoration: InputDecoration(
          hintText: 'Enter a message',
          enabledBorder: underlineInputBorder,
          focusedBorder: underlineInputBorder,
          filled: true,
          suffixIcon: IconButton(
            onPressed: () => submitMessage(controller.text),
            icon: const Icon(Icons.send_outlined),
          ),
        ),
        onFieldSubmitted: (value) => submitMessage(value),
      ),
    );
  }
}
