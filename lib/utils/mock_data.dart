import '../models/news_model.dart';
import '../models/user_model.dart';

class MockData {
  // Mock user
  static UserModel mockUser = UserModel(
    uid: 'mock_user_id',
    email: 'user@example.com',
    username: 'Test User',
    profileImageUrl: null,
    createdAt: DateTime.now().subtract(const Duration(days: 30)),
    preferredLanguage: 'English',
    isDarkMode: true,
    interests: ['Technology', 'Sports', 'Politics'],
  );

  // Mock news articles
  static List<NewsModel> mockNews = [
    NewsModel(
      id: 'news1',
      title: 'New Technology Breakthrough',
      description: 'Scientists discover revolutionary technology that could change the world.',
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
      author: 'John Doe',
      source: 'Tech Daily',
      imageUrl: 'https://via.placeholder.com/400x200?text=Technology',
      url: 'https://example.com/news1',
      publishedAt: DateTime.now().subtract(const Duration(hours: 5)),
      category: 'Technology',
      tags: ['Technology', 'Science', 'Innovation'],
    ),
    NewsModel(
      id: 'news2',
      title: 'Global Markets Update',
      description: 'Stock markets reach new heights as economic recovery continues.',
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
      author: 'Jane Smith',
      source: 'Business Report',
      imageUrl: 'https://via.placeholder.com/400x200?text=Business',
      url: 'https://example.com/news2',
      publishedAt: DateTime.now().subtract(const Duration(hours: 8)),
      category: 'Business',
      tags: ['Business', 'Markets', 'Economy'],
    ),
    NewsModel(
      id: 'news3',
      title: 'Sports Championship Results',
      description: 'Team secures championship victory in thrilling final match.',
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
      author: 'Mike Johnson',
      source: 'Sports Network',
      imageUrl: 'https://via.placeholder.com/400x200?text=Sports',
      url: 'https://example.com/news3',
      publishedAt: DateTime.now().subtract(const Duration(hours: 12)),
      category: 'Sports',
      tags: ['Sports', 'Championship'],
    ),
    NewsModel(
      id: 'news4',
      title: 'Health Advisory Update',
      description: 'New health guidelines released for improving wellbeing.',
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
      author: 'Dr. Sarah Brown',
      source: 'Health Today',
      imageUrl: 'https://via.placeholder.com/400x200?text=Health',
      url: 'https://example.com/news4',
      publishedAt: DateTime.now().subtract(const Duration(hours: 18)),
      category: 'Health',
      tags: ['Health', 'Wellness'],
    ),
    NewsModel(
      id: 'news5',
      title: 'Entertainment Industry News',
      description: 'Major announcements from the entertainment world.',
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
      author: 'Lisa Williams',
      source: 'Entertainment Weekly',
      imageUrl: 'https://via.placeholder.com/400x200?text=Entertainment',
      url: 'https://example.com/news5',
      publishedAt: DateTime.now().subtract(const Duration(days: 1)),
      category: 'Entertainment',
      tags: ['Entertainment', 'Celebrity'],
    ),
  ];

  // Arabic mock news
  static List<NewsModel> mockArabicNews = [
    NewsModel(
      id: 'arabic1',
      title: 'إكتشاف تكنولوجي جديد',
      description: 'العلماء يكتشفون تقنية ثورية يمكن أن تغير العالم.',
      content: 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز...',
      author: 'محمد أحمد',
      source: 'التكنولوجيا اليوم',
      imageUrl: 'https://via.placeholder.com/400x200?text=تكنولوجيا',
      url: 'https://example.com/arabic1',
      publishedAt: DateTime.now().subtract(const Duration(hours: 6)),
      category: 'تكنولوجيا',
      tags: ['تكنولوجيا', 'علوم', 'ابتكار'],
    ),
    NewsModel(
      id: 'arabic2',
      title: 'تحديث الأسواق العالمية',
      description: 'أسواق الأسهم تصل إلى ارتفاعات جديدة مع استمرار الانتعاش الاقتصادي.',
      content: 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز...',
      author: 'فاطمة علي',
      source: 'تقرير الأعمال',
      imageUrl: 'https://via.placeholder.com/400x200?text=أعمال',
      url: 'https://example.com/arabic2',
      publishedAt: DateTime.now().subtract(const Duration(hours: 9)),
      category: 'أعمال',
      tags: ['أعمال', 'أسواق', 'اقتصاد'],
    ),
    NewsModel(
      id: 'arabic3',
      title: 'نتائج بطولة رياضية',
      description: 'الفريق يفوز بالبطولة في مباراة نهائية مثيرة.',
      content: 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز...',
      author: 'خالد محمود',
      source: 'شبكة الرياضة',
      imageUrl: 'https://via.placeholder.com/400x200?text=رياضة',
      url: 'https://example.com/arabic3',
      publishedAt: DateTime.now().subtract(const Duration(hours: 14)),
      category: 'رياضة',
      tags: ['رياضة', 'بطولة'],
    ),
  ];

  // Mock search history
  static List<Map<String, dynamic>> mockSearchHistory = [
    {
      'id': 'search1',
      'query': 'Latest technology news',
      'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
    },
    {
      'id': 'search2',
      'query': 'Global economy',
      'timestamp': DateTime.now().subtract(const Duration(hours: 5)),
    },
    {
      'id': 'search3',
      'query': 'Sports results',
      'timestamp': DateTime.now().subtract(const Duration(days: 1)),
    },
    {
      'id': 'search4',
      'query': 'Health tips',
      'timestamp': DateTime.now().subtract(const Duration(days: 2)),
    },
    {
      'id': 'search5',
      'query': 'Entertainment news',
      'timestamp': DateTime.now().subtract(const Duration(days: 3)),
    },
  ];

  // Sample chat messages
  static List<Map<String, dynamic>> initialChatMessages = [
    {
      'text': 'Hi! I\'m your news assistant. Ask me about any news topic.',
      'isUser': false,
      'timestamp': DateTime.now().subtract(const Duration(minutes: 1)),
    },
  ];
}