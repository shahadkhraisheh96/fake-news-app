class NewsModel {
  final String id;
  final String title;
  final String description;
  final String content;
  final String author;
  final String source;
  final String imageUrl;
  final String url;
  final DateTime publishedAt;
  final String category;
  final List<String> tags;

  NewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.author,
    required this.source,
    required this.imageUrl,
    required this.url,
    required this.publishedAt,
    required this.category,
    required this.tags,
  });

  // Create from Map (for JSON or Firestore)
  factory NewsModel.fromMap(Map<String, dynamic> map, String docId) {
    return NewsModel(
      id: docId,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      content: map['content'] ?? '',
      author: map['author'] ?? '',
      source: map['source'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      url: map['url'] ?? '',
      publishedAt: map['publishedAt'] != null 
          ? (map['publishedAt'] is DateTime 
              ? map['publishedAt'] 
              : DateTime.parse(map['publishedAt'])) 
          : DateTime.now(),
      category: map['category'] ?? '',
      tags: map['tags'] != null ? List<String>.from(map['tags']) : [],
    );
  }

  // Convert to Map (for JSON or Firestore)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'content': content,
      'author': author,
      'source': source,
      'imageUrl': imageUrl,
      'url': url,
      'publishedAt': publishedAt.toIso8601String(),
      'category': category,
      'tags': tags,
    };
  }

  // Create a copy with modified fields
  NewsModel copyWith({
    String? title,
    String? description,
    String? content,
    String? author,
    String? source,
    String? imageUrl,
    String? url,
    DateTime? publishedAt,
    String? category,
    List<String>? tags,
  }) {
    return NewsModel(
      id: this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      content: content ?? this.content,
      author: author ?? this.author,
      source: source ?? this.source,
      imageUrl: imageUrl ?? this.imageUrl,
      url: url ?? this.url,
      publishedAt: publishedAt ?? this.publishedAt,
      category: category ?? this.category,
      tags: tags ?? this.tags,
    );
  }
}