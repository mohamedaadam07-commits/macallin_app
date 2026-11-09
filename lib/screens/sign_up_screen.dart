import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'parent_dashboard_screen.dart';
import 'teacher_dashboard_screen.dart';

class SignUpFormScreen extends StatefulWidget {
  final String role;

  const SignUpFormScreen({super.key, required this.role});

  @override
  State<SignUpFormScreen> createState() => _SignUpFormScreenState();
}

class _SignUpFormScreenState extends State<SignUpFormScreen> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;

  final supabase = Supabase.instance.client;

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  Future<void> _createAccount() async {
    final name = nameCtrl.text.trim();
    final email = emailCtrl.text.trim();
    final password = passCtrl.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showMessage('Please fill in all fields.');
      return;
    }

    if (password.length < 8) {
      _showMessage('Password must be at least 8 characters.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user == null) {
        throw Exception('Account could not be created.');
      }

      final profileRole = widget.role == 'teacher' ? 'teacher' : 'parent';

      await supabase.from('profiles').insert({
        'id': user.id,
        'full_name': name,
        'role': profileRole,
      });

      if (!mounted) return;

      _showMessage('Account created successfully!');

      await Future.delayed(const Duration(milliseconds: 700));

      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => profileRole == 'teacher'
              ? const TeacherDashboardScreen()
              : const ParentDashboardScreen(),
        ),
        (route) => false,
      );
    } on AuthException catch (error) {
      _showMessage(error.message);
    } catch (error) {
      _showMessage('Something went wrong. Please try again.');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showMessage(String message) {
    if (!mounted) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
      );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final isTeacher = widget.role == 'teacher';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Create your account',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create your account',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.8,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Samee akoonkaaga si aad uga bilowdo Macallin.',
                style: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
              ),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7F0),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFFFE5D0)),
                ),
                child: Row(
                  children: [
                    Icon(
                      isTeacher ? Icons.school_outlined : Icons.person_outline,
                      color: primaryColor,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        isTeacher ? 'Teacher account • Akoonka macallinka' : 'Student / Parent account • Akoonka ardayga / waalidka',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                'Full name',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: nameCtrl,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  hintText: 'Magaca oo dhan',
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Email address',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Geli email-kaaga',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Password',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: passCtrl,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Samee password adag',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Use at least 8 characters for better security.',
                style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
              ),

              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _createAccount,
                  child: _isLoading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Create account',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: Text(
                  'By creating an account, you agree to our terms.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.verified_user_outlined,
                      color: primaryColor,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Your information is used to create your Macallin profile. '
                        'Xogtaada waxaa loo isticmaalaa sameynta profile-kaaga.',
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.45,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
