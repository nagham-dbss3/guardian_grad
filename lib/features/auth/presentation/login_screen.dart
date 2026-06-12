import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/services/auth_service.dart';
import '../../../core/services/local_cache.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/gradients.dart';
import '../../../core/theme/radii.dart';
import '../../../core/widgets/primary_button.dart';

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(LocalCache.instance),
);

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _userCtrl = TextEditingController(text: 'family');
  final _passCtrl = TextEditingController(text: '123456');
  bool _loading = false;
  bool _obscure = true;
  String? _error;

  @override
  void dispose() {
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    final auth = ref.read(authServiceProvider);
    final ok = await auth.login(_userCtrl.text, _passCtrl.text);
    if (!mounted) return;
    setState(() => _loading = false);
    if (ok) {
      context.go('/');
    } else {
      setState(() => _error = auth.isLockedOut
          ? 'تم إيقاف الدخول مؤقتًا. حاولوا لاحقًا.'
          : 'بيانات غير صحيحة. المحاولات المتبقية: ${auth.remainingAttempts}');
    }
  }

  Future<void> _biometric() async {
    final auth = ref.read(authServiceProvider);
    final ok = await auth.authenticateBiometric();
    if (!mounted) return;
    if (ok) {
      context.go('/');
    } else {
      setState(() => _error = 'تعذّر التحقق بالبصمة على هذا الجهاز.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Container(
                height: 180,
                decoration: BoxDecoration(
                  gradient: AppGradients.care,
                  borderRadius: BorderRadius.circular(AppRadii.xl3),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite_rounded, color: Colors.white, size: 54),
                    SizedBox(height: 12),
                    Text(
                      'أهلاً بكم في رعاية بسمة',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'نحن معكم في كل خطوة',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              TextField(
                controller: _userCtrl,
                decoration: const InputDecoration(
                  labelText: 'اسم المستخدم أو رقم الهاتف',
                  prefixIcon: Icon(Icons.person_outline_rounded),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: _passCtrl,
                obscureText: _obscure,
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  suffixIcon: IconButton(
                    icon: Icon(_obscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                ),
              ),
              if (_error != null) ...[
                const SizedBox(height: 12),
                Text(
                  _error!,
                  style: const TextStyle(color: AppColors.destructive),
                ),
              ],
              const SizedBox(height: 20),
              PrimaryButton(
                label: 'تسجيل الدخول',
                icon: Icons.login_rounded,
                loading: _loading,
                onPressed: _login,
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _biometric,
                icon: const Icon(Icons.fingerprint_rounded),
                label: const Text('الدخول بالبصمة'),
              ),
              const SizedBox(height: 16),
              const Text(
                'تجريبي: أي اسم/كلمة مرور غير فارغين يعملان.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.mutedForeground, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
