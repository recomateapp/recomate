import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserAiHistoryRecord extends FirestoreRecord {
  UserAiHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "categoryTitle" field.
  String? _categoryTitle;
  String get categoryTitle => _categoryTitle ?? '';
  bool hasCategoryTitle() => _categoryTitle != null;

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "aiResponse" field.
  String? _aiResponse;
  String get aiResponse => _aiResponse ?? '';
  bool hasAiResponse() => _aiResponse != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _categoryTitle = snapshotData['categoryTitle'] as String?;
    _userId = snapshotData['userId'] as DocumentReference?;
    _aiResponse = snapshotData['aiResponse'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userAiHistory');

  static Stream<UserAiHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserAiHistoryRecord.fromSnapshot(s));

  static Future<UserAiHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserAiHistoryRecord.fromSnapshot(s));

  static UserAiHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserAiHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserAiHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserAiHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserAiHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserAiHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;

  @override
  Map<String, DebugDataField> toDebugSerializableMap() => {
        'reference': debugSerializeParam(
          reference,
          ParamType.DocumentReference,
          link:
              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=database',
          name: '',
          nullable: false,
        ),
        'categoryTitle': debugSerializeParam(
          categoryTitle,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=database',
          name: 'String',
          nullable: false,
        ),
        'userId': debugSerializeParam(
          userId,
          ParamType.DocumentReference,
          link:
              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=database',
          name: 'user',
          nullable: true,
        ),
        'aiResponse': debugSerializeParam(
          aiResponse,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=database',
          name: 'String',
          nullable: false,
        ),
        'createdAt': debugSerializeParam(
          createdAt,
          ParamType.DateTime,
          link:
              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=database',
          name: 'DateTime',
          nullable: true,
        )
      };
}

Map<String, dynamic> createUserAiHistoryRecordData({
  String? categoryTitle,
  DocumentReference? userId,
  String? aiResponse,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'categoryTitle': categoryTitle,
      'userId': userId,
      'aiResponse': aiResponse,
      'createdAt': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserAiHistoryRecordDocumentEquality
    implements Equality<UserAiHistoryRecord> {
  const UserAiHistoryRecordDocumentEquality();

  @override
  bool equals(UserAiHistoryRecord? e1, UserAiHistoryRecord? e2) {
    return e1?.categoryTitle == e2?.categoryTitle &&
        e1?.userId == e2?.userId &&
        e1?.aiResponse == e2?.aiResponse &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(UserAiHistoryRecord? e) => const ListEquality()
      .hash([e?.categoryTitle, e?.userId, e?.aiResponse, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is UserAiHistoryRecord;
}
