import 'package:flutter/material.dart';
import '../../../models/chat_model.dart';
import 'package:provider/provider.dart';
import 'chat_controller.dart';
import 'bubble.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatController(),
      builder: (context, child) {
        // Now this context can access ChatController safely
        final controller = context.read<ChatController>();

        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text("Chats"),
          ),
          body: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => controller.focusNode.unfocus(),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Selector<ChatController, List<Chat>>(
                      selector: (_, ctrl) => ctrl.records.reversed.toList(),
                      builder: (context, chatList, child) {
                        return ListView.separated(
                          controller: controller.scrollController,
                          shrinkWrap: true,
                          reverse: true,
                          padding: const EdgeInsets.only(
                                top: 12, bottom: 20) +
                            const EdgeInsets.symmetric(horizontal: 12),
                          separatorBuilder: (_, __) => const SizedBox(height: 12),
                          itemCount: chatList.length,
                          itemBuilder: (_, index) => Bubble(chat: chatList[index]),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const _BottomInputField(),
            ],
          ),
        );
      },
    );
  }
}


/// Bottom Fixed Filed
class _BottomInputField extends StatelessWidget {
  const _BottomInputField();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ChatController>();

    return SafeArea(
      bottom: true,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xFFE5E5EA)),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.textEditingController,
                focusNode: controller.focusNode,
                onChanged: controller.onFieldChanged,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Message...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: controller.onFieldSubmitted,
            ),
          ],
        ),
      ),
    );
  }
}
