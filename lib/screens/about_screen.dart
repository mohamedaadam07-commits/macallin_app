import 'package:flutter/material.dart';

import '../app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        title: const Text(
          'About Macallin',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
        child: Column(
          children: [
            _buildBrandCard(),
            const SizedBox(height: 16),
            _buildSection(
              title: 'Our Mission',
              somaliTitle: 'Hadafkeena',
              text: 'Macallin aims to make quality tutoring more accessible and trusted by connecting students and parents with verified teachers.',
            ),
            const SizedBox(height: 16),
            _buildSection(
              title: 'How Macallin Helps',
              somaliTitle: 'Sida Macallin kuu caawinayo',
              text: 'Students and parents can discover teachers, compare profiles, view availability, request lessons, and communicate directly with tutors.',
            ),
            const SizedBox(height: 16),
            _buildFeaturesCard(),
            const SizedBox(height: 16),
            _buildInfoCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(23),
            ),
            child: const Icon(
              Icons.school_rounded,
              color: Colors.white,
              size: 39,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'Macallin',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 27,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Learn. Connect. Grow.',
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 13),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0E5),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              'Somaliland\'s tutoring marketplace',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String somaliTitle,
    required String text,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 2),
          Text(
            somaliTitle,
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              height: 1.6,
              color: Color(0xFF5F6368),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'What we offer',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 2),
          const Text(
            'Waxa Macallin bixiyo',
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
          const SizedBox(height: 15),
          _feature(
            Icons.verified_user_outlined,
            'Verified Teachers',
            'Trusted teacher profiles',
          ),
          _feature(
            Icons.search_rounded,
            'Easy Discovery',
            'Find teachers by subject and location',
          ),
          _feature(
            Icons.calendar_month_outlined,
            'Simple Booking',
            'Choose a convenient lesson time',
          ),
          _feature(
            Icons.chat_bubble_outline_rounded,
            'Direct Communication',
            'Connect with your teacher',
          ),
        ],
      ),
    );
  }

  Widget _feature(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0E5),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 10.5, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFFED7AA)),
      ),
      child: Column(
        children: [
          const Text(
            'Macallin',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 4),
          const Text(
            'Building a trusted tutoring community.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
          ),
          const SizedBox(height: 10),
          Text(
            'Version 1.0.0',
            style: TextStyle(
              fontSize: 11,
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
