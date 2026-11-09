import 'package:flutter/material.dart';

import '../app_colors.dart';
import 'teacher_profile_screen.dart';

class TeacherSearchScreen extends StatefulWidget {
  const TeacherSearchScreen({super.key});

  @override
  State<TeacherSearchScreen> createState() => _TeacherSearchScreenState();
}

class _TeacherSearchScreenState extends State<TeacherSearchScreen> {
  final TextEditingController searchController = TextEditingController();

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
    {
      'name': 'Hodan Cabdi',
      'subject': 'Computer Science',
      'somaliSubject': 'Cilmiga Computer-ka',
      'price': '\$6/hr',
      'rating': '4.7',
      'location': 'Hargeisa',
    },
  ];

  String selectedFilter = 'All';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Map<String, String>> get filteredTeachers {
    final query = searchController.text.toLowerCase();

    return teachers.where((teacher) {
      final matchesSearch =
          teacher['name']!.toLowerCase().contains(query) ||
          teacher['subject']!.toLowerCase().contains(query) ||
          teacher['somaliSubject']!.toLowerCase().contains(query);

      final matchesFilter =
          selectedFilter == 'All' || teacher['subject'] == selectedFilter;

      return matchesSearch && matchesFilter;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        title: const Text(
          'Find a Teacher',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune_rounded),
            tooltip: 'Filters',
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildSearchBar(),
          _buildFilters(),
          const SizedBox(height: 8),
          _buildResultsHeader(),
          Expanded(
            child: filteredTeachers.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                    itemCount: filteredTeachers.length,
                    itemBuilder: (context, index) {
                      return _TeacherCard(
                        teacher: filteredTeachers[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TeacherProfileScreen(
                                teacher: filteredTeachers[index],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(20, 8, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Learn from trusted tutors',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Ka hel macallin ku habboon baahidaada.',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: searchController,
        onChanged: (_) => setState(() {}),
        decoration: InputDecoration(
          hintText: 'Search by name or subject...',
          prefixIcon: const Icon(Icons.search_rounded),
          suffixIcon: searchController.text.isEmpty
              ? null
              : IconButton(
                  onPressed: () {
                    searchController.clear();
                    setState(() {});
                  },
                  icon: const Icon(Icons.close_rounded),
                ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.primary, width: 1.5),
          ),
        ),
      ),
    );
  }

  Widget _buildFilters() {
    final filters = ['All', 'Math', 'English', 'Quran', 'Computer Science'];

    return SizedBox(
      height: 58,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final selected = selectedFilter == filter;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = filter;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: selected ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: selected ? AppColors.primary : const Color(0xFFE5E7EB),
                ),
              ),
              child: Center(
                child: Text(
                  filter,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: selected ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildResultsHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
      child: Row(
        children: [
          const Text(
            'Recommended tutors',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
          const Spacer(),
          Text(
            '${filteredTeachers.length} found',
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off_rounded, size: 60, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No teachers found',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 6),
            Text(
              'Isku day magac ama maado kale.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
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
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAvatar(),
              const SizedBox(width: 14),
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
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.verified_rounded,
                          size: 17,
                          color: Color(0xFF2196F3),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${teacher['subject']} • ${teacher['somaliSubject']}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 18,
                          color: Color(0xFFFFB300),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          teacher['rating']!,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(
                          Icons.location_on_outlined,
                          size: 17,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          teacher['location']!,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          teacher['price']!,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          '• per lesson hour',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 15,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0E5),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Icon(Icons.person_rounded, size: 32, color: AppColors.primary),
    );
  }
}
