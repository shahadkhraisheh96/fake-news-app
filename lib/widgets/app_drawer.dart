import 'package:flutter/material.dart';
import '../utils/mock_data.dart';
import '../utils/theme.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock user data - this would come from authentication in a real app
    final user = MockData.mockUser;
    
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer header with user info
          UserAccountsDrawerHeader(
            accountName: Text(
              user.username ?? 'Guest User',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: AppTheme.primaryColor,
              child: Text(
                (user.username?.isNotEmpty ?? false)
                    ? user.username![0].toUpperCase()
                    : 'G',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey[900],
            ),
          ),
          
          // Home
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context, 
                '/chatbot', 
                (route) => false
              );
            },
          ),
          
          // Arabic News
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Arabic News'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/news');
            },
          ),
          
          // Search History
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Search History'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/history');
            },
          ),
          
          // Divider
          const Divider(),
          
          // Categories subheader
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
            child: Text(
              'CATEGORIES',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          // Technology
          ListTile(
            leading: const Icon(Icons.computer),
            title: const Text('Technology'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to technology category
            },
          ),
          
          // Business
          ListTile(
            leading: const Icon(Icons.business),
            title: const Text('Business'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to business category
            },
          ),
          
          // Sports
          ListTile(
            leading: const Icon(Icons.sports_soccer),
            title: const Text('Sports'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to sports category
            },
          ),
          
          // Health
          ListTile(
            leading: const Icon(Icons.health_and_safety),
            title: const Text('Health'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to health category
            },
          ),
          
          // Entertainment
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Entertainment'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to entertainment category
            },
          ),
          
          // Divider
          const Divider(),
          
          // Settings
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/contact');
            },
          ),
          
          // Account
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Account'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/login');
            },
          ),
          
          // About
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              _showAboutDialog(context);
            },
          ),
        ],
      ),
    );
  }
  
  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'News App',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(
        Icons.newspaper,
        color: AppTheme.primaryColor,
        size: 50,
      ),
      applicationLegalese: '© 2025 News App',
      children: [
        const SizedBox(height: 16),
        const Text(
          'News App is your personalized news assistant, powered by AI to deliver the most relevant news content tailored to your interests.',
          style: TextStyle(height: 1.5),
        ),
      ],
    );
  }
}