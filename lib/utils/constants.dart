class AppConstants {
  // App information
  static const String appName = 'News App';
  static const String appVersion = '1.0.0';
  
  // Firebase collections
  static const String usersCollection = 'users';
  static const String searchHistoryCollection = 'search_history';
  static const String newsCollection = 'news';
  
  // Storage paths
  static const String profileImagesPath = 'profile_images';
  
  // Settings
  static const List<String> supportedLanguages = [
    'English',
    'Arabic',
    'French',
    'Spanish'
  ];
  
  // Default placeholder image
  static const String placeholderImageUrl = 'https://via.placeholder.com/150';
  
  // Contact information
  static const String supportEmail = 'support@newsapp.com';
  static const String supportPhone = '+123 456 7890';
  static const String websiteUrl = 'www.newsapp.com';
  
  // Chatbot messages
  static const String chatbotWelcomeMessage = 'Hi! I\'m your news assistant. Ask me about any news topic.';
  static const String chatbotSearchingMessage = 'Searching for news...';

  // Error messages
  static const String loginError = 'Failed to login. Please check your credentials.';
  static const String signupError = 'Failed to create account. Please try again.';
  static const String networkError = 'Network error. Please check your connection.';
}