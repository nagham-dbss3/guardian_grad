// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clinical.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LabResultView _$LabResultViewFromJson(Map<String, dynamic> json) {
  return _LabResultView.fromJson(json);
}

/// @nodoc
mixin _$LabResultView {
  String get id => throw _privateConstructorUsedError;
  String get testType => throw _privateConstructorUsedError;
  DateTime get resultDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get pdfPath => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  bool get isBiopsy => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;

  /// Serializes this LabResultView to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LabResultView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LabResultViewCopyWith<LabResultView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LabResultViewCopyWith<$Res> {
  factory $LabResultViewCopyWith(
    LabResultView value,
    $Res Function(LabResultView) then,
  ) = _$LabResultViewCopyWithImpl<$Res, LabResultView>;
  @useResult
  $Res call({
    String id,
    String testType,
    DateTime resultDate,
    String status,
    String pdfPath,
    bool isRead,
    bool isBiopsy,
    String? summary,
  });
}

/// @nodoc
class _$LabResultViewCopyWithImpl<$Res, $Val extends LabResultView>
    implements $LabResultViewCopyWith<$Res> {
  _$LabResultViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LabResultView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? testType = null,
    Object? resultDate = null,
    Object? status = null,
    Object? pdfPath = null,
    Object? isRead = null,
    Object? isBiopsy = null,
    Object? summary = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            testType: null == testType
                ? _value.testType
                : testType // ignore: cast_nullable_to_non_nullable
                      as String,
            resultDate: null == resultDate
                ? _value.resultDate
                : resultDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            pdfPath: null == pdfPath
                ? _value.pdfPath
                : pdfPath // ignore: cast_nullable_to_non_nullable
                      as String,
            isRead: null == isRead
                ? _value.isRead
                : isRead // ignore: cast_nullable_to_non_nullable
                      as bool,
            isBiopsy: null == isBiopsy
                ? _value.isBiopsy
                : isBiopsy // ignore: cast_nullable_to_non_nullable
                      as bool,
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LabResultViewImplCopyWith<$Res>
    implements $LabResultViewCopyWith<$Res> {
  factory _$$LabResultViewImplCopyWith(
    _$LabResultViewImpl value,
    $Res Function(_$LabResultViewImpl) then,
  ) = __$$LabResultViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String testType,
    DateTime resultDate,
    String status,
    String pdfPath,
    bool isRead,
    bool isBiopsy,
    String? summary,
  });
}

/// @nodoc
class __$$LabResultViewImplCopyWithImpl<$Res>
    extends _$LabResultViewCopyWithImpl<$Res, _$LabResultViewImpl>
    implements _$$LabResultViewImplCopyWith<$Res> {
  __$$LabResultViewImplCopyWithImpl(
    _$LabResultViewImpl _value,
    $Res Function(_$LabResultViewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LabResultView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? testType = null,
    Object? resultDate = null,
    Object? status = null,
    Object? pdfPath = null,
    Object? isRead = null,
    Object? isBiopsy = null,
    Object? summary = freezed,
  }) {
    return _then(
      _$LabResultViewImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        testType: null == testType
            ? _value.testType
            : testType // ignore: cast_nullable_to_non_nullable
                  as String,
        resultDate: null == resultDate
            ? _value.resultDate
            : resultDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        pdfPath: null == pdfPath
            ? _value.pdfPath
            : pdfPath // ignore: cast_nullable_to_non_nullable
                  as String,
        isRead: null == isRead
            ? _value.isRead
            : isRead // ignore: cast_nullable_to_non_nullable
                  as bool,
        isBiopsy: null == isBiopsy
            ? _value.isBiopsy
            : isBiopsy // ignore: cast_nullable_to_non_nullable
                  as bool,
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LabResultViewImpl implements _LabResultView {
  const _$LabResultViewImpl({
    required this.id,
    required this.testType,
    required this.resultDate,
    required this.status,
    required this.pdfPath,
    this.isRead = false,
    this.isBiopsy = false,
    this.summary,
  });

  factory _$LabResultViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$LabResultViewImplFromJson(json);

  @override
  final String id;
  @override
  final String testType;
  @override
  final DateTime resultDate;
  @override
  final String status;
  @override
  final String pdfPath;
  @override
  @JsonKey()
  final bool isRead;
  @override
  @JsonKey()
  final bool isBiopsy;
  @override
  final String? summary;

  @override
  String toString() {
    return 'LabResultView(id: $id, testType: $testType, resultDate: $resultDate, status: $status, pdfPath: $pdfPath, isRead: $isRead, isBiopsy: $isBiopsy, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LabResultViewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.testType, testType) ||
                other.testType == testType) &&
            (identical(other.resultDate, resultDate) ||
                other.resultDate == resultDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.pdfPath, pdfPath) || other.pdfPath == pdfPath) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.isBiopsy, isBiopsy) ||
                other.isBiopsy == isBiopsy) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    testType,
    resultDate,
    status,
    pdfPath,
    isRead,
    isBiopsy,
    summary,
  );

  /// Create a copy of LabResultView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LabResultViewImplCopyWith<_$LabResultViewImpl> get copyWith =>
      __$$LabResultViewImplCopyWithImpl<_$LabResultViewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LabResultViewImplToJson(this);
  }
}

abstract class _LabResultView implements LabResultView {
  const factory _LabResultView({
    required final String id,
    required final String testType,
    required final DateTime resultDate,
    required final String status,
    required final String pdfPath,
    final bool isRead,
    final bool isBiopsy,
    final String? summary,
  }) = _$LabResultViewImpl;

  factory _LabResultView.fromJson(Map<String, dynamic> json) =
      _$LabResultViewImpl.fromJson;

  @override
  String get id;
  @override
  String get testType;
  @override
  DateTime get resultDate;
  @override
  String get status;
  @override
  String get pdfPath;
  @override
  bool get isRead;
  @override
  bool get isBiopsy;
  @override
  String? get summary;

  /// Create a copy of LabResultView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LabResultViewImplCopyWith<_$LabResultViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrescriptionItem _$PrescriptionItemFromJson(Map<String, dynamic> json) {
  return _PrescriptionItem.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionItem {
  String get med => throw _privateConstructorUsedError;
  String get dose => throw _privateConstructorUsedError;
  String? get instructions => throw _privateConstructorUsedError;

  /// Serializes this PrescriptionItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrescriptionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrescriptionItemCopyWith<PrescriptionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionItemCopyWith<$Res> {
  factory $PrescriptionItemCopyWith(
    PrescriptionItem value,
    $Res Function(PrescriptionItem) then,
  ) = _$PrescriptionItemCopyWithImpl<$Res, PrescriptionItem>;
  @useResult
  $Res call({String med, String dose, String? instructions});
}

/// @nodoc
class _$PrescriptionItemCopyWithImpl<$Res, $Val extends PrescriptionItem>
    implements $PrescriptionItemCopyWith<$Res> {
  _$PrescriptionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrescriptionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? med = null,
    Object? dose = null,
    Object? instructions = freezed,
  }) {
    return _then(
      _value.copyWith(
            med: null == med
                ? _value.med
                : med // ignore: cast_nullable_to_non_nullable
                      as String,
            dose: null == dose
                ? _value.dose
                : dose // ignore: cast_nullable_to_non_nullable
                      as String,
            instructions: freezed == instructions
                ? _value.instructions
                : instructions // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrescriptionItemImplCopyWith<$Res>
    implements $PrescriptionItemCopyWith<$Res> {
  factory _$$PrescriptionItemImplCopyWith(
    _$PrescriptionItemImpl value,
    $Res Function(_$PrescriptionItemImpl) then,
  ) = __$$PrescriptionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String med, String dose, String? instructions});
}

/// @nodoc
class __$$PrescriptionItemImplCopyWithImpl<$Res>
    extends _$PrescriptionItemCopyWithImpl<$Res, _$PrescriptionItemImpl>
    implements _$$PrescriptionItemImplCopyWith<$Res> {
  __$$PrescriptionItemImplCopyWithImpl(
    _$PrescriptionItemImpl _value,
    $Res Function(_$PrescriptionItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrescriptionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? med = null,
    Object? dose = null,
    Object? instructions = freezed,
  }) {
    return _then(
      _$PrescriptionItemImpl(
        med: null == med
            ? _value.med
            : med // ignore: cast_nullable_to_non_nullable
                  as String,
        dose: null == dose
            ? _value.dose
            : dose // ignore: cast_nullable_to_non_nullable
                  as String,
        instructions: freezed == instructions
            ? _value.instructions
            : instructions // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrescriptionItemImpl implements _PrescriptionItem {
  const _$PrescriptionItemImpl({
    required this.med,
    required this.dose,
    this.instructions,
  });

  factory _$PrescriptionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionItemImplFromJson(json);

  @override
  final String med;
  @override
  final String dose;
  @override
  final String? instructions;

  @override
  String toString() {
    return 'PrescriptionItem(med: $med, dose: $dose, instructions: $instructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionItemImpl &&
            (identical(other.med, med) || other.med == med) &&
            (identical(other.dose, dose) || other.dose == dose) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, med, dose, instructions);

  /// Create a copy of PrescriptionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionItemImplCopyWith<_$PrescriptionItemImpl> get copyWith =>
      __$$PrescriptionItemImplCopyWithImpl<_$PrescriptionItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionItemImplToJson(this);
  }
}

abstract class _PrescriptionItem implements PrescriptionItem {
  const factory _PrescriptionItem({
    required final String med,
    required final String dose,
    final String? instructions,
  }) = _$PrescriptionItemImpl;

  factory _PrescriptionItem.fromJson(Map<String, dynamic> json) =
      _$PrescriptionItemImpl.fromJson;

  @override
  String get med;
  @override
  String get dose;
  @override
  String? get instructions;

  /// Create a copy of PrescriptionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrescriptionItemImplCopyWith<_$PrescriptionItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DischargeReportView _$DischargeReportViewFromJson(Map<String, dynamic> json) {
  return _DischargeReportView.fromJson(json);
}

/// @nodoc
mixin _$DischargeReportView {
  String get id => throw _privateConstructorUsedError;
  DateTime get lastDoseDate => throw _privateConstructorUsedError;
  List<PrescriptionItem> get prescription => throw _privateConstructorUsedError;
  String get doctorInstructions => throw _privateConstructorUsedError;
  DateTime get nextDoseDate => throw _privateConstructorUsedError;
  String get nextVisitDepartment =>
      throw _privateConstructorUsedError; // e.g. نهاري / داخلي
  DateTime get generatedAt => throw _privateConstructorUsedError;
  bool get exportable => throw _privateConstructorUsedError;

  /// Serializes this DischargeReportView to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DischargeReportView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DischargeReportViewCopyWith<DischargeReportView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DischargeReportViewCopyWith<$Res> {
  factory $DischargeReportViewCopyWith(
    DischargeReportView value,
    $Res Function(DischargeReportView) then,
  ) = _$DischargeReportViewCopyWithImpl<$Res, DischargeReportView>;
  @useResult
  $Res call({
    String id,
    DateTime lastDoseDate,
    List<PrescriptionItem> prescription,
    String doctorInstructions,
    DateTime nextDoseDate,
    String nextVisitDepartment,
    DateTime generatedAt,
    bool exportable,
  });
}

/// @nodoc
class _$DischargeReportViewCopyWithImpl<$Res, $Val extends DischargeReportView>
    implements $DischargeReportViewCopyWith<$Res> {
  _$DischargeReportViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DischargeReportView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastDoseDate = null,
    Object? prescription = null,
    Object? doctorInstructions = null,
    Object? nextDoseDate = null,
    Object? nextVisitDepartment = null,
    Object? generatedAt = null,
    Object? exportable = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            lastDoseDate: null == lastDoseDate
                ? _value.lastDoseDate
                : lastDoseDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            prescription: null == prescription
                ? _value.prescription
                : prescription // ignore: cast_nullable_to_non_nullable
                      as List<PrescriptionItem>,
            doctorInstructions: null == doctorInstructions
                ? _value.doctorInstructions
                : doctorInstructions // ignore: cast_nullable_to_non_nullable
                      as String,
            nextDoseDate: null == nextDoseDate
                ? _value.nextDoseDate
                : nextDoseDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            nextVisitDepartment: null == nextVisitDepartment
                ? _value.nextVisitDepartment
                : nextVisitDepartment // ignore: cast_nullable_to_non_nullable
                      as String,
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            exportable: null == exportable
                ? _value.exportable
                : exportable // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DischargeReportViewImplCopyWith<$Res>
    implements $DischargeReportViewCopyWith<$Res> {
  factory _$$DischargeReportViewImplCopyWith(
    _$DischargeReportViewImpl value,
    $Res Function(_$DischargeReportViewImpl) then,
  ) = __$$DischargeReportViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime lastDoseDate,
    List<PrescriptionItem> prescription,
    String doctorInstructions,
    DateTime nextDoseDate,
    String nextVisitDepartment,
    DateTime generatedAt,
    bool exportable,
  });
}

/// @nodoc
class __$$DischargeReportViewImplCopyWithImpl<$Res>
    extends _$DischargeReportViewCopyWithImpl<$Res, _$DischargeReportViewImpl>
    implements _$$DischargeReportViewImplCopyWith<$Res> {
  __$$DischargeReportViewImplCopyWithImpl(
    _$DischargeReportViewImpl _value,
    $Res Function(_$DischargeReportViewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DischargeReportView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lastDoseDate = null,
    Object? prescription = null,
    Object? doctorInstructions = null,
    Object? nextDoseDate = null,
    Object? nextVisitDepartment = null,
    Object? generatedAt = null,
    Object? exportable = null,
  }) {
    return _then(
      _$DischargeReportViewImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        lastDoseDate: null == lastDoseDate
            ? _value.lastDoseDate
            : lastDoseDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        prescription: null == prescription
            ? _value._prescription
            : prescription // ignore: cast_nullable_to_non_nullable
                  as List<PrescriptionItem>,
        doctorInstructions: null == doctorInstructions
            ? _value.doctorInstructions
            : doctorInstructions // ignore: cast_nullable_to_non_nullable
                  as String,
        nextDoseDate: null == nextDoseDate
            ? _value.nextDoseDate
            : nextDoseDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        nextVisitDepartment: null == nextVisitDepartment
            ? _value.nextVisitDepartment
            : nextVisitDepartment // ignore: cast_nullable_to_non_nullable
                  as String,
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        exportable: null == exportable
            ? _value.exportable
            : exportable // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DischargeReportViewImpl implements _DischargeReportView {
  const _$DischargeReportViewImpl({
    required this.id,
    required this.lastDoseDate,
    final List<PrescriptionItem> prescription = const <PrescriptionItem>[],
    required this.doctorInstructions,
    required this.nextDoseDate,
    required this.nextVisitDepartment,
    required this.generatedAt,
    this.exportable = true,
  }) : _prescription = prescription;

  factory _$DischargeReportViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$DischargeReportViewImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime lastDoseDate;
  final List<PrescriptionItem> _prescription;
  @override
  @JsonKey()
  List<PrescriptionItem> get prescription {
    if (_prescription is EqualUnmodifiableListView) return _prescription;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prescription);
  }

  @override
  final String doctorInstructions;
  @override
  final DateTime nextDoseDate;
  @override
  final String nextVisitDepartment;
  // e.g. نهاري / داخلي
  @override
  final DateTime generatedAt;
  @override
  @JsonKey()
  final bool exportable;

  @override
  String toString() {
    return 'DischargeReportView(id: $id, lastDoseDate: $lastDoseDate, prescription: $prescription, doctorInstructions: $doctorInstructions, nextDoseDate: $nextDoseDate, nextVisitDepartment: $nextVisitDepartment, generatedAt: $generatedAt, exportable: $exportable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DischargeReportViewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lastDoseDate, lastDoseDate) ||
                other.lastDoseDate == lastDoseDate) &&
            const DeepCollectionEquality().equals(
              other._prescription,
              _prescription,
            ) &&
            (identical(other.doctorInstructions, doctorInstructions) ||
                other.doctorInstructions == doctorInstructions) &&
            (identical(other.nextDoseDate, nextDoseDate) ||
                other.nextDoseDate == nextDoseDate) &&
            (identical(other.nextVisitDepartment, nextVisitDepartment) ||
                other.nextVisitDepartment == nextVisitDepartment) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.exportable, exportable) ||
                other.exportable == exportable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    lastDoseDate,
    const DeepCollectionEquality().hash(_prescription),
    doctorInstructions,
    nextDoseDate,
    nextVisitDepartment,
    generatedAt,
    exportable,
  );

  /// Create a copy of DischargeReportView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DischargeReportViewImplCopyWith<_$DischargeReportViewImpl> get copyWith =>
      __$$DischargeReportViewImplCopyWithImpl<_$DischargeReportViewImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DischargeReportViewImplToJson(this);
  }
}

abstract class _DischargeReportView implements DischargeReportView {
  const factory _DischargeReportView({
    required final String id,
    required final DateTime lastDoseDate,
    final List<PrescriptionItem> prescription,
    required final String doctorInstructions,
    required final DateTime nextDoseDate,
    required final String nextVisitDepartment,
    required final DateTime generatedAt,
    final bool exportable,
  }) = _$DischargeReportViewImpl;

  factory _DischargeReportView.fromJson(Map<String, dynamic> json) =
      _$DischargeReportViewImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get lastDoseDate;
  @override
  List<PrescriptionItem> get prescription;
  @override
  String get doctorInstructions;
  @override
  DateTime get nextDoseDate;
  @override
  String get nextVisitDepartment; // e.g. نهاري / داخلي
  @override
  DateTime get generatedAt;
  @override
  bool get exportable;

  /// Create a copy of DischargeReportView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DischargeReportViewImplCopyWith<_$DischargeReportViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppointmentView _$AppointmentViewFromJson(Map<String, dynamic> json) {
  return _AppointmentView.fromJson(json);
}

/// @nodoc
mixin _$AppointmentView {
  String get id => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get department => throw _privateConstructorUsedError;
  bool get isNextDose => throw _privateConstructorUsedError;

  /// Serializes this AppointmentView to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentViewCopyWith<AppointmentView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentViewCopyWith<$Res> {
  factory $AppointmentViewCopyWith(
    AppointmentView value,
    $Res Function(AppointmentView) then,
  ) = _$AppointmentViewCopyWithImpl<$Res, AppointmentView>;
  @useResult
  $Res call({
    String id,
    DateTime dateTime,
    String type,
    String department,
    bool isNextDose,
  });
}

/// @nodoc
class _$AppointmentViewCopyWithImpl<$Res, $Val extends AppointmentView>
    implements $AppointmentViewCopyWith<$Res> {
  _$AppointmentViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateTime = null,
    Object? type = null,
    Object? department = null,
    Object? isNextDose = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            dateTime: null == dateTime
                ? _value.dateTime
                : dateTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            department: null == department
                ? _value.department
                : department // ignore: cast_nullable_to_non_nullable
                      as String,
            isNextDose: null == isNextDose
                ? _value.isNextDose
                : isNextDose // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppointmentViewImplCopyWith<$Res>
    implements $AppointmentViewCopyWith<$Res> {
  factory _$$AppointmentViewImplCopyWith(
    _$AppointmentViewImpl value,
    $Res Function(_$AppointmentViewImpl) then,
  ) = __$$AppointmentViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime dateTime,
    String type,
    String department,
    bool isNextDose,
  });
}

/// @nodoc
class __$$AppointmentViewImplCopyWithImpl<$Res>
    extends _$AppointmentViewCopyWithImpl<$Res, _$AppointmentViewImpl>
    implements _$$AppointmentViewImplCopyWith<$Res> {
  __$$AppointmentViewImplCopyWithImpl(
    _$AppointmentViewImpl _value,
    $Res Function(_$AppointmentViewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppointmentView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dateTime = null,
    Object? type = null,
    Object? department = null,
    Object? isNextDose = null,
  }) {
    return _then(
      _$AppointmentViewImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        dateTime: null == dateTime
            ? _value.dateTime
            : dateTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        department: null == department
            ? _value.department
            : department // ignore: cast_nullable_to_non_nullable
                  as String,
        isNextDose: null == isNextDose
            ? _value.isNextDose
            : isNextDose // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentViewImpl implements _AppointmentView {
  const _$AppointmentViewImpl({
    required this.id,
    required this.dateTime,
    required this.type,
    required this.department,
    this.isNextDose = false,
  });

  factory _$AppointmentViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentViewImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime dateTime;
  @override
  final String type;
  @override
  final String department;
  @override
  @JsonKey()
  final bool isNextDose;

  @override
  String toString() {
    return 'AppointmentView(id: $id, dateTime: $dateTime, type: $type, department: $department, isNextDose: $isNextDose)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentViewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.isNextDose, isNextDose) ||
                other.isNextDose == isNextDose));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, dateTime, type, department, isNextDose);

  /// Create a copy of AppointmentView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentViewImplCopyWith<_$AppointmentViewImpl> get copyWith =>
      __$$AppointmentViewImplCopyWithImpl<_$AppointmentViewImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentViewImplToJson(this);
  }
}

abstract class _AppointmentView implements AppointmentView {
  const factory _AppointmentView({
    required final String id,
    required final DateTime dateTime,
    required final String type,
    required final String department,
    final bool isNextDose,
  }) = _$AppointmentViewImpl;

  factory _AppointmentView.fromJson(Map<String, dynamic> json) =
      _$AppointmentViewImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get dateTime;
  @override
  String get type;
  @override
  String get department;
  @override
  bool get isNextDose;

  /// Create a copy of AppointmentView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentViewImplCopyWith<_$AppointmentViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
