import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  bool _darkMode = true;
  String _currentLanguage = 'English';
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        title: const Text('Contact & Settings'),
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
            Tab(text: 'Settings'),
            Tab(text: 'Contact'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSettingsTab(),
          _buildContactTab(),
        ],
      ),
    );
  }

  Widget _buildSettingsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Appearance section
        _buildSectionHeader('Appearance'),
        
        // Dark mode toggle
        SwitchListTile(
          title: const Text('Dark Mode'),
          subtitle: const Text('Switch between dark and light theme'),
          value: _darkMode,
          onChanged: (value) {
            setState(() {
              _darkMode = value;
            });
          },
          secondary: Icon(
            _darkMode ? Icons.dark_mode : Icons.light_mode,
            color: Colors.blue,
          ),
        ),
        
        const Divider(),
        
        // Language section
        _buildSectionHeader('Language'),
        
        // Language dropdown
        ListTile(
          leading: const Icon(Icons.language, color: Colors.blue),
          title: const Text('App Language'),
          subtitle: Text('Selected: $_currentLanguage'),
          trailing: DropdownButton<String>(
            value: _currentLanguage,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _currentLanguage = newValue;
                });
              }
            },
            items: AppConstants.supportedLanguages.map((String language) {
              return DropdownMenuItem<String>(
                value: language,
                child: Text(language),
              );
            }).toList(),
            underline: Container(),
            icon: const Icon(Icons.arrow_drop_down),
          ),
        ),
        
        const Divider(),
        
        // Notifications section
        _buildSectionHeader('Notifications'),
        
        // News alerts
        SwitchListTile(
          title: const Text('News Alerts'),
          subtitle: const Text('Get notified about breaking news'),
          value: true,
          onChanged: (value) {
            // Update notification settings
          },
          secondary: const Icon(Icons.notifications_active, color: Colors.blue),
        ),
        
        // Daily digest
        SwitchListTile(
          title: const Text('Daily Digest'),
          subtitle: const Text('Receive a daily summary of top news'),
          value: false,
          onChanged: (value) {
            // Update notification settings
          },
          secondary: const Icon(Icons.summarize, color: Colors.blue),
        ),
        
        const Divider(),
        
        // Privacy section
        _buildSectionHeader('Privacy & Data'),
        
        // Clear search history
        ListTile(
          leading: const Icon(Icons.history, color: Colors.blue),
          title: const Text('Clear Search History'),
          onTap: () {
            // Show confirmation dialog and clear history
          },
        ),
        
        // Delete account
        ListTile(
          leading: const Icon(Icons.delete_forever, color: Colors.red),
          title: const Text('Delete Account'),
          subtitle: const Text('Permanently delete your account and data'),
          onTap: () {
            // Show confirmation dialog and delete account
          },
        ),
        
        const SizedBox(height: 24),
        
        // About section
        _buildSectionHeader('About'),
        
        // App version
        ListTile(
          leading: const Icon(Icons.info_outline, color: Colors.blue),
          title: const Text('App Version'),
          subtitle: Text(AppConstants.appVersion),
        ),
        
        // Terms of service
        ListTile(
          leading: const Icon(Icons.description, color: Colors.blue),
          title: const Text('Terms of Service'),
          onTap: () {
            // Open terms of service
          },
        ),
        
        // Privacy policy
        ListTile(
          leading: const Icon(Icons.privacy_tip, color: Colors.blue),
          title: const Text('Privacy Policy'),
          onTap: () {
            // Open privacy policy
          },
        ),
      ],
    );
  }

  Widget _buildContactTab() {
    final _nameController = TextEditingController();
    final _emailController = TextEditingController();
    final _messageController = TextEditingController();
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Contact info
          _buildSectionHeader('Contact Information'),
          
          // Email
          _buildContactItem(
            icon: Icons.email,
            title: 'Email',
            content: AppConstants.supportEmail,
            onTap: () {
              // Open email client
            },
          ),
          
          // Phone
          _buildContactItem(
            icon: Icons.phone,
            title: 'Phone',
            content: AppConstants.supportPhone,
            onTap: () {
              // Make phone call
            },
          ),
          
          // Website
          _buildContactItem(
            icon: Icons.language,
            title: 'Website',
            content: AppConstants.websiteUrl,
            onTap: () {
              // Open website
            },
          ),
          
          const SizedBox(height: 32),
          
          // Contact form
          _buildSectionHeader('Send Us a Message'),
          
          const SizedBox(height: 16),
          
          // Name field
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Email field
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Message field
          TextField(
            controller: _messageController,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.message),
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Submit button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Send message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Message sent successfully'),
                    backgroundColor: Colors.green,
                  ),
                );
                
                // Clear form
                _nameController.clear();
                _emailController.clear();
                _messageController.clear();
              },
              child: const Text(
                'SEND MESSAGE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 32),
          
          // FAQ section
          _buildSectionHeader('Frequently Asked Questions'),
          
          const SizedBox(height: 16),
          
          // FAQ items
          _buildFaqItem(
            question: 'How do I create an account?',
            answer: 'You can create an account by tapping on the profile icon and selecting Sign Up. Follow the instructions to create your account.',
          ),
          
          _buildFaqItem(
            question: 'How to customize my news feed?',
            answer: 'You can customize your news feed by selecting your preferred categories and topics in the settings menu.',
          ),
          
          _buildFaqItem(
            question: 'Can I save articles for later?',
            answer: 'Yes, you can save articles by tapping the bookmark icon on any article. Saved articles can be accessed from your profile.',
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String content,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue, size: 24),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqItem({
    required String question,
    required String answer,
  }) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Text(
            answer,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}