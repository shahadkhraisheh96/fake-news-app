import 'package:flutter/material.dart';
import '../utils/mock_data.dart';
import '../widgets/news_card.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('صفحه لاكثر الاخبار انتشار'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Categories
          _buildCategoriesBar(),
          
          // News list
          Expanded(
            child: _buildNewsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesBar() {
    final categories = ['الكل', 'تكنولوجيا', 'أعمال', 'رياضة', 'سياسة', 'صحة'];
    
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: ElevatedButton(
              onPressed: () {
                // Filter news by category
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: index == 0 ? Colors.blue : Colors.grey[800],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: Text(
                categories[index],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNewsList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: MockData.mockArabicNews.length,
      itemBuilder: (context, index) {
        final article = MockData.mockArabicNews[index];
        return NewsCard.fromNewsModel(
          article,
          onTap: () {
            // Show article details
          },
        );
      },
    );
  }
}