class UserModel {
  final String uid;
  final String email;
  final String? username;
  final String? profileImageUrl;
  final DateTime createdAt;
  final String? preferredLanguage;
  final bool isDarkMode;
  final List<String> interests;

  UserModel({
    required this.uid,
    required this.email,
    this.username,
    this.profileImageUrl,
    required this.createdAt,
    this.preferredLanguage = 'English',
    this.isDarkMode = true,
    this.interests = const [],
  });

  // Create from Map (for JSON or Firestore)
  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      uid: documentId,
      email: map['email'] ?? '',
      username: map['username'],
      profileImageUrl: map['profileImageUrl'],
      createdAt: map['createdAt'] != null 
          ? (map['createdAt'] is DateTime 
              ? map['createdAt'] 
              : DateTime.parse(map['createdAt'])) 
          : DateTime.now(),
      preferredLanguage: map['preferredLanguage'] ?? 'English',
      isDarkMode: map['isDarkMode'] ?? true,
      interests: map['interests'] != null ? List<String>.from(map['interests']) : [],
    );
  }

  // Convert to Map (for JSON or Firestore)
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'profileImageUrl': profileImageUrl,
      'createdAt': createdAt.toIso8601String(),
      'preferredLanguage': preferredLanguage,
      'isDarkMode': isDarkMode,
      'interests': interests,
    };
  }

  // Create a copy with modified fields
  UserModel copyWith({
    String? username,
    String? profileImageUrl,
    String? preferredLanguage,
    bool? isDarkMode,
    List<String>? interests,
  }) {
    return UserModel(
      uid: this.uid,
      email: this.email,
      username: username ?? this.username,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      createdAt: this.createdAt,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      interests: interests ?? this.interests,
    );
  }
}