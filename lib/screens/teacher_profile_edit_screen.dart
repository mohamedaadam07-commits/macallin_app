import 'package:flutter/material.dart';

import '../app_colors.dart';

class TeacherProfileEditScreen extends StatefulWidget {
  const TeacherProfileEditScreen({super.key});

  @override
  State<TeacherProfileEditScreen> createState() =>
      _TeacherProfileEditScreenState();
}

class _TeacherProfileEditScreenState extends State<TeacherProfileEditScreen> {
  final nameController = TextEditingController();
  final subjectController = TextEditingController();
  final priceController = TextEditingController();
  final locationController = TextEditingController();
  final experienceController = TextEditingController();
  final bioController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    subjectController.dispose();
    priceController.dispose();
    locationController.dispose();
    experienceController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),

            _buildSectionTitle(
              'Basic information',
              'Macluumaadka aasaasiga ah',
            ),
            const SizedBox(height: 12),

            _buildField(
              controller: nameController,
              label: 'Full name',
              hint: 'Magaca oo dhan',
              icon: Icons.person_outline_rounded,
            ),
            const SizedBox(height: 14),

            _buildField(
              controller: subjectController,
              label: 'Subject',
              hint: 'Maadada aad dhigto',
              icon: Icons.menu_book_outlined,
            ),
            const SizedBox(height: 14),

            _buildField(
              controller: priceController,
              label: 'Hourly rate',
              hint: 'Qiimaha saacaddii',
              icon: Icons.attach_money_rounded,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 14),

            _buildField(
              controller: locationController,
              label: 'Location',
              hint: 'Goobta aad ka dhigto casharrada',
              icon: Icons.location_on_outlined,
            ),

            const SizedBox(height: 24),

            _buildSectionTitle('Teaching experience', 'Khibradda waxbaridda'),
            const SizedBox(height: 12),

            _buildField(
              controller: experienceController,
              label: 'Experience',
              hint: 'Tusaale: 3 years of teaching',
              icon: Icons.workspace_premium_outlined,
            ),

            const SizedBox(height: 24),

            _buildSectionTitle('About you', 'Ku saabsan naftaada'),
            const SizedBox(height: 12),

            _buildField(
              controller: bioController,
              label: 'Bio',
              hint: 'Tell students about yourself...',
              icon: Icons.description_outlined,
              maxLines: 5,
            ),

            const SizedBox(height: 24),

            _buildSectionTitle('Availability', 'Waqtiyada aad diyaar tahay'),
            const SizedBox(height: 12),

            _buildAvailabilityCard(),

            const SizedBox(height: 26),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.check_rounded),
                label: const Text(
                  'Save changes',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                ),
              ),
            ),

            const SizedBox(height: 8),

            const Center(
              child: Text(
                'Kaydi isbeddellada profile-kaaga',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
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
          Stack(
            children: [
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF0E5),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Icon(
                  Icons.person_rounded,
                  size: 48,
                  color: AppColors.primary,
                ),
              ),
              Positioned(
                right: -2,
                bottom: -2,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Your teaching profile',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 4),
          const Text(
            'Profile-kaaga ka dhig mid soo jiita ardayda.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, String somaliTitle) {
    return Column(
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
      ],
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Icon(icon),
        ),
        alignLabelWithHint: maxLines > 1,
      ),
    );
  }

  Widget _buildAvailabilityCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          _availabilityRow('Monday', '4:00 PM – 8:00 PM'),
          const Divider(height: 20),
          _availabilityRow('Wednesday', '4:00 PM – 8:00 PM'),
          const Divider(height: 20),
          _availabilityRow('Saturday', '9:00 AM – 1:00 PM'),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit_calendar_rounded),
              label: const Text('Manage availability'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _availabilityRow(String day, String time) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: const Color(0xFFFFF0E5),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Icon(
            Icons.schedule_rounded,
            size: 19,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            day,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
          ),
        ),
        Text(
          time,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
