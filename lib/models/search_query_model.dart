class SearchQueryModel {
  final String id;
  final String query;
  final DateTime timestamp;
  final String userId;
  final List<String>? resultIds;
  final bool hasResults;

  SearchQueryModel({
    required this.id,
    required this.query,
    required this.userId,
    DateTime? timestamp,
    this.resultIds,
    this.hasResults = false,
  }) : timestamp = timestamp ?? DateTime.now();

  // Create from Map (for Firebase or local storage)
  factory SearchQueryModel.fromMap(Map<String, dynamic> map, String docId) {
    return SearchQueryModel(
      id: docId,
      query: map['query'] ?? '',
      userId: map['userId'] ?? '',
      timestamp: map['timestamp'] != null 
          ? (map['timestamp'] is DateTime 
              ? map['timestamp'] 
              : DateTime.parse(map['timestamp']))
          : DateTime.now(),
      resultIds: map['resultIds'] != null 
          ? List<String>.from(map['resultIds']) 
          : null,
      hasResults: map['hasResults'] ?? false,
    );
  }

  // Convert to Map (for Firebase or local storage)
  Map<String, dynamic> toMap() {
    return {
      'query': query,
      'userId': userId,
      'timestamp': timestamp.toIso8601String(),
      'resultIds': resultIds,
      'hasResults': hasResults,
    };
  }

  // Create a copy with optional modified fields
  SearchQueryModel copyWith({
    String? query,
    String? userId,
    DateTime? timestamp,
    List<String>? resultIds,
    bool? hasResults,
  }) {
    return SearchQueryModel(
      id: this.id,
      query: query ?? this.query,
      userId: userId ?? this.userId,
      timestamp: timestamp ?? this.timestamp,
      resultIds: resultIds ?? this.resultIds,
      hasResults: hasResults ?? this.hasResults,
    );
  }
}