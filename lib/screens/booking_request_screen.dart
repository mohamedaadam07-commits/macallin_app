import 'package:flutter/material.dart';

import '../app_colors.dart';

class BookingRequestScreen extends StatefulWidget {
  final Map<String, String> teacher;

  const BookingRequestScreen({super.key, required this.teacher});

  @override
  State<BookingRequestScreen> createState() => _BookingRequestScreenState();
}

class _BookingRequestScreenState extends State<BookingRequestScreen> {
  String? selectedDay;
  String? selectedTime;
  String selectedDuration = '1 hour';

  final noteController = TextEditingController();

  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  final List<String> times = [
    '9:00 AM',
    '11:00 AM',
    '2:00 PM',
    '5:00 PM',
    '7:00 PM',
  ];

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final teacherName = widget.teacher['name'] ?? 'Teacher';
    final subject = widget.teacher['subject'] ?? 'Subject';
    final price = widget.teacher['price'] ?? '\$5/hr';

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        title: const Text(
          'Book a Lesson',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      bottomNavigationBar: _buildBottomButton(context, teacherName, price),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 110),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTeacherCard(teacherName, subject, price),
            const SizedBox(height: 22),

            _sectionTitle('Choose a day', 'Dooro maalinta casharka'),
            const SizedBox(height: 12),
            _buildDays(),

            const SizedBox(height: 22),

            _sectionTitle('Choose a time', 'Dooro waqtiga casharka'),
            const SizedBox(height: 12),
            _buildTimes(),

            const SizedBox(height: 22),

            _sectionTitle('Lesson duration', 'Muddada casharka'),
            const SizedBox(height: 12),
            _buildDuration(),

            const SizedBox(height: 22),

            _sectionTitle(
              'Message to teacher',
              'Fariin aad u dirto macallinka',
            ),
            const SizedBox(height: 12),
            TextField(
              controller: noteController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Tell the teacher what you want to learn...',
                prefixIcon: Padding(
                  padding: EdgeInsets.only(bottom: 65),
                  child: Icon(Icons.message_outlined),
                ),
              ),
            ),

            const SizedBox(height: 22),

            _buildBookingSummary(teacherName, subject, price),
          ],
        ),
      ),
    );
  }

  Widget _buildTeacherCard(String name, String subject, String price) {
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
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0E5),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Icon(
              Icons.person_rounded,
              size: 32,
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
                        name,
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
                  subject,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 6),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 3),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 11, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildDays() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: days.map((day) {
        final selected = selectedDay == day;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedDay = day;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
            decoration: BoxDecoration(
              color: selected ? AppColors.primary : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: selected ? AppColors.primary : const Color(0xFFE5E7EB),
              ),
            ),
            child: Text(
              day,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: selected ? Colors.white : Colors.black87,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTimes() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: times.map((time) {
        final selected = selectedTime == time;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedTime = time;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
            decoration: BoxDecoration(
              color: selected ? AppColors.primary : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: selected ? AppColors.primary : const Color(0xFFE5E7EB),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.schedule_rounded,
                  size: 15,
                  color: selected ? Colors.white : Colors.grey,
                ),
                const SizedBox(width: 5),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: selected ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDuration() {
    final durations = ['30 minutes', '1 hour', '1.5 hours', '2 hours'];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: durations.map((duration) {
        final selected = selectedDuration == duration;

        return ChoiceChip(
          label: Text(duration),
          selected: selected,
          onSelected: (_) {
            setState(() {
              selectedDuration = duration;
            });
          },
          selectedColor: AppColors.primary,
          labelStyle: TextStyle(
            color: selected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
          side: BorderSide(
            color: selected ? AppColors.primary : const Color(0xFFE5E7EB),
          ),
          backgroundColor: Colors.white,
        );
      }).toList(),
    );
  }

  Widget _buildBookingSummary(
    String teacherName,
    String subject,
    String price,
  ) {
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
            'Booking summary',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 3),
          const Text(
            'Faahfaahinta codsigaaga',
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
          const SizedBox(height: 15),
          _summaryRow('Teacher', teacherName),
          _summaryRow('Subject', subject),
          _summaryRow('Day', selectedDay ?? 'Not selected'),
          _summaryRow('Time', selectedTime ?? 'Not selected'),
          _summaryRow('Duration', selectedDuration),
          const Divider(height: 22),
          Row(
            children: [
              const Text('Rate', style: TextStyle(fontWeight: FontWeight.w700)),
              const Spacer(),
              Text(
                price,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const Spacer(),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton(
    BuildContext context,
    String teacherName,
    String price,
  ) {
    final enabled = selectedDay != null && selectedTime != null;

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
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: enabled
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Booking request sent successfully! • Codsigaaga waa la diray.',
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  }
                : null,
            child: Text(
              enabled ? 'Send booking request' : 'Select day & time',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}
