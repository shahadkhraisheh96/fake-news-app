class ChatMessageModel {
  final String id;
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final MessageStatus status;
  final String? associatedQuery;

  ChatMessageModel({
    required this.id,
    required this.text,
    required this.isUser,
    DateTime? timestamp,
    this.status = MessageStatus.sent,
    this.associatedQuery,
  }) : timestamp = timestamp ?? DateTime.now();

  // Create from Map (for Firebase or local storage)
  factory ChatMessageModel.fromMap(Map<String, dynamic> map, String docId) {
    return ChatMessageModel(
      id: docId,
      text: map['text'] ?? '',
      isUser: map['isUser'] ?? false,
      timestamp: map['timestamp'] != null 
          ? (map['timestamp'] is DateTime 
              ? map['timestamp'] 
              : DateTime.parse(map['timestamp']))
          : DateTime.now(),
      status: MessageStatus.values[map['status'] ?? 0],
      associatedQuery: map['associatedQuery'],
    );
  }

  // Convert to Map (for Firebase or local storage)
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'isUser': isUser,
      'timestamp': timestamp.toIso8601String(),
      'status': status.index,
      'associatedQuery': associatedQuery,
    };
  }

  // Create a copy with optional modified fields
  ChatMessageModel copyWith({
    String? text,
    bool? isUser,
    DateTime? timestamp,
    MessageStatus? status,
    String? associatedQuery,
  }) {
    return ChatMessageModel(
      id: this.id,
      text: text ?? this.text,
      isUser: isUser ?? this.isUser,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      associatedQuery: associatedQuery ?? this.associatedQuery,
    );
  }
}

// Status of the message
enum MessageStatus {
  sending,
  sent,
  delivered,
  read,
  failed,
}