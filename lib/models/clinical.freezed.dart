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
    this.pdfPath = '',
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
  @JsonKey()
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
    final String pdfPath,
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

LabResultsResponse _$LabResultsResponseFromJson(Map<String, dynamic> json) {
  return _LabResultsResponse.fromJson(json);
}

/// @nodoc
mixin _$LabResultsResponse {
  List<LabResultView> get labResults => throw _privateConstructorUsedError;

  /// Serializes this LabResultsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LabResultsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LabResultsResponseCopyWith<LabResultsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LabResultsResponseCopyWith<$Res> {
  factory $LabResultsResponseCopyWith(
    LabResultsResponse value,
    $Res Function(LabResultsResponse) then,
  ) = _$LabResultsResponseCopyWithImpl<$Res, LabResultsResponse>;
  @useResult
  $Res call({List<LabResultView> labResults});
}

/// @nodoc
class _$LabResultsResponseCopyWithImpl<$Res, $Val extends LabResultsResponse>
    implements $LabResultsResponseCopyWith<$Res> {
  _$LabResultsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LabResultsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? labResults = null}) {
    return _then(
      _value.copyWith(
            labResults: null == labResults
                ? _value.labResults
                : labResults // ignore: cast_nullable_to_non_nullable
                      as List<LabResultView>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LabResultsResponseImplCopyWith<$Res>
    implements $LabResultsResponseCopyWith<$Res> {
  factory _$$LabResultsResponseImplCopyWith(
    _$LabResultsResponseImpl value,
    $Res Function(_$LabResultsResponseImpl) then,
  ) = __$$LabResultsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LabResultView> labResults});
}

/// @nodoc
class __$$LabResultsResponseImplCopyWithImpl<$Res>
    extends _$LabResultsResponseCopyWithImpl<$Res, _$LabResultsResponseImpl>
    implements _$$LabResultsResponseImplCopyWith<$Res> {
  __$$LabResultsResponseImplCopyWithImpl(
    _$LabResultsResponseImpl _value,
    $Res Function(_$LabResultsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LabResultsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? labResults = null}) {
    return _then(
      _$LabResultsResponseImpl(
        labResults: null == labResults
            ? _value._labResults
            : labResults // ignore: cast_nullable_to_non_nullable
                  as List<LabResultView>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LabResultsResponseImpl implements _LabResultsResponse {
  const _$LabResultsResponseImpl({
    final List<LabResultView> labResults = const <LabResultView>[],
  }) : _labResults = labResults;

  factory _$LabResultsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LabResultsResponseImplFromJson(json);

  final List<LabResultView> _labResults;
  @override
  @JsonKey()
  List<LabResultView> get labResults {
    if (_labResults is EqualUnmodifiableListView) return _labResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labResults);
  }

  @override
  String toString() {
    return 'LabResultsResponse(labResults: $labResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LabResultsResponseImpl &&
            const DeepCollectionEquality().equals(
              other._labResults,
              _labResults,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_labResults),
  );

  /// Create a copy of LabResultsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LabResultsResponseImplCopyWith<_$LabResultsResponseImpl> get copyWith =>
      __$$LabResultsResponseImplCopyWithImpl<_$LabResultsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LabResultsResponseImplToJson(this);
  }
}

abstract class _LabResultsResponse implements LabResultsResponse {
  const factory _LabResultsResponse({final List<LabResultView> labResults}) =
      _$LabResultsResponseImpl;

  factory _LabResultsResponse.fromJson(Map<String, dynamic> json) =
      _$LabResultsResponseImpl.fromJson;

  @override
  List<LabResultView> get labResults;

  /// Create a copy of LabResultsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LabResultsResponseImplCopyWith<_$LabResultsResponseImpl> get copyWith =>
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
  String get nextVisitDepartment => throw _privateConstructorUsedError;
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
    this.doctorInstructions = '',
    required this.nextDoseDate,
    this.nextVisitDepartment = '',
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
  @JsonKey()
  final String doctorInstructions;
  @override
  final DateTime nextDoseDate;
  @override
  @JsonKey()
  final String nextVisitDepartment;
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
    final String doctorInstructions,
    required final DateTime nextDoseDate,
    final String nextVisitDepartment,
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
  String get nextVisitDepartment;
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

DischargeReportsResponse _$DischargeReportsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _DischargeReportsResponse.fromJson(json);
}

/// @nodoc
mixin _$DischargeReportsResponse {
  List<DischargeReportView> get dischargeReports =>
      throw _privateConstructorUsedError;

  /// Serializes this DischargeReportsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DischargeReportsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DischargeReportsResponseCopyWith<DischargeReportsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DischargeReportsResponseCopyWith<$Res> {
  factory $DischargeReportsResponseCopyWith(
    DischargeReportsResponse value,
    $Res Function(DischargeReportsResponse) then,
  ) = _$DischargeReportsResponseCopyWithImpl<$Res, DischargeReportsResponse>;
  @useResult
  $Res call({List<DischargeReportView> dischargeReports});
}

/// @nodoc
class _$DischargeReportsResponseCopyWithImpl<
  $Res,
  $Val extends DischargeReportsResponse
>
    implements $DischargeReportsResponseCopyWith<$Res> {
  _$DischargeReportsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DischargeReportsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? dischargeReports = null}) {
    return _then(
      _value.copyWith(
            dischargeReports: null == dischargeReports
                ? _value.dischargeReports
                : dischargeReports // ignore: cast_nullable_to_non_nullable
                      as List<DischargeReportView>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DischargeReportsResponseImplCopyWith<$Res>
    implements $DischargeReportsResponseCopyWith<$Res> {
  factory _$$DischargeReportsResponseImplCopyWith(
    _$DischargeReportsResponseImpl value,
    $Res Function(_$DischargeReportsResponseImpl) then,
  ) = __$$DischargeReportsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DischargeReportView> dischargeReports});
}

/// @nodoc
class __$$DischargeReportsResponseImplCopyWithImpl<$Res>
    extends
        _$DischargeReportsResponseCopyWithImpl<
          $Res,
          _$DischargeReportsResponseImpl
        >
    implements _$$DischargeReportsResponseImplCopyWith<$Res> {
  __$$DischargeReportsResponseImplCopyWithImpl(
    _$DischargeReportsResponseImpl _value,
    $Res Function(_$DischargeReportsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DischargeReportsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? dischargeReports = null}) {
    return _then(
      _$DischargeReportsResponseImpl(
        dischargeReports: null == dischargeReports
            ? _value._dischargeReports
            : dischargeReports // ignore: cast_nullable_to_non_nullable
                  as List<DischargeReportView>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DischargeReportsResponseImpl implements _DischargeReportsResponse {
  const _$DischargeReportsResponseImpl({
    final List<DischargeReportView> dischargeReports =
        const <DischargeReportView>[],
  }) : _dischargeReports = dischargeReports;

  factory _$DischargeReportsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DischargeReportsResponseImplFromJson(json);

  final List<DischargeReportView> _dischargeReports;
  @override
  @JsonKey()
  List<DischargeReportView> get dischargeReports {
    if (_dischargeReports is EqualUnmodifiableListView)
      return _dischargeReports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dischargeReports);
  }

  @override
  String toString() {
    return 'DischargeReportsResponse(dischargeReports: $dischargeReports)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DischargeReportsResponseImpl &&
            const DeepCollectionEquality().equals(
              other._dischargeReports,
              _dischargeReports,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_dischargeReports),
  );

  /// Create a copy of DischargeReportsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DischargeReportsResponseImplCopyWith<_$DischargeReportsResponseImpl>
  get copyWith =>
      __$$DischargeReportsResponseImplCopyWithImpl<
        _$DischargeReportsResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DischargeReportsResponseImplToJson(this);
  }
}

abstract class _DischargeReportsResponse implements DischargeReportsResponse {
  const factory _DischargeReportsResponse({
    final List<DischargeReportView> dischargeReports,
  }) = _$DischargeReportsResponseImpl;

  factory _DischargeReportsResponse.fromJson(Map<String, dynamic> json) =
      _$DischargeReportsResponseImpl.fromJson;

  @override
  List<DischargeReportView> get dischargeReports;

  /// Create a copy of DischargeReportsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DischargeReportsResponseImplCopyWith<_$DischargeReportsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DoseReminderModel _$DoseReminderModelFromJson(Map<String, dynamic> json) {
  return _DoseReminderModel.fromJson(json);
}

/// @nodoc
mixin _$DoseReminderModel {
  DateTime? get nextDoseDate => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this DoseReminderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoseReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoseReminderModelCopyWith<DoseReminderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoseReminderModelCopyWith<$Res> {
  factory $DoseReminderModelCopyWith(
    DoseReminderModel value,
    $Res Function(DoseReminderModel) then,
  ) = _$DoseReminderModelCopyWithImpl<$Res, DoseReminderModel>;
  @useResult
  $Res call({DateTime? nextDoseDate, String? message, String? notes});
}

/// @nodoc
class _$DoseReminderModelCopyWithImpl<$Res, $Val extends DoseReminderModel>
    implements $DoseReminderModelCopyWith<$Res> {
  _$DoseReminderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoseReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextDoseDate = freezed,
    Object? message = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            nextDoseDate: freezed == nextDoseDate
                ? _value.nextDoseDate
                : nextDoseDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DoseReminderModelImplCopyWith<$Res>
    implements $DoseReminderModelCopyWith<$Res> {
  factory _$$DoseReminderModelImplCopyWith(
    _$DoseReminderModelImpl value,
    $Res Function(_$DoseReminderModelImpl) then,
  ) = __$$DoseReminderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? nextDoseDate, String? message, String? notes});
}

/// @nodoc
class __$$DoseReminderModelImplCopyWithImpl<$Res>
    extends _$DoseReminderModelCopyWithImpl<$Res, _$DoseReminderModelImpl>
    implements _$$DoseReminderModelImplCopyWith<$Res> {
  __$$DoseReminderModelImplCopyWithImpl(
    _$DoseReminderModelImpl _value,
    $Res Function(_$DoseReminderModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoseReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextDoseDate = freezed,
    Object? message = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$DoseReminderModelImpl(
        nextDoseDate: freezed == nextDoseDate
            ? _value.nextDoseDate
            : nextDoseDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DoseReminderModelImpl implements _DoseReminderModel {
  const _$DoseReminderModelImpl({this.nextDoseDate, this.message, this.notes});

  factory _$DoseReminderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoseReminderModelImplFromJson(json);

  @override
  final DateTime? nextDoseDate;
  @override
  final String? message;
  @override
  final String? notes;

  @override
  String toString() {
    return 'DoseReminderModel(nextDoseDate: $nextDoseDate, message: $message, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoseReminderModelImpl &&
            (identical(other.nextDoseDate, nextDoseDate) ||
                other.nextDoseDate == nextDoseDate) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nextDoseDate, message, notes);

  /// Create a copy of DoseReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoseReminderModelImplCopyWith<_$DoseReminderModelImpl> get copyWith =>
      __$$DoseReminderModelImplCopyWithImpl<_$DoseReminderModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DoseReminderModelImplToJson(this);
  }
}

abstract class _DoseReminderModel implements DoseReminderModel {
  const factory _DoseReminderModel({
    final DateTime? nextDoseDate,
    final String? message,
    final String? notes,
  }) = _$DoseReminderModelImpl;

  factory _DoseReminderModel.fromJson(Map<String, dynamic> json) =
      _$DoseReminderModelImpl.fromJson;

  @override
  DateTime? get nextDoseDate;
  @override
  String? get message;
  @override
  String? get notes;

  /// Create a copy of DoseReminderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoseReminderModelImplCopyWith<_$DoseReminderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoseReminderResponse _$DoseReminderResponseFromJson(Map<String, dynamic> json) {
  return _DoseReminderResponse.fromJson(json);
}

/// @nodoc
mixin _$DoseReminderResponse {
  DoseReminderModel? get doseReminder => throw _privateConstructorUsedError;

  /// Serializes this DoseReminderResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoseReminderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoseReminderResponseCopyWith<DoseReminderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoseReminderResponseCopyWith<$Res> {
  factory $DoseReminderResponseCopyWith(
    DoseReminderResponse value,
    $Res Function(DoseReminderResponse) then,
  ) = _$DoseReminderResponseCopyWithImpl<$Res, DoseReminderResponse>;
  @useResult
  $Res call({DoseReminderModel? doseReminder});

  $DoseReminderModelCopyWith<$Res>? get doseReminder;
}

/// @nodoc
class _$DoseReminderResponseCopyWithImpl<
  $Res,
  $Val extends DoseReminderResponse
>
    implements $DoseReminderResponseCopyWith<$Res> {
  _$DoseReminderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoseReminderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? doseReminder = freezed}) {
    return _then(
      _value.copyWith(
            doseReminder: freezed == doseReminder
                ? _value.doseReminder
                : doseReminder // ignore: cast_nullable_to_non_nullable
                      as DoseReminderModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of DoseReminderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DoseReminderModelCopyWith<$Res>? get doseReminder {
    if (_value.doseReminder == null) {
      return null;
    }

    return $DoseReminderModelCopyWith<$Res>(_value.doseReminder!, (value) {
      return _then(_value.copyWith(doseReminder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DoseReminderResponseImplCopyWith<$Res>
    implements $DoseReminderResponseCopyWith<$Res> {
  factory _$$DoseReminderResponseImplCopyWith(
    _$DoseReminderResponseImpl value,
    $Res Function(_$DoseReminderResponseImpl) then,
  ) = __$$DoseReminderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DoseReminderModel? doseReminder});

  @override
  $DoseReminderModelCopyWith<$Res>? get doseReminder;
}

/// @nodoc
class __$$DoseReminderResponseImplCopyWithImpl<$Res>
    extends _$DoseReminderResponseCopyWithImpl<$Res, _$DoseReminderResponseImpl>
    implements _$$DoseReminderResponseImplCopyWith<$Res> {
  __$$DoseReminderResponseImplCopyWithImpl(
    _$DoseReminderResponseImpl _value,
    $Res Function(_$DoseReminderResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoseReminderResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? doseReminder = freezed}) {
    return _then(
      _$DoseReminderResponseImpl(
        doseReminder: freezed == doseReminder
            ? _value.doseReminder
            : doseReminder // ignore: cast_nullable_to_non_nullable
                  as DoseReminderModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DoseReminderResponseImpl implements _DoseReminderResponse {
  const _$DoseReminderResponseImpl({this.doseReminder});

  factory _$DoseReminderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoseReminderResponseImplFromJson(json);

  @override
  final DoseReminderModel? doseReminder;

  @override
  String toString() {
    return 'DoseReminderResponse(doseReminder: $doseReminder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoseReminderResponseImpl &&
            (identical(other.doseReminder, doseReminder) ||
                other.doseReminder == doseReminder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, doseReminder);

  /// Create a copy of DoseReminderResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoseReminderResponseImplCopyWith<_$DoseReminderResponseImpl>
  get copyWith =>
      __$$DoseReminderResponseImplCopyWithImpl<_$DoseReminderResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DoseReminderResponseImplToJson(this);
  }
}

abstract class _DoseReminderResponse implements DoseReminderResponse {
  const factory _DoseReminderResponse({final DoseReminderModel? doseReminder}) =
      _$DoseReminderResponseImpl;

  factory _DoseReminderResponse.fromJson(Map<String, dynamic> json) =
      _$DoseReminderResponseImpl.fromJson;

  @override
  DoseReminderModel? get doseReminder;

  /// Create a copy of DoseReminderResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoseReminderResponseImplCopyWith<_$DoseReminderResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AppointmentView _$AppointmentViewFromJson(Map<String, dynamic> json) {
  return _AppointmentView.fromJson(json);
}

/// @nodoc
mixin _$AppointmentView {
  @FlexibleStringConverter()
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_time')
  @RequiredDateTimeConverter()
  DateTime get dateTime => throw _privateConstructorUsedError;
  @FlexibleStringConverter()
  String get type => throw _privateConstructorUsedError;
  @FlexibleStringConverter()
  String get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_next_dose')
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
    @FlexibleStringConverter() String id,
    @JsonKey(name: 'date_time') @RequiredDateTimeConverter() DateTime dateTime,
    @FlexibleStringConverter() String type,
    @FlexibleStringConverter() String department,
    @JsonKey(name: 'is_next_dose') bool isNextDose,
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
    @FlexibleStringConverter() String id,
    @JsonKey(name: 'date_time') @RequiredDateTimeConverter() DateTime dateTime,
    @FlexibleStringConverter() String type,
    @FlexibleStringConverter() String department,
    @JsonKey(name: 'is_next_dose') bool isNextDose,
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
    @FlexibleStringConverter() this.id = '',
    @JsonKey(name: 'date_time')
    @RequiredDateTimeConverter()
    required this.dateTime,
    @FlexibleStringConverter() this.type = '',
    @FlexibleStringConverter() this.department = '',
    @JsonKey(name: 'is_next_dose') this.isNextDose = false,
  });

  factory _$AppointmentViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentViewImplFromJson(json);

  @override
  @JsonKey()
  @FlexibleStringConverter()
  final String id;
  @override
  @JsonKey(name: 'date_time')
  @RequiredDateTimeConverter()
  final DateTime dateTime;
  @override
  @JsonKey()
  @FlexibleStringConverter()
  final String type;
  @override
  @JsonKey()
  @FlexibleStringConverter()
  final String department;
  @override
  @JsonKey(name: 'is_next_dose')
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
    @FlexibleStringConverter() final String id,
    @JsonKey(name: 'date_time')
    @RequiredDateTimeConverter()
    required final DateTime dateTime,
    @FlexibleStringConverter() final String type,
    @FlexibleStringConverter() final String department,
    @JsonKey(name: 'is_next_dose') final bool isNextDose,
  }) = _$AppointmentViewImpl;

  factory _AppointmentView.fromJson(Map<String, dynamic> json) =
      _$AppointmentViewImpl.fromJson;

  @override
  @FlexibleStringConverter()
  String get id;
  @override
  @JsonKey(name: 'date_time')
  @RequiredDateTimeConverter()
  DateTime get dateTime;
  @override
  @FlexibleStringConverter()
  String get type;
  @override
  @FlexibleStringConverter()
  String get department;
  @override
  @JsonKey(name: 'is_next_dose')
  bool get isNextDose;

  /// Create a copy of AppointmentView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentViewImplCopyWith<_$AppointmentViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChildAppointmentsResponse _$ChildAppointmentsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ChildAppointmentsResponse.fromJson(json);
}

/// @nodoc
mixin _$ChildAppointmentsResponse {
  @JsonKey(name: 'patient_file_no')
  @FlexibleNullableStringConverter()
  String? get patientFileNo => throw _privateConstructorUsedError;
  List<AppointmentView> get appointments => throw _privateConstructorUsedError;

  /// Serializes this ChildAppointmentsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChildAppointmentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChildAppointmentsResponseCopyWith<ChildAppointmentsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChildAppointmentsResponseCopyWith<$Res> {
  factory $ChildAppointmentsResponseCopyWith(
    ChildAppointmentsResponse value,
    $Res Function(ChildAppointmentsResponse) then,
  ) = _$ChildAppointmentsResponseCopyWithImpl<$Res, ChildAppointmentsResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'patient_file_no')
    @FlexibleNullableStringConverter()
    String? patientFileNo,
    List<AppointmentView> appointments,
  });
}

/// @nodoc
class _$ChildAppointmentsResponseCopyWithImpl<
  $Res,
  $Val extends ChildAppointmentsResponse
>
    implements $ChildAppointmentsResponseCopyWith<$Res> {
  _$ChildAppointmentsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChildAppointmentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? patientFileNo = freezed, Object? appointments = null}) {
    return _then(
      _value.copyWith(
            patientFileNo: freezed == patientFileNo
                ? _value.patientFileNo
                : patientFileNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            appointments: null == appointments
                ? _value.appointments
                : appointments // ignore: cast_nullable_to_non_nullable
                      as List<AppointmentView>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChildAppointmentsResponseImplCopyWith<$Res>
    implements $ChildAppointmentsResponseCopyWith<$Res> {
  factory _$$ChildAppointmentsResponseImplCopyWith(
    _$ChildAppointmentsResponseImpl value,
    $Res Function(_$ChildAppointmentsResponseImpl) then,
  ) = __$$ChildAppointmentsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'patient_file_no')
    @FlexibleNullableStringConverter()
    String? patientFileNo,
    List<AppointmentView> appointments,
  });
}

/// @nodoc
class __$$ChildAppointmentsResponseImplCopyWithImpl<$Res>
    extends
        _$ChildAppointmentsResponseCopyWithImpl<
          $Res,
          _$ChildAppointmentsResponseImpl
        >
    implements _$$ChildAppointmentsResponseImplCopyWith<$Res> {
  __$$ChildAppointmentsResponseImplCopyWithImpl(
    _$ChildAppointmentsResponseImpl _value,
    $Res Function(_$ChildAppointmentsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChildAppointmentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? patientFileNo = freezed, Object? appointments = null}) {
    return _then(
      _$ChildAppointmentsResponseImpl(
        patientFileNo: freezed == patientFileNo
            ? _value.patientFileNo
            : patientFileNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        appointments: null == appointments
            ? _value._appointments
            : appointments // ignore: cast_nullable_to_non_nullable
                  as List<AppointmentView>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChildAppointmentsResponseImpl implements _ChildAppointmentsResponse {
  const _$ChildAppointmentsResponseImpl({
    @JsonKey(name: 'patient_file_no')
    @FlexibleNullableStringConverter()
    this.patientFileNo,
    final List<AppointmentView> appointments = const <AppointmentView>[],
  }) : _appointments = appointments;

  factory _$ChildAppointmentsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChildAppointmentsResponseImplFromJson(json);

  @override
  @JsonKey(name: 'patient_file_no')
  @FlexibleNullableStringConverter()
  final String? patientFileNo;
  final List<AppointmentView> _appointments;
  @override
  @JsonKey()
  List<AppointmentView> get appointments {
    if (_appointments is EqualUnmodifiableListView) return _appointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appointments);
  }

  @override
  String toString() {
    return 'ChildAppointmentsResponse(patientFileNo: $patientFileNo, appointments: $appointments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChildAppointmentsResponseImpl &&
            (identical(other.patientFileNo, patientFileNo) ||
                other.patientFileNo == patientFileNo) &&
            const DeepCollectionEquality().equals(
              other._appointments,
              _appointments,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    patientFileNo,
    const DeepCollectionEquality().hash(_appointments),
  );

  /// Create a copy of ChildAppointmentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChildAppointmentsResponseImplCopyWith<_$ChildAppointmentsResponseImpl>
  get copyWith =>
      __$$ChildAppointmentsResponseImplCopyWithImpl<
        _$ChildAppointmentsResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChildAppointmentsResponseImplToJson(this);
  }
}

abstract class _ChildAppointmentsResponse implements ChildAppointmentsResponse {
  const factory _ChildAppointmentsResponse({
    @JsonKey(name: 'patient_file_no')
    @FlexibleNullableStringConverter()
    final String? patientFileNo,
    final List<AppointmentView> appointments,
  }) = _$ChildAppointmentsResponseImpl;

  factory _ChildAppointmentsResponse.fromJson(Map<String, dynamic> json) =
      _$ChildAppointmentsResponseImpl.fromJson;

  @override
  @JsonKey(name: 'patient_file_no')
  @FlexibleNullableStringConverter()
  String? get patientFileNo;
  @override
  List<AppointmentView> get appointments;

  /// Create a copy of ChildAppointmentsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChildAppointmentsResponseImplCopyWith<_$ChildAppointmentsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
