import 'package:flutter/material.dart';

class TeacherDashboardScreen extends StatelessWidget {
  const TeacherDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          'Teacher Dashboard',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined),
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome
              const Text(
                'Good morning, Teacher 👋',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.8,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'Manage your teaching and connect with students.\n'
                'Maamul waxbarashadaada oo la xiriir ardayda.',
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: Color(0xFF6B7280),
                ),
              ),

              const SizedBox(height: 26),

              // Profile completion
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7F0),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFFFE5D0)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: primary.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person_outline, color: primary),
                    ),

                    const SizedBox(width: 14),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Complete your profile',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Ku dar maaddooyinka, khibradda iyo waqtiga aad diyaar tahay.',
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.35,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.grey.shade500,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Overview
              const Text(
                'Your overview',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
              ),

              const SizedBox(height: 4),

              const Text(
                'Guudmarka waxqabadkaaga',
                style: TextStyle(fontSize: 13, color: Color(0xFF9CA3AF)),
              ),

              const SizedBox(height: 14),

              // Stats row 1
              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      icon: Icons.people_outline,
                      value: '0',
                      label: 'Students',
                      somali: 'Arday',
                      color: primary,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _StatCard(
                      icon: Icons.calendar_today_outlined,
                      value: '0',
                      label: 'Bookings',
                      somali: 'Boos celin',
                      color: primary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Stats row 2
              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      icon: Icons.star_outline,
                      value: '0',
                      label: 'Reviews',
                      somali: 'Qiimeyn',
                      color: primary,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _StatCard(
                      icon: Icons.payments_outlined,
                      value: '\$0',
                      label: 'Earnings',
                      somali: 'Dakhliga',
                      color: primary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Upcoming lessons
              const Text(
                'Upcoming lessons',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
              ),

              const SizedBox(height: 4),

              const Text(
                'Casharrada kuu qorshaysan',
                style: TextStyle(fontSize: 13, color: Color(0xFF9CA3AF)),
              ),

              const SizedBox(height: 14),

              _EmptyStateCard(
                icon: Icons.calendar_month_outlined,
                title: 'No upcoming lessons',
                description: 'Casharrada aad xaqiijiso halkan ayay kasoo muuqan doonaan.',
                primary: primary,
              ),

              const SizedBox(height: 30),

              // Quick actions
              const Text(
                'Quick actions',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
              ),

              const SizedBox(height: 4),

              const Text(
                'Waxqabadyo degdeg ah',
                style: TextStyle(fontSize: 13, color: Color(0xFF9CA3AF)),
              ),

              const SizedBox(height: 14),

              _ActionCard(
                icon: Icons.person_outline,
                title: 'Manage profile',
                subtitle: 'Cusboonaysii xogta iyo profile-kaaga',
                primary: primary,
                onTap: () {},
              ),

              const SizedBox(height: 10),

              _ActionCard(
                icon: Icons.access_time_outlined,
                title: 'Set availability',
                subtitle: 'Deji waqtiga ay ardaydu kuu ballansan karaan',
                primary: primary,
                onTap: () {},
              ),

              const SizedBox(height: 10),

              _ActionCard(
                icon: Icons.chat_bubble_outline,
                title: 'Messages',
                subtitle: 'La hadal ardaydaada',
                primary: primary,
                onTap: () {},
              ),

              const SizedBox(height: 30),

              // Recent activity
              const Text(
                'Recent activity',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
              ),

              const SizedBox(height: 4),

              const Text(
                'Waxqabadkii ugu dambeeyay',
                style: TextStyle(fontSize: 13, color: Color(0xFF9CA3AF)),
              ),

              const SizedBox(height: 14),

              _EmptyStateCard(
                icon: Icons.history,
                title: 'No activity yet',
                description: 'Bookings-ka iyo farriimaha cusub halkan ayay kasoo muuqan doonaan.',
                primary: primary,
              ),
            ],
          ),
        ),
      ),

      // Bottom navigation
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            selectedIcon: Icon(Icons.calendar_today),
            label: 'Bookings',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            selectedIcon: Icon(Icons.chat_bubble),
            label: 'Messages',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// STAT CARD
// ─────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final String somali;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.somali,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 23),

          const SizedBox(height: 12),

          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),

          const SizedBox(height: 3),

          Text(
            label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),

          Text(
            somali,
            style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// ACTION CARD
// ─────────────────────────────────────────────

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color primary;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.primary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: primary.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(icon, color: primary),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Text(
                subtitle,
                style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Color(0xFF9CA3AF),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// EMPTY STATE
// ─────────────────────────────────────────────

class _EmptyStateCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color primary;

  const _EmptyStateCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: primary),

          const SizedBox(height: 10),

          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 5),

          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              height: 1.4,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
    );
  }
}
