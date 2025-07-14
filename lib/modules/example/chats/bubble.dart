import 'package:flutter/material.dart';
import '../../../config/config.dart';
import '../../../models/chat_model.dart';
import '../../../utils.dart';
import '../../../widgets/widgets.dart';

class Bubble extends StatelessWidget {
  final Chat chat;

  const Bubble({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    final isSender = chat.type == ChatMessageType.sent;
    // final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSender)
          generateCircleAvatar(name: AppConfig.developerName,radius: 16),
          if (!isSender) const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: isSender ? const Color(0xFF007AFF) : const Color(0xFFE7E7ED),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft:
                      Radius.circular(isSender ? 12 : 0),
                  bottomRight:
                      Radius.circular(isSender ? 0 : 12),
                ),
              ),
              child: Column(
                crossAxisAlignment:
                    isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.message,
                    style: TextStyle(
                      color: isSender ? Colors.white : Colors.black87,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formatDateTime(chat.time),
                    style: TextStyle(
                      fontSize: 11,
                      color: isSender ? Colors.white70 : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
