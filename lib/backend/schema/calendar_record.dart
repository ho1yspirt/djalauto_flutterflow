import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'calendar_record.g.dart';

abstract class CalendarRecord
    implements Built<CalendarRecord, CalendarRecordBuilder> {
  static Serializer<CalendarRecord> get serializer =>
      _$calendarRecordSerializer;

  String? get description;

  @BuiltValueField(wireName: 'time_created')
  DateTime? get timeCreated;

  @BuiltValueField(wireName: 'user_assign')
  DocumentReference? get userAssign;

  @BuiltValueField(wireName: 'is_done')
  bool? get isDone;

  @BuiltValueField(wireName: 'teacher_assign')
  DocumentReference? get teacherAssign;

  @BuiltValueField(wireName: 'time_start')
  DateTime? get timeStart;

  @BuiltValueField(wireName: 'time_end')
  DateTime? get timeEnd;

  String? get username;

  String? get teachername;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CalendarRecordBuilder builder) => builder
    ..description = ''
    ..isDone = false
    ..username = ''
    ..teachername = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('calendar');

  static Stream<CalendarRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CalendarRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CalendarRecord._();
  factory CalendarRecord([void Function(CalendarRecordBuilder) updates]) =
      _$CalendarRecord;

  static CalendarRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCalendarRecordData({
  String? description,
  DateTime? timeCreated,
  DocumentReference? userAssign,
  bool? isDone,
  DocumentReference? teacherAssign,
  DateTime? timeStart,
  DateTime? timeEnd,
  String? username,
  String? teachername,
}) {
  final firestoreData = serializers.toFirestore(
    CalendarRecord.serializer,
    CalendarRecord(
      (c) => c
        ..description = description
        ..timeCreated = timeCreated
        ..userAssign = userAssign
        ..isDone = isDone
        ..teacherAssign = teacherAssign
        ..timeStart = timeStart
        ..timeEnd = timeEnd
        ..username = username
        ..teachername = teachername,
    ),
  );

  return firestoreData;
}
