import 'package:flutter/material.dart';

import '../app_colors.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool bookingRequests = true;
  bool bookingUpdates = true;
  bool newMessages = true;
  bool reminders = true;
  bool promotions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
        children: [
          _buildHeader(),
          const SizedBox(height: 20),

          _buildSectionTitle(
            'Activity',
            'Ogeysiisyada la xiriira waxqabadkaaga',
          ),
          const SizedBox(height: 8),

          _buildSettingsCard(
            children: [
              _buildNotificationItem(
                icon: Icons.calendar_month_outlined,
                title: 'Booking Requests',
                subtitle: 'Get notified when a booking is requested',
                value: bookingRequests,
                onChanged: (value) {
                  setState(() {
                    bookingRequests = value;
                  });
                },
              ),
              _buildDivider(),
              _buildNotificationItem(
                icon: Icons.event_available_outlined,
                title: 'Booking Updates',
                subtitle: 'Updates about your lessons and bookings',
                value: bookingUpdates,
                onChanged: (value) {
                  setState(() {
                    bookingUpdates = value;
                  });
                },
              ),
              _buildDivider(),
              _buildNotificationItem(
                icon: Icons.chat_bubble_outline_rounded,
                title: 'New Messages',
                subtitle: 'Get notified when you receive a message',
                value: newMessages,
                onChanged: (value) {
                  setState(() {
                    newMessages = value;
                  });
                },
              ),
              _buildDivider(),
              _buildNotificationItem(
                icon: Icons.alarm_outlined,
                title: 'Lesson Reminders',
                subtitle: 'Reminders before your scheduled lessons',
                value: reminders,
                onChanged: (value) {
                  setState(() {
                    reminders = value;
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 20),

          _buildSectionTitle('Other', 'Ogeysiisyo kale'),
          const SizedBox(height: 8),

          _buildSettingsCard(
            children: [
              _buildNotificationItem(
                icon: Icons.local_offer_outlined,
                title: 'Promotions',
                subtitle: 'Tips, offers and Macallin updates',
                value: promotions,
                onChanged: (value) {
                  setState(() {
                    promotions = value;
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7ED),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFFED7AA)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  color: AppColors.primary,
                  size: 21,
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'You can change your notification preferences at any time.',
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.5,
                      color: Color(0xFF7C4A03),
                    ),
                  ),
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
              Icons.notifications_rounded,
              color: AppColors.primary,
              size: 28,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notification Preferences',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 4),
                Text(
                  'Maamul ogeysiisyada aad hesho',
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

  Widget _buildNotificationItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0E5),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, size: 20, color: AppColors.primary),
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
                  style: const TextStyle(
                    fontSize: 10.5,
                    color: Colors.grey,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Switch(
            value: value,
            activeThumbColor: AppColors.primary,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.only(left: 71),
      child: Divider(height: 1, color: Color(0xFFE5E7EB)),
    );
  }
}
