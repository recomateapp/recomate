import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionRecord extends FirestoreRecord {
  QuestionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "questionCategory" field.
  String? _questionCategory;
  String get questionCategory => _questionCategory ?? '';
  bool hasQuestionCategory() => _questionCategory != null;

  // "question" field.
  List<QuestionStruct>? _question;
  List<QuestionStruct> get question => _question ?? const [];
  bool hasQuestion() => _question != null;

  void _initializeFields() {
    _questionCategory = snapshotData['questionCategory'] as String?;
    _question = getStructList(
      snapshotData['question'],
      QuestionStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Question');

  static Stream<QuestionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionRecord.fromSnapshot(s));

  static Future<QuestionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionRecord.fromSnapshot(s));

  static QuestionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionRecord &&
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
        'questionCategory': debugSerializeParam(
          questionCategory,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=database',
          name: 'String',
          nullable: false,
        ),
        'question': debugSerializeParam(
          question,
          ParamType.DataStruct,
          isList: true,
          link:
              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=database',
          name: 'question',
          nullable: false,
        )
      };
}

Map<String, dynamic> createQuestionRecordData({
  String? questionCategory,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'questionCategory': questionCategory,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionRecordDocumentEquality implements Equality<QuestionRecord> {
  const QuestionRecordDocumentEquality();

  @override
  bool equals(QuestionRecord? e1, QuestionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.questionCategory == e2?.questionCategory &&
        listEquality.equals(e1?.question, e2?.question);
  }

  @override
  int hash(QuestionRecord? e) =>
      const ListEquality().hash([e?.questionCategory, e?.question]);

  @override
  bool isValidKey(Object? o) => o is QuestionRecord;
}
