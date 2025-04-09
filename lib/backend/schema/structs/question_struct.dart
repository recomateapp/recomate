// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionStruct extends FFFirebaseStruct {
  QuestionStruct({
    String? questionTitle,
    List<String>? questionOptions,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _questionTitle = questionTitle,
        _questionOptions =
            questionOptions != null ? LoggableList(questionOptions) : null,
        super(firestoreUtilData);

  // "questionTitle" field.
  String? _questionTitle;
  String get questionTitle => _questionTitle ?? '';
  set questionTitle(String? val) {
    _questionTitle = val;
    debugLog();
  }

  bool hasQuestionTitle() => _questionTitle != null;

  // "questionOptions" field.
  LoggableList<String>? _questionOptions;
  List<String> get questionOptions =>
      (_questionOptions ?? LoggableList(const []))..logger = logger;
  set questionOptions(List<String>? val) {
    if (val != null) {
      _questionOptions = LoggableList(val);
    } else {
      _questionOptions = null;
    }
    debugLog();
  }

  void updateQuestionOptions(Function(List<String>) updateFn) {
    updateFn(_questionOptions ??= LoggableList([]));
    debugLog();
  }

  bool hasQuestionOptions() => _questionOptions != null;

  static QuestionStruct fromMap(Map<String, dynamic> data) => QuestionStruct(
        questionTitle: data['questionTitle'] as String?,
        questionOptions: getDataList(data['questionOptions']),
      );

  static QuestionStruct? maybeFromMap(dynamic data) =>
      data is Map ? QuestionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'questionTitle': _questionTitle,
        'questionOptions': _questionOptions,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'questionTitle': serializeParam(
          _questionTitle,
          ParamType.String,
        ),
        'questionOptions': serializeParam(
          _questionOptions,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static QuestionStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionStruct(
        questionTitle: deserializeParam(
          data['questionTitle'],
          ParamType.String,
          false,
        ),
        questionOptions: deserializeParam<String>(
          data['questionOptions'],
          ParamType.String,
          true,
        ),
      );
  @override
  Map<String, DebugDataField> toDebugSerializableMap() => {
        'questionTitle': debugSerializeParam(
          questionTitle,
          ParamType.String,
          name: 'String',
          nullable: false,
        ),
        'questionOptions': debugSerializeParam(
          _questionOptions,
          ParamType.String,
          isList: true,
          name: 'String',
          nullable: false,
        ),
      };

  @override
  String toString() => 'QuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionStruct &&
        questionTitle == other.questionTitle &&
        listEquality.equals(questionOptions, other.questionOptions);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([questionTitle, questionOptions]);
}

QuestionStruct createQuestionStruct({
  String? questionTitle,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuestionStruct(
      questionTitle: questionTitle,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuestionStruct? updateQuestionStruct(
  QuestionStruct? question, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    question
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuestionStructData(
  Map<String, dynamic> firestoreData,
  QuestionStruct? question,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (question == null) {
    return;
  }
  if (question.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && question.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final questionData = getQuestionFirestoreData(question, forFieldValue);
  final nestedData = questionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = question.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuestionFirestoreData(
  QuestionStruct? question, [
  bool forFieldValue = false,
]) {
  if (question == null) {
    return {};
  }
  final firestoreData = mapToFirestore(question.toMap());

  // Add any Firestore field values
  question.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuestionListFirestoreData(
  List<QuestionStruct>? questions,
) =>
    questions?.map((e) => getQuestionFirestoreData(e, true)).toList() ?? [];
