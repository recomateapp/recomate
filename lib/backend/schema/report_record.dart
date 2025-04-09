import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportRecord extends FirestoreRecord {
  ReportRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  bool hasFeedback() => _feedback != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _feedback = snapshotData['feedback'] as String?;
    _image = snapshotData['image'] as String?;
    _video = snapshotData['video'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('report');

  static Stream<ReportRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportRecord.fromSnapshot(s));

  static Future<ReportRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportRecord.fromSnapshot(s));

  static ReportRecord fromSnapshot(DocumentSnapshot snapshot) => ReportRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportRecord &&
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
        'email': debugSerializeParam(
          email,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=database',
          name: 'String',
          nullable: false,
        ),
        'feedback': debugSerializeParam(
          feedback,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=database',
          name: 'String',
          nullable: false,
        ),
        'image': debugSerializeParam(
          image,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=database',
          name: 'String',
          nullable: false,
        ),
        'video': debugSerializeParam(
          video,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=database',
          name: 'String',
          nullable: false,
        ),
        'user': debugSerializeParam(
          user,
          ParamType.DocumentReference,
          link:
              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=database',
          name: 'user',
          nullable: true,
        )
      };
}

Map<String, dynamic> createReportRecordData({
  String? email,
  String? feedback,
  String? image,
  String? video,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'feedback': feedback,
      'image': image,
      'video': video,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportRecordDocumentEquality implements Equality<ReportRecord> {
  const ReportRecordDocumentEquality();

  @override
  bool equals(ReportRecord? e1, ReportRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.feedback == e2?.feedback &&
        e1?.image == e2?.image &&
        e1?.video == e2?.video &&
        e1?.user == e2?.user;
  }

  @override
  int hash(ReportRecord? e) => const ListEquality()
      .hash([e?.email, e?.feedback, e?.image, e?.video, e?.user]);

  @override
  bool isValidKey(Object? o) => o is ReportRecord;
}
