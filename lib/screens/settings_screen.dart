import 'package:flutter/material.dart';

import '../app_colors.dart';
import 'login_screen.dart';
import 'notification_settings_screen.dart';
import 'security_screen.dart';
import 'help_center_screen.dart';
import 'about_screen.dart';
import 'teacher_profile_edit_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
        children: [
          _buildProfileCard(),
          const SizedBox(height: 20),

          _buildSectionTitle('Account', 'Koontada'),
          const SizedBox(height: 8),

          _buildSettingsCard(
            children: [
              _buildSettingItem(
                icon: Icons.person_outline_rounded,
                title: 'Profile',
                subtitle: 'Manage your personal information',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TeacherProfileEditScreen(),
                    ),
                  );
                },
              ),
              _buildDivider(),
              _buildSettingItem(
                icon: Icons.notifications_none_rounded,
                title: 'Notifications',
                subtitle: 'Manage your notifications',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NotificationSettingsScreen(),
                    ),
                  );
                },
              ),
              _buildDivider(),
              _buildSettingItem(
                icon: Icons.lock_outline_rounded,
                title: 'Security',
                subtitle: 'Password and account security',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SecurityScreen()),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 20),

          _buildSectionTitle('Support', 'Caawimaad'),
          const SizedBox(height: 8),

          _buildSettingsCard(
            children: [
              _buildSettingItem(
                icon: Icons.help_outline_rounded,
                title: 'Help Center',
                subtitle: 'Get help and find answers',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HelpCenterScreen()),
                  );
                },
              ),
              _buildDivider(),
              _buildSettingItem(
                icon: Icons.info_outline_rounded,
                title: 'About Macallin',
                subtitle: 'Learn more about the platform',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AboutScreen()),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 20),

          _buildSectionTitle('Account Actions', 'Ficillada koontada'),
          const SizedBox(height: 8),

          _buildSettingsCard(
            children: [
              _buildSettingItem(
                icon: Icons.logout_rounded,
                title: 'Log Out',
                subtitle: 'Sign out of your account',
                iconColor: const Color(0xFFDC2626),
                titleColor: const Color(0xFFDC2626),
                onTap: () => _showLogoutDialog(context),
              ),
            ],
          ),

          const SizedBox(height: 28),

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

  Widget _buildProfileCard() {
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
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0E5),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              Icons.person_rounded,
              color: AppColors.primary,
              size: 31,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Account',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 3),
                Text(
                  'Maamulka koontadaada',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right_rounded, color: Colors.grey),
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

  Widget _buildSettingsCard({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color? iconColor,
    Color? titleColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: iconColor == null
                    ? const Color(0xFFFFF0E5)
                    : const Color(0xFFFEF2F2),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                icon,
                size: 21,
                color: iconColor ?? AppColors.primary,
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: titleColor ?? const Color(0xFF111827),
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
            const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFF9CA3AF),
              size: 21,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.only(left: 71),
      child: Divider(height: 1, color: Color(0xFFE5E7EB)),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Log out?',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          content: const Text(
            'Are you sure you want to log out of your Macallin account?',
            style: TextStyle(color: Colors.grey, height: 1.5),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDC2626),
                foregroundColor: Colors.white,
              ),
              child: const Text('Log Out'),
            ),
          ],
        );
      },
    );
  }
}
