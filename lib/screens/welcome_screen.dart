import 'package:flutter/material.dart';

import 'role_selection_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 28, 20, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo and name
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF97316),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.school_outlined,
                      color: Colors.white,
                      size: 27,
                    ),
                  ),
                  const SizedBox(width: 13),
                  const Text(
                    'Macallin',
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.8,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 42),

              // Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFECDD),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.verified_outlined,
                      size: 16,
                      color: Color(0xFFF97316),
                    ),
                    SizedBox(width: 6),
                    Text(
                      "Somaliland's tutoring marketplace",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9A3412),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Main headline
              const Text(
                'Learn with tutors you can',
                style: TextStyle(
                  fontSize: 36,
                  height: 1.05,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1.3,
                  color: Colors.black,
                ),
              ),

              const Text(
                'trust.',
                style: TextStyle(
                  fontSize: 36,
                  height: 1.05,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1.3,
                  color: Color(0xFFF97316),
                ),
              ),

              const SizedBox(height: 18),

              // Description
              const Text(
                'Macallin connects students and parents with verified '
                'teachers across Somaliland — from Quran studies and '
                'mathematics to English and computer science.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Color(0xFF6B7280),
                ),
              ),

              const SizedBox(height: 26),

              // Create account
              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RoleSelectionScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF97316),
                    foregroundColor: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Create an account',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Login
              SizedBox(
                width: double.infinity,
                height: 49,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Color(0xFFE5E7EB)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'I already have an account',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 38),

              // Find tutor card
              _FeatureCard(
                icon: Icons.search,
                title: 'Find the right tutor',
                description: 'Search by subject, location, and availability.',
              ),

              const SizedBox(height: 14),

              // Verified teachers card
              _FeatureCard(
                icon: Icons.verified_user_outlined,
                title: 'Verified teachers',
                description: 'Connect with trusted and verified tutors.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE5E7EB)),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0E5),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: const Color(0xFFF97316), size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
