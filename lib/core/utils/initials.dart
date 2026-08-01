/// Safe first letter for avatars. Avoids `Bad state: No element` on empty names.
String initialLetter(String value, {String fallback = '?'}) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) return fallback;
  return String.fromCharCode(trimmed.runes.first);
}
