import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(
      text: text,
      fromWho: FromWho.me,
    );

    messageList.add(newMessage);

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    // Esperar intencionalmente
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      // que vaya hasta donde el scroll permita
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300), // Duración de la animación
      curve: Curves.easeOut, // Tipo de animación
    );
  }
}
