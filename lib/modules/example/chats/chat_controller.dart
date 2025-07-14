import 'package:flutter/material.dart';
import '../../../models/chat_model.dart';

class ChatController extends ChangeNotifier {
  // Chat message list
  List<Chat> records = Chat.mockMessages();

  // UI controllers
  final ScrollController scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  /// Called when the user submits the input
  Future<void> onFieldSubmitted() async {
    if (!isTextFieldEnabled) return;

    // Add the new message to the end of the list
    records = [
      ...records,
      Chat.sent(message: textEditingController.text),
    ];

    // Scroll to the bottom to show the latest message
    scrollController.animateTo(
      0, // reverse: true so 0 is bottom
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    // Clear the input field
    textEditingController.clear();

    // Notify UI to rebuild
    notifyListeners();
  }

  /// Called whenever the text input changes
  void onFieldChanged(String value) {
    notifyListeners();
  }

  /// Check if the input field has any content
  bool get isTextFieldEnabled => textEditingController.text.trim().isNotEmpty;
}
