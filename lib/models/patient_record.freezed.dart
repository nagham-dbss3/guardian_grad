// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PatientRecord _$PatientRecordFromJson(Map<String, dynamic> json) {
  return _PatientRecord.fromJson(json);
}

/// @nodoc
mixin _$PatientRecord {
  ChildSummary get child => throw _privateConstructorUsedError;
  DiseaseOverview get diseaseOverview => throw _privateConstructorUsedError;
  TreatmentPlanView get treatmentPlan => throw _privateConstructorUsedError;
  List<LabResultView> get labResults => throw _privateConstructorUsedError;
  List<DischargeReportView> get dischargeReports =>
      throw _privateConstructorUsedError;
  List<AppointmentView> get appointments => throw _privateConstructorUsedError;
  DoseReminderModel? get doseReminder => throw _privateConstructorUsedError;
  CheckInToken? get checkInToken => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this PatientRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientRecordCopyWith<PatientRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientRecordCopyWith<$Res> {
  factory $PatientRecordCopyWith(
    PatientRecord value,
    $Res Function(PatientRecord) then,
  ) = _$PatientRecordCopyWithImpl<$Res, PatientRecord>;
  @useResult
  $Res call({
    ChildSummary child,
    DiseaseOverview diseaseOverview,
    TreatmentPlanView treatmentPlan,
    List<LabResultView> labResults,
    List<DischargeReportView> dischargeReports,
    List<AppointmentView> appointments,
    DoseReminderModel? doseReminder,
    CheckInToken? checkInToken,
    DateTime lastUpdated,
  });

  $ChildSummaryCopyWith<$Res> get child;
  $DiseaseOverviewCopyWith<$Res> get diseaseOverview;
  $TreatmentPlanViewCopyWith<$Res> get treatmentPlan;
  $DoseReminderModelCopyWith<$Res>? get doseReminder;
  $CheckInTokenCopyWith<$Res>? get checkInToken;
}

/// @nodoc
class _$PatientRecordCopyWithImpl<$Res, $Val extends PatientRecord>
    implements $PatientRecordCopyWith<$Res> {
  _$PatientRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? child = null,
    Object? diseaseOverview = null,
    Object? treatmentPlan = null,
    Object? labResults = null,
    Object? dischargeReports = null,
    Object? appointments = null,
    Object? doseReminder = freezed,
    Object? checkInToken = freezed,
    Object? lastUpdated = null,
  }) {
    return _then(
      _value.copyWith(
            child: null == child
                ? _value.child
                : child // ignore: cast_nullable_to_non_nullable
                      as ChildSummary,
            diseaseOverview: null == diseaseOverview
                ? _value.diseaseOverview
                : diseaseOverview // ignore: cast_nullable_to_non_nullable
                      as DiseaseOverview,
            treatmentPlan: null == treatmentPlan
                ? _value.treatmentPlan
                : treatmentPlan // ignore: cast_nullable_to_non_nullable
                      as TreatmentPlanView,
            labResults: null == labResults
                ? _value.labResults
                : labResults // ignore: cast_nullable_to_non_nullable
                      as List<LabResultView>,
            dischargeReports: null == dischargeReports
                ? _value.dischargeReports
                : dischargeReports // ignore: cast_nullable_to_non_nullable
                      as List<DischargeReportView>,
            appointments: null == appointments
                ? _value.appointments
                : appointments // ignore: cast_nullable_to_non_nullable
                      as List<AppointmentView>,
            doseReminder: freezed == doseReminder
                ? _value.doseReminder
                : doseReminder // ignore: cast_nullable_to_non_nullable
                      as DoseReminderModel?,
            checkInToken: freezed == checkInToken
                ? _value.checkInToken
                : checkInToken // ignore: cast_nullable_to_non_nullable
                      as CheckInToken?,
            lastUpdated: null == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of PatientRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChildSummaryCopyWith<$Res> get child {
    return $ChildSummaryCopyWith<$Res>(_value.child, (value) {
      return _then(_value.copyWith(child: value) as $Val);
    });
  }

  /// Create a copy of PatientRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiseaseOverviewCopyWith<$Res> get diseaseOverview {
    return $DiseaseOverviewCopyWith<$Res>(_value.diseaseOverview, (value) {
      return _then(_value.copyWith(diseaseOverview: value) as $Val);
    });
  }

  /// Create a copy of PatientRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TreatmentPlanViewCopyWith<$Res> get treatmentPlan {
    return $TreatmentPlanViewCopyWith<$Res>(_value.treatmentPlan, (value) {
      return _then(_value.copyWith(treatmentPlan: value) as $Val);
    });
  }

  /// Create a copy of PatientRecord
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

  /// Create a copy of PatientRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckInTokenCopyWith<$Res>? get checkInToken {
    if (_value.checkInToken == null) {
      return null;
    }

    return $CheckInTokenCopyWith<$Res>(_value.checkInToken!, (value) {
      return _then(_value.copyWith(checkInToken: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PatientRecordImplCopyWith<$Res>
    implements $PatientRecordCopyWith<$Res> {
  factory _$$PatientRecordImplCopyWith(
    _$PatientRecordImpl value,
    $Res Function(_$PatientRecordImpl) then,
  ) = __$$PatientRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ChildSummary child,
    DiseaseOverview diseaseOverview,
    TreatmentPlanView treatmentPlan,
    List<LabResultView> labResults,
    List<DischargeReportView> dischargeReports,
    List<AppointmentView> appointments,
    DoseReminderModel? doseReminder,
    CheckInToken? checkInToken,
    DateTime lastUpdated,
  });

  @override
  $ChildSummaryCopyWith<$Res> get child;
  @override
  $DiseaseOverviewCopyWith<$Res> get diseaseOverview;
  @override
  $TreatmentPlanViewCopyWith<$Res> get treatmentPlan;
  @override
  $DoseReminderModelCopyWith<$Res>? get doseReminder;
  @override
  $CheckInTokenCopyWith<$Res>? get checkInToken;
}

/// @nodoc
class __$$PatientRecordImplCopyWithImpl<$Res>
    extends _$PatientRecordCopyWithImpl<$Res, _$PatientRecordImpl>
    implements _$$PatientRecordImplCopyWith<$Res> {
  __$$PatientRecordImplCopyWithImpl(
    _$PatientRecordImpl _value,
    $Res Function(_$PatientRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? child = null,
    Object? diseaseOverview = null,
    Object? treatmentPlan = null,
    Object? labResults = null,
    Object? dischargeReports = null,
    Object? appointments = null,
    Object? doseReminder = freezed,
    Object? checkInToken = freezed,
    Object? lastUpdated = null,
  }) {
    return _then(
      _$PatientRecordImpl(
        child: null == child
            ? _value.child
            : child // ignore: cast_nullable_to_non_nullable
                  as ChildSummary,
        diseaseOverview: null == diseaseOverview
            ? _value.diseaseOverview
            : diseaseOverview // ignore: cast_nullable_to_non_nullable
                  as DiseaseOverview,
        treatmentPlan: null == treatmentPlan
            ? _value.treatmentPlan
            : treatmentPlan // ignore: cast_nullable_to_non_nullable
                  as TreatmentPlanView,
        labResults: null == labResults
            ? _value._labResults
            : labResults // ignore: cast_nullable_to_non_nullable
                  as List<LabResultView>,
        dischargeReports: null == dischargeReports
            ? _value._dischargeReports
            : dischargeReports // ignore: cast_nullable_to_non_nullable
                  as List<DischargeReportView>,
        appointments: null == appointments
            ? _value._appointments
            : appointments // ignore: cast_nullable_to_non_nullable
                  as List<AppointmentView>,
        doseReminder: freezed == doseReminder
            ? _value.doseReminder
            : doseReminder // ignore: cast_nullable_to_non_nullable
                  as DoseReminderModel?,
        checkInToken: freezed == checkInToken
            ? _value.checkInToken
            : checkInToken // ignore: cast_nullable_to_non_nullable
                  as CheckInToken?,
        lastUpdated: null == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientRecordImpl extends _PatientRecord {
  const _$PatientRecordImpl({
    required this.child,
    required this.diseaseOverview,
    required this.treatmentPlan,
    final List<LabResultView> labResults = const <LabResultView>[],
    final List<DischargeReportView> dischargeReports =
        const <DischargeReportView>[],
    final List<AppointmentView> appointments = const <AppointmentView>[],
    this.doseReminder,
    this.checkInToken,
    required this.lastUpdated,
  }) : _labResults = labResults,
       _dischargeReports = dischargeReports,
       _appointments = appointments,
       super._();

  factory _$PatientRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientRecordImplFromJson(json);

  @override
  final ChildSummary child;
  @override
  final DiseaseOverview diseaseOverview;
  @override
  final TreatmentPlanView treatmentPlan;
  final List<LabResultView> _labResults;
  @override
  @JsonKey()
  List<LabResultView> get labResults {
    if (_labResults is EqualUnmodifiableListView) return _labResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labResults);
  }

  final List<DischargeReportView> _dischargeReports;
  @override
  @JsonKey()
  List<DischargeReportView> get dischargeReports {
    if (_dischargeReports is EqualUnmodifiableListView)
      return _dischargeReports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dischargeReports);
  }

  final List<AppointmentView> _appointments;
  @override
  @JsonKey()
  List<AppointmentView> get appointments {
    if (_appointments is EqualUnmodifiableListView) return _appointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appointments);
  }

  @override
  final DoseReminderModel? doseReminder;
  @override
  final CheckInToken? checkInToken;
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'PatientRecord(child: $child, diseaseOverview: $diseaseOverview, treatmentPlan: $treatmentPlan, labResults: $labResults, dischargeReports: $dischargeReports, appointments: $appointments, doseReminder: $doseReminder, checkInToken: $checkInToken, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientRecordImpl &&
            (identical(other.child, child) || other.child == child) &&
            (identical(other.diseaseOverview, diseaseOverview) ||
                other.diseaseOverview == diseaseOverview) &&
            (identical(other.treatmentPlan, treatmentPlan) ||
                other.treatmentPlan == treatmentPlan) &&
            const DeepCollectionEquality().equals(
              other._labResults,
              _labResults,
            ) &&
            const DeepCollectionEquality().equals(
              other._dischargeReports,
              _dischargeReports,
            ) &&
            const DeepCollectionEquality().equals(
              other._appointments,
              _appointments,
            ) &&
            (identical(other.doseReminder, doseReminder) ||
                other.doseReminder == doseReminder) &&
            (identical(other.checkInToken, checkInToken) ||
                other.checkInToken == checkInToken) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    child,
    diseaseOverview,
    treatmentPlan,
    const DeepCollectionEquality().hash(_labResults),
    const DeepCollectionEquality().hash(_dischargeReports),
    const DeepCollectionEquality().hash(_appointments),
    doseReminder,
    checkInToken,
    lastUpdated,
  );

  /// Create a copy of PatientRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientRecordImplCopyWith<_$PatientRecordImpl> get copyWith =>
      __$$PatientRecordImplCopyWithImpl<_$PatientRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientRecordImplToJson(this);
  }
}

abstract class _PatientRecord extends PatientRecord {
  const factory _PatientRecord({
    required final ChildSummary child,
    required final DiseaseOverview diseaseOverview,
    required final TreatmentPlanView treatmentPlan,
    final List<LabResultView> labResults,
    final List<DischargeReportView> dischargeReports,
    final List<AppointmentView> appointments,
    final DoseReminderModel? doseReminder,
    final CheckInToken? checkInToken,
    required final DateTime lastUpdated,
  }) = _$PatientRecordImpl;
  const _PatientRecord._() : super._();

  factory _PatientRecord.fromJson(Map<String, dynamic> json) =
      _$PatientRecordImpl.fromJson;

  @override
  ChildSummary get child;
  @override
  DiseaseOverview get diseaseOverview;
  @override
  TreatmentPlanView get treatmentPlan;
  @override
  List<LabResultView> get labResults;
  @override
  List<DischargeReportView> get dischargeReports;
  @override
  List<AppointmentView> get appointments;
  @override
  DoseReminderModel? get doseReminder;
  @override
  CheckInToken? get checkInToken;
  @override
  DateTime get lastUpdated;

  /// Create a copy of PatientRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientRecordImplCopyWith<_$PatientRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
