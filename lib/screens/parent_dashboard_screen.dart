import 'package:flutter/material.dart';

import '../app_colors.dart';
import 'chat_screen.dart';
import 'settings_screen.dart';
import 'teacher_profile_screen.dart';
import 'teacher_search_screen.dart';

class ParentDashboardScreen extends StatelessWidget {
  const ParentDashboardScreen({super.key});

  final List<Map<String, String>> teachers = const [
    {
      'name': 'Ahmed Xasan',
      'subject': 'Math',
      'somaliSubject': 'Xisaabta',
      'price': '\$5/hr',
      'rating': '4.9',
      'location': 'Hargeisa',
    },
    {
      'name': 'Faadumo Ali',
      'subject': 'English',
      'somaliSubject': 'Ingiriisi',
      'price': '\$4/hr',
      'rating': '4.8',
      'location': 'Hargeisa',
    },
    {
      'name': 'Yusuf Warsame',
      'subject': 'Quran',
      'somaliSubject': 'Quraan',
      'price': '\$3/hr',
      'rating': '5.0',
      'location': 'Hargeisa',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        title: const Text(
          'Macallin',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChatScreen()),
              );
            },
            icon: const Icon(Icons.chat_bubble_outline_rounded),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcome(),
            const SizedBox(height: 20),
            _buildSearchButton(context),
            const SizedBox(height: 24),
            _buildSectionTitle(
              'Browse subjects',
              'Ka dooro maadada aad rabto inaad barato.',
            ),
            const SizedBox(height: 12),
            _buildSubjects(context),
            const SizedBox(height: 24),
            _buildSectionTitle(
              'Upcoming lessons',
              'Casharrada kuu qorshaysan.',
            ),
            const SizedBox(height: 12),
            _buildUpcomingLesson(),
            const SizedBox(height: 24),
            _buildSectionTitle(
              'Recommended teachers',
              'Macallimiinta laguugu taliyay.',
            ),
            const SizedBox(height: 12),
            _buildTeacherList(context),
            const SizedBox(height: 24),
            _buildSectionTitle('Quick actions', 'Waxqabadyo degdeg ah.'),
            const SizedBox(height: 12),
            _buildQuickActions(context),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TeacherSearchScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ChatScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            );
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_rounded),
            label: 'Teachers',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline_rounded),
            label: 'Messages',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildWelcome() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back 👋',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
        ),
        SizedBox(height: 5),
        Text(
          'Ku soo dhawoow Macallin',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TeacherSearchScreen()),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: [
            Icon(Icons.search_rounded, color: AppColors.primary, size: 23),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'What do you want to learn?',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF0E5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Search',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 3),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 11, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildSubjects(BuildContext context) {
    final subjects = [
      {'title': 'Math', 'somali': 'Xisaab', 'icon': Icons.calculate_outlined},
      {
        'title': 'English',
        'somali': 'Ingiriisi',
        'icon': Icons.language_rounded,
      },
      {'title': 'Quran', 'somali': 'Quraan', 'icon': Icons.menu_book_outlined},
      {
        'title': 'Computer',
        'somali': 'Computer',
        'icon': Icons.computer_outlined,
      },
    ];

    return SizedBox(
      height: 108,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: subjects.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final subject = subjects[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TeacherSearchScreen()),
              );
            },
            child: Container(
              width: 92,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF0E5),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Icon(
                      subject['icon'] as IconData,
                      color: AppColors.primary,
                      size: 22,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    subject['title'] as String,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    subject['somali'] as String,
                    style: const TextStyle(fontSize: 9, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildUpcomingLesson() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0E5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(Icons.calendar_month_rounded, color: AppColors.primary),
          ),
          const SizedBox(width: 13),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No upcoming lessons',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 4),
                Text(
                  'Weli ma lihid cashar kuu qorshaysan.',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeacherList(BuildContext context) {
    return Column(
      children: teachers.map((teacher) {
        return _TeacherCard(
          teacher: teacher,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TeacherProfileScreen(teacher: teacher),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _quickAction(
            context,
            Icons.search_rounded,
            'Find teacher',
            'Raadi macallin',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TeacherSearchScreen()),
              );
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _quickAction(
            context,
            Icons.chat_bubble_outline_rounded,
            'Messages',
            'Fariimaha',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChatScreen()),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _quickAction(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.primary, size: 24),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class _TeacherCard extends StatelessWidget {
  final Map<String, String> teacher;
  final VoidCallback onTap;

  const _TeacherCard({required this.teacher, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF0E5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.person_rounded,
                  size: 30,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            teacher['name']!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.verified_rounded,
                          size: 16,
                          color: Color(0xFF2196F3),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${teacher['subject']} • ${teacher['somaliSubject']}',
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 16,
                          color: Color(0xFFFFB300),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          teacher['rating']!,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          teacher['price']!,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
