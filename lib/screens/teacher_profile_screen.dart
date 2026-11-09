import 'package:flutter/material.dart';

import '../app_colors.dart';
import 'booking_request_screen.dart';

class TeacherProfileScreen extends StatelessWidget {
  final dynamic teacher;

  const TeacherProfileScreen({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    final name = teacher is Map ? teacher['name'] ?? 'Teacher' : 'Teacher';
    final subject = teacher is Map
        ? teacher['subject'] ?? 'Subject'
        : 'Subject';
    final somaliSubject = teacher is Map ? teacher['somaliSubject'] ?? '' : '';
    final price = teacher is Map ? teacher['price'] ?? '\$5/hr' : '\$5/hr';
    final rating = teacher is Map ? teacher['rating'] ?? '4.9' : '4.9';
    final location = teacher is Map
        ? teacher['location'] ?? 'Hargeisa'
        : 'Hargeisa';

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        title: const Text(
          'Teacher Profile',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_rounded),
          ),
        ],
      ),
      bottomNavigationBar: _buildBookingButton(context, name, price),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 110),
        child: Column(
          children: [
            _buildProfileHeader(name, subject, somaliSubject, rating, location),
            const SizedBox(height: 16),
            _buildStats(rating, price),
            const SizedBox(height: 16),
            _buildAbout(name),
            const SizedBox(height: 16),
            _buildSubjects(subject, somaliSubject),
            const SizedBox(height: 16),
            _buildAvailability(),
            const SizedBox(height: 16),
            _buildReviews(rating),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(
    String name,
    String subject,
    String somaliSubject,
    String rating,
    String location,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          Container(
            width: 92,
            height: 92,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0E5),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Icon(
              Icons.person_rounded,
              size: 52,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              const Icon(
                Icons.verified_rounded,
                color: Color(0xFF2196F3),
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '$subject • $somaliSubject',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star_rounded,
                color: Color(0xFFFFB300),
                size: 20,
              ),
              const SizedBox(width: 4),
              Text(rating, style: const TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(width: 14),
              const Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
                size: 19,
              ),
              const SizedBox(width: 3),
              Text(
                location,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: const Color(0xFFEFFAF3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.verified_rounded,
                  size: 16,
                  color: Color(0xFF20A464),
                ),
                SizedBox(width: 5),
                Text(
                  'Identity verified',
                  style: TextStyle(
                    color: Color(0xFF16834D),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats(String rating, String price) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          _statItem(Icons.star_rounded, rating, 'Rating'),
          _divider(),
          _statItem(Icons.people_alt_outlined, '25+', 'Students'),
          _divider(),
          _statItem(Icons.attach_money_rounded, price, 'Per hour'),
        ],
      ),
    );
  }

  Widget _statItem(IconData icon, String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 20, color: AppColors.primary),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 3),
          Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(width: 1, height: 42, color: const Color(0xFFE5E7EB));
  }

  Widget _buildAbout(String name) {
    return _sectionCard(
      title: 'About this teacher',
      somaliTitle: 'Ku saabsan macallinkan',
      child: Text(
        '$name is an experienced tutor dedicated to helping students understand concepts clearly and achieve their learning goals. Lessons can be adapted to the student\'s level and learning pace.',
        style: const TextStyle(
          fontSize: 14,
          height: 1.6,
          color: Color(0xFF5F6368),
        ),
      ),
    );
  }

  Widget _buildSubjects(String subject, String somaliSubject) {
    return _sectionCard(
      title: 'Subjects',
      somaliTitle: 'Maadooyinka',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          _subjectChip(subject),
          if (somaliSubject.isNotEmpty) _subjectChip(somaliSubject),
        ],
      ),
    );
  }

  Widget _subjectChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0E5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildAvailability() {
    return _sectionCard(
      title: 'Availability',
      somaliTitle: 'Waqtiyada uu diyaar yahay',
      child: Column(
        children: [
          _availabilityRow('Monday', '4:00 PM – 8:00 PM'),
          _availabilityRow('Wednesday', '4:00 PM – 8:00 PM'),
          _availabilityRow('Saturday', '9:00 AM – 1:00 PM'),
        ],
      ),
    );
  }

  Widget _availabilityRow(String day, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          const Icon(Icons.schedule_rounded, size: 18, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              day,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            ),
          ),
          Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildReviews(String rating) {
    return _sectionCard(
      title: 'Reviews',
      somaliTitle: 'Qiimeynta ardayda',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                rating,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.star_rounded,
                color: Color(0xFFFFB300),
                size: 24,
              ),
              const Spacer(),
              const Text(
                '18 reviews',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(),
          const SizedBox(height: 10),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 19,
                backgroundColor: Color(0xFFFFF0E5),
                child: Icon(
                  Icons.person_rounded,
                  size: 20,
                  color: Color(0xFFF97316),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Great teacher!',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Very patient and explains everything clearly.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionCard({
    required String title,
    required String somaliTitle,
    required Widget child,
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
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  Widget _buildBookingButton(BuildContext context, String name, String price) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: const Border(top: BorderSide(color: Color(0xFFE5E7EB))),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 12,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Starting from',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  final teacherData = Map<String, String>.from(
                    teacher is Map ? teacher : <String, String>{},
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          BookingRequestScreen(teacher: teacherData),
                    ),
                  );
                },
                child: const Text(
                  'Book a lesson',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
