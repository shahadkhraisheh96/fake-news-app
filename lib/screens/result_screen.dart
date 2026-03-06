import 'package:flutter/material.dart';
import '../utils/mock_data.dart';
import '../widgets/news_card.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Latest'),
            Tab(text: 'Relevant'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // All news tab
          buildNewsList(MockData.mockNews),
          
          // Latest news tab (sorted by date)
          buildNewsList(List.from(MockData.mockNews)
            ..sort((a, b) => b.publishedAt.compareTo(a.publishedAt))),
          
          // Relevant news tab (could be filtered based on user interests in a real app)
          buildNewsList(MockData.mockNews.take(3).toList()),
        ],
      ),
    );
  }

  Widget buildNewsList(List news) {
    return news.isEmpty
        ? const Center(child: Text('No results found'))
        : ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: news.length,
            itemBuilder: (context, index) {
              final article = news[index];
              return NewsCard.fromNewsModel(
                article,
                onTap: () {
                  // Open article detail (in a real app)
                  showNewsDetail(article);
                },
              );
            },
          );
  }

  void showNewsDetail(article) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return ListView(
              controller: scrollController,
              padding: const EdgeInsets.all(16.0),
              children: [
                // Drag handle
                Center(
                  child: Container(
                    width: 40,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                
                // Article image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    article.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Source and date
                Row(
                  children: [
                    Text(
                      article.source,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue[300],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '•',
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      _formatDate(article.publishedAt),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                
                // Title
                Text(
                  article.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Author
                if (article.author.isNotEmpty) ...[
                  Row(
                    children: [
                      const Icon(Icons.person, size: 16, color: Colors.grey),
                      const SizedBox(width: 6),
                      Text(
                        'By ${article.author}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[400],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
                
                // Content
                Text(
                  article.content,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                
                // Tags
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: article.tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      backgroundColor: Colors.blue.withOpacity(0.2),
                      labelStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                      ),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: const EdgeInsets.all(0),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30),
                
                // Action buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(Icons.share, 'Share'),
                    _buildActionButton(Icons.bookmark_border, 'Save'),
                    _buildActionButton(Icons.open_in_browser, 'Open'),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return '${difference.inMinutes} minutes ago';
      }
      return '${difference.inHours} hours ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    }
    
    // Format as date
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}