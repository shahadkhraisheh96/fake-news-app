import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/chatbot_screen.dart';
import 'screens/result_screen.dart';
import 'screens/news_screen.dart';
import 'screens/history_screen.dart';
import 'screens/login_screen.dart';
import 'screens/contact_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/chatbot': (context) => const ChatbotScreen(),
        '/result': (context) => const ResultScreen(),
        '/news': (context) => const NewsScreen(),
        '/history': (context) => const HistoryScreen(),
        '/login': (context) => const LoginScreen(),
        '/contact': (context) => const ContactScreen(),
      },
    );
  }
}