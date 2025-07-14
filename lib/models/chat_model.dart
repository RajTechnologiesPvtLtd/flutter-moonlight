enum ChatMessageType {
  sent,
  received,
}

class Chat {
  final String message;
  final ChatMessageType type;
  final DateTime time;

  Chat({
    required this.message,
    required this.type,
    required this.time,
  });

  factory Chat.sent({required String message}) {
    return Chat(
      message: message,
      type: ChatMessageType.sent,
      time: DateTime.now(),
    );
  }

  static List<Chat> mockMessages() {
    final now = DateTime.now();

    return [
      Chat(
        message: "Hey there!",
        type: ChatMessageType.sent,
        time: now.subtract(const Duration(minutes: 15)),
      ),
      Chat(
        message: "Hi! How's your day going?",
        type: ChatMessageType.received,
        time: now.subtract(const Duration(minutes: 14)),
      ),
      Chat(
        message: "Pretty good, just working on a Flutter app.",
        type: ChatMessageType.sent,
        time: now.subtract(const Duration(minutes: 13)),
      ),
      Chat(
        message: "Nice! Flutter is awesome.",
        type: ChatMessageType.received,
        time: now.subtract(const Duration(minutes: 12)),
      ),
      Chat(
        message: "Totally agree.",
        type: ChatMessageType.sent,
        time: now.subtract(const Duration(minutes: 11)),
      ),
      Chat(
        message: "Do you need any help?",
        type: ChatMessageType.received,
        time: now.subtract(const Duration(minutes: 10)),
      ),
      Chat(
        message: "Actually, yes. I'm building a chat UI.",
        type: ChatMessageType.sent,
        time: now.subtract(const Duration(minutes: 9)),
      ),
      Chat(
        message: "Cool! Want me to review your code?",
        type: ChatMessageType.received,
        time: now.subtract(const Duration(minutes: 8)),
      ),
      Chat(
        message: "That would be amazing.",
        type: ChatMessageType.sent,
        time: now.subtract(const Duration(minutes: 7)),
      ),
      Chat(
        message: "Send it over!",
        type: ChatMessageType.received,
        time: now.subtract(const Duration(minutes: 6)),
      ),
      Chat(
        message: "Done ✅",
        type: ChatMessageType.sent,
        time: now.subtract(const Duration(minutes: 5)),
      ),
      Chat(
        message: "Reviewing now...",
        type: ChatMessageType.received,
        time: now.subtract(const Duration(minutes: 4)),
      ),
      Chat(
        message: "Let me know your thoughts.",
        type: ChatMessageType.sent,
        time: now.subtract(const Duration(minutes: 3)),
      ),
      Chat(
        message: "Looking good so far!",
        type: ChatMessageType.received,
        time: now.subtract(const Duration(minutes: 2)),
      ),
      Chat(
        message: "Thanks! Really appreciate it.",
        type: ChatMessageType.sent,
        time: now.subtract(const Duration(minutes: 1)),
      ),
      Chat(
        message: "No problem 😄",
        type: ChatMessageType.received,
        time: now,
      ),
    ];
  }
}
