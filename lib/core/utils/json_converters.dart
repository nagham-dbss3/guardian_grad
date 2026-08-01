import 'package:freezed_annotation/freezed_annotation.dart';

/// Accepts JSON values as String or number (common API inconsistency).
class FlexibleStringConverter implements JsonConverter<String, Object?> {
  const FlexibleStringConverter();

  @override
  String fromJson(Object? json) => json?.toString() ?? '';

  @override
  Object toJson(String object) => object;
}

/// Same as [FlexibleStringConverter] but preserves null.
class FlexibleNullableStringConverter
    implements JsonConverter<String?, Object?> {
  const FlexibleNullableStringConverter();

  @override
  String? fromJson(Object? json) => json?.toString();

  @override
  Object? toJson(String? object) => object;
}

/// Parses ISO / date-only strings; returns null when missing/invalid.
class FlexibleDateTimeConverter implements JsonConverter<DateTime?, Object?> {
  const FlexibleDateTimeConverter();

  @override
  DateTime? fromJson(Object? json) {
    if (json == null) return null;
    if (json is DateTime) return json;
    return DateTime.tryParse(json.toString());
  }

  @override
  Object? toJson(DateTime? object) => object?.toIso8601String();
}

/// Non-null DateTime; falls back to epoch if unparsable (should be rare).
class RequiredDateTimeConverter implements JsonConverter<DateTime, Object?> {
  const RequiredDateTimeConverter();

  @override
  DateTime fromJson(Object? json) {
    if (json is DateTime) return json;
    final parsed = DateTime.tryParse(json?.toString() ?? '');
    return parsed ?? DateTime.fromMillisecondsSinceEpoch(0, isUtc: true);
  }

  @override
  Object toJson(DateTime object) => object.toIso8601String();
}
