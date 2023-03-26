import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(20),
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "??',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          print('button: $textValue');
          textController.clear();
        },
      ),
    );

    return TextFormField(
      onTapOutside: (evt) {
        focusNode.unfocus();
      },
      controller: textController,
      decoration: inputDecoration,
      focusNode: focusNode,
      onFieldSubmitted: (val) {
        print('Submit value $val');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
