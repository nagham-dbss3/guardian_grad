/// Masking helpers for sensitive identifiers (least-privilege display).
class Masking {
  Masking._();

  /// Mask a national/identity number, keeping only the last [visible] digits.
  /// e.g. "0123456789" -> "••••••6789"
  static String maskId(String? value, {int visible = 4}) {
    if (value == null || value.isEmpty) return '—';
    final clean = value.trim();
    if (clean.length <= visible) return '•' * clean.length;
    final tail = clean.substring(clean.length - visible);
    return '${'•' * (clean.length - visible)}$tail';
  }

  /// Mask a phone number keeping the last 3 digits.
  static String maskPhone(String? value) {
    if (value == null || value.isEmpty) return '—';
    final clean = value.replaceAll(' ', '');
    if (clean.length <= 3) return clean;
    final tail = clean.substring(clean.length - 3);
    return '${clean.substring(0, 3)}••••$tail';
  }
}
