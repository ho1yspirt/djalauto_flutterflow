// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CalendarRecord> _$calendarRecordSerializer =
    new _$CalendarRecordSerializer();

class _$CalendarRecordSerializer
    implements StructuredSerializer<CalendarRecord> {
  @override
  final Iterable<Type> types = const [CalendarRecord, _$CalendarRecord];
  @override
  final String wireName = 'CalendarRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CalendarRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.timeCreated;
    if (value != null) {
      result
        ..add('time_created')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userAssign;
    if (value != null) {
      result
        ..add('user_assign')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.isDone;
    if (value != null) {
      result
        ..add('is_done')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.teacherAssign;
    if (value != null) {
      result
        ..add('teacher_assign')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.timeStart;
    if (value != null) {
      result
        ..add('time_start')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.timeEnd;
    if (value != null) {
      result
        ..add('time_end')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.teachername;
    if (value != null) {
      result
        ..add('teachername')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  CalendarRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CalendarRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'time_created':
          result.timeCreated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'user_assign':
          result.userAssign = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'is_done':
          result.isDone = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'teacher_assign':
          result.teacherAssign = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'time_start':
          result.timeStart = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'time_end':
          result.timeEnd = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'teachername':
          result.teachername = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$CalendarRecord extends CalendarRecord {
  @override
  final String? description;
  @override
  final DateTime? timeCreated;
  @override
  final DocumentReference<Object?>? userAssign;
  @override
  final bool? isDone;
  @override
  final DocumentReference<Object?>? teacherAssign;
  @override
  final DateTime? timeStart;
  @override
  final DateTime? timeEnd;
  @override
  final String? username;
  @override
  final String? teachername;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CalendarRecord([void Function(CalendarRecordBuilder)? updates]) =>
      (new CalendarRecordBuilder()..update(updates))._build();

  _$CalendarRecord._(
      {this.description,
      this.timeCreated,
      this.userAssign,
      this.isDone,
      this.teacherAssign,
      this.timeStart,
      this.timeEnd,
      this.username,
      this.teachername,
      this.ffRef})
      : super._();

  @override
  CalendarRecord rebuild(void Function(CalendarRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CalendarRecordBuilder toBuilder() =>
      new CalendarRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CalendarRecord &&
        description == other.description &&
        timeCreated == other.timeCreated &&
        userAssign == other.userAssign &&
        isDone == other.isDone &&
        teacherAssign == other.teacherAssign &&
        timeStart == other.timeStart &&
        timeEnd == other.timeEnd &&
        username == other.username &&
        teachername == other.teachername &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, description.hashCode),
                                        timeCreated.hashCode),
                                    userAssign.hashCode),
                                isDone.hashCode),
                            teacherAssign.hashCode),
                        timeStart.hashCode),
                    timeEnd.hashCode),
                username.hashCode),
            teachername.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CalendarRecord')
          ..add('description', description)
          ..add('timeCreated', timeCreated)
          ..add('userAssign', userAssign)
          ..add('isDone', isDone)
          ..add('teacherAssign', teacherAssign)
          ..add('timeStart', timeStart)
          ..add('timeEnd', timeEnd)
          ..add('username', username)
          ..add('teachername', teachername)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CalendarRecordBuilder
    implements Builder<CalendarRecord, CalendarRecordBuilder> {
  _$CalendarRecord? _$v;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _timeCreated;
  DateTime? get timeCreated => _$this._timeCreated;
  set timeCreated(DateTime? timeCreated) => _$this._timeCreated = timeCreated;

  DocumentReference<Object?>? _userAssign;
  DocumentReference<Object?>? get userAssign => _$this._userAssign;
  set userAssign(DocumentReference<Object?>? userAssign) =>
      _$this._userAssign = userAssign;

  bool? _isDone;
  bool? get isDone => _$this._isDone;
  set isDone(bool? isDone) => _$this._isDone = isDone;

  DocumentReference<Object?>? _teacherAssign;
  DocumentReference<Object?>? get teacherAssign => _$this._teacherAssign;
  set teacherAssign(DocumentReference<Object?>? teacherAssign) =>
      _$this._teacherAssign = teacherAssign;

  DateTime? _timeStart;
  DateTime? get timeStart => _$this._timeStart;
  set timeStart(DateTime? timeStart) => _$this._timeStart = timeStart;

  DateTime? _timeEnd;
  DateTime? get timeEnd => _$this._timeEnd;
  set timeEnd(DateTime? timeEnd) => _$this._timeEnd = timeEnd;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _teachername;
  String? get teachername => _$this._teachername;
  set teachername(String? teachername) => _$this._teachername = teachername;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CalendarRecordBuilder() {
    CalendarRecord._initializeBuilder(this);
  }

  CalendarRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _description = $v.description;
      _timeCreated = $v.timeCreated;
      _userAssign = $v.userAssign;
      _isDone = $v.isDone;
      _teacherAssign = $v.teacherAssign;
      _timeStart = $v.timeStart;
      _timeEnd = $v.timeEnd;
      _username = $v.username;
      _teachername = $v.teachername;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CalendarRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CalendarRecord;
  }

  @override
  void update(void Function(CalendarRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CalendarRecord build() => _build();

  _$CalendarRecord _build() {
    final _$result = _$v ??
        new _$CalendarRecord._(
            description: description,
            timeCreated: timeCreated,
            userAssign: userAssign,
            isDone: isDone,
            teacherAssign: teacherAssign,
            timeStart: timeStart,
            timeEnd: timeEnd,
            username: username,
            teachername: teachername,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
