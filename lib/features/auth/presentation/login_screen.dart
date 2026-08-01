import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/gradients.dart';
import '../../../core/theme/radii.dart';
import '../../../core/widgets/primary_button.dart';
import '../../shared/data/guardian_providers.dart';
import '../data/auth_providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _loading = false;
  bool _obscure = true;
  String? _formError;

  @override
  void dispose() {
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  /// Phone if mostly digits (optional leading +); otherwise treat as email.
  bool _looksLikePhone(String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');
    return digits.length >= 8 && !value.contains('@');
  }

  String? _validateUser(String? value) {
    final input = (value ?? '').trim();
    if (input.isEmpty) {
      return 'البريد الإلكتروني غير صحيح';
    }
    if (_looksLikePhone(input)) {
      final digits = input.replaceAll(RegExp(r'\D'), '');
      if (!digits.startsWith('09') || digits.length != 10) {
        return 'رقم الهاتف يجب أن يبدأ بـ 09 ويتكون من 10 أرقام';
      }
      return null;
    }
    // Email: must include @ and a domain with a dot (e.g. .com).
    final emailOk = RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    ).hasMatch(input);
    if (!emailOk) {
      return 'البريد الإلكتروني غير صحيح';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if ((value ?? '').isEmpty) {
      return 'كلمة السر غير صحيحة';
    }
    return null;
  }

  Future<void> _login() async {
    setState(() => _formError = null);
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _loading = true);
    final auth = ref.read(authServiceProvider);
    final ok = await auth.login(_userCtrl.text, _passCtrl.text);
    if (!mounted) return;
    if (ok) {
      await ref
          .read(guardianControllerProvider.notifier)
          .syncProfile(clearFirst: true);
      if (!mounted) return;
      setState(() => _loading = false);
      context.go('/');
    } else {
      setState(() {
        _loading = false;
        _formError = auth.isLockedOut
            ? 'تم إيقاف الدخول مؤقتًا. حاولوا لاحقًا.'
            : (auth.lastError ??
                'بيانات غير صحيحة. المحاولات المتبقية: ${auth.remainingAttempts}');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
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
                      Icon(Icons.favorite_rounded,
                          color: Colors.white, size: 54),
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
                TextFormField(
                  controller: _userCtrl,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: _validateUser,
                  decoration: const InputDecoration(
                    labelText: 'البريد الإلكتروني أو رقم الهاتف',
                    prefixIcon: Icon(Icons.person_outline_rounded),
                    errorMaxLines: 2,
                  ),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _passCtrl,
                  obscureText: _obscure,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _login(),
                  validator: _validatePassword,
                  decoration: InputDecoration(
                    labelText: 'كلمة المرور',
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                    errorMaxLines: 2,
                    suffixIcon: IconButton(
                      icon: Icon(_obscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    ),
                  ),
                ),
                if (_formError != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    _formError!,
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
                const SizedBox(height: 16),
                const Text(
                  'استخدموا حساب ولي الأمر المرتبط بمنصة بسمة.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.mutedForeground, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
