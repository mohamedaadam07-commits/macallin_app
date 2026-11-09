import 'package:flutter/material.dart';

import '../app_colors.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        title: const Text(
          'Help Center',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
        children: [
          _buildHeader(),
          const SizedBox(height: 20),

          _buildSectionTitle(
            'Frequently Asked Questions',
            'Su\'aalaha inta badan la isweydiiyo',
          ),
          const SizedBox(height: 8),

          _buildFaqCard(
            question: 'How does Macallin work?',
            answer: 'Macallin connects students and parents with trusted teachers. You can search for a teacher, view their profile, choose a suitable time, and send a booking request.',
          ),

          _buildFaqCard(
            question: 'How do I book a teacher?',
            answer: 'Find a teacher from the Teachers section, open their profile, tap Book a Lesson, select your preferred day and time, then send your booking request.',
          ),

          _buildFaqCard(
            question: 'How do I become a teacher?',
            answer: 'Create a teacher account, complete your profile, add your subjects and availability, and submit the required information for verification.',
          ),

          _buildFaqCard(
            question: 'Can I cancel a booking?',
            answer: 'Yes. You can manage your bookings and cancel a lesson when cancellation is available according to the booking terms.',
          ),

          _buildFaqCard(
            question: 'How does teacher verification work?',
            answer: 'Macallin uses a verification process to help parents and students identify trusted teachers. Verified teachers receive a verification badge on their profile.',
          ),

          const SizedBox(height: 20),

          _buildSectionTitle(
            'Need More Help?',
            'Ma u baahan tahay caawimaad dheeraad ah?',
          ),
          const SizedBox(height: 8),

          _buildSupportCard(
            icon: Icons.email_outlined,
            title: 'Contact Support',
            subtitle: 'Get help from the Macallin support team',
            onTap: () {
              _showSupportMessage(context);
            },
          ),

          const SizedBox(height: 12),

          _buildSupportCard(
            icon: Icons.chat_bubble_outline_rounded,
            title: 'Send us a message',
            subtitle: 'Tell us how we can help you',
            onTap: () {
              _showSupportMessage(context);
            },
          ),

          const SizedBox(height: 24),

          Center(
            child: Column(
              children: [
                Text(
                  'Macallin',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Learn. Connect. Grow.',
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0E5),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Icon(
              Icons.support_agent_rounded,
              color: AppColors.primary,
              size: 29,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How can we help?',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 4),
                Text(
                  'Sidaan kuu caawin karnaa?',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildFaqCard({required String question, required String answer}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        iconColor: AppColors.primary,
        collapsedIconColor: const Color(0xFF6B7280),
        title: Text(
          question,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
        ),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              answer,
              style: const TextStyle(
                fontSize: 12,
                height: 1.55,
                color: Color(0xFF6B7280),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF0E5),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: AppColors.primary, size: 21),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: Color(0xFF9CA3AF)),
          ],
        ),
      ),
    );
  }

  void _showSupportMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Contact Support',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          content: const Text(
            'Support messaging will be connected to the Macallin support system in the next phase.',
            style: TextStyle(color: Colors.grey, height: 1.5),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Got it'),
            ),
          ],
        );
      },
    );
  }
}
