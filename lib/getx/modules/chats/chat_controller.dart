import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/chat_model.dart';

class ChatController extends GetxController {
  /// List of chat messages
  final RxList<Chat> records = Chat.mockMessages().obs;

  /// UI controllers
  final ScrollController scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  /// Computed property: check if text input is not empty
  bool get isTextFieldEnabled => textEditingController.text.trim().isNotEmpty;

  /// Called when the user submits the message
  void onFieldSubmitted() {
    if (!isTextFieldEnabled) return;

    // Add new message to the list
    records.add(Chat.sent(message: textEditingController.text));

    // Clear the input field
    textEditingController.clear();

    // Scroll to bottom
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  /// Called when input changes (can be expanded for reactive behavior)
  void onFieldChanged(String value) {
    // This is reactive already; nothing needed unless side-effects are required.
  }

  /// Clean up controllers when not in use
  @override
  void onClose() {
    scrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
