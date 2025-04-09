import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _fetchedActivityQuestions = LoggableList(
        prefs
                .getStringList('ff_fetchedActivityQuestions')
                ?.map((x) {
                  try {
                    return QuestionStruct.fromSerializableMap(jsonDecode(x));
                  } catch (e) {
                    print("Can't decode persisted data type. Error: $e.");
                    return null;
                  }
                })
                .withoutNulls
                .toList() ??
            _fetchedActivityQuestions,
      );
    });
    _safeInit(() {
      _fetchedFoodQuestions = LoggableList(
        prefs
                .getStringList('ff_fetchedFoodQuestions')
                ?.map((x) {
                  try {
                    return QuestionStruct.fromSerializableMap(jsonDecode(x));
                  } catch (e) {
                    print("Can't decode persisted data type. Error: $e.");
                    return null;
                  }
                })
                .withoutNulls
                .toList() ??
            _fetchedFoodQuestions,
      );
    });
    _safeInit(() {
      _fetchedMovieQuestions = LoggableList(
        prefs
                .getStringList('ff_fetchedMovieQuestions')
                ?.map((x) {
                  try {
                    return QuestionStruct.fromSerializableMap(jsonDecode(x));
                  } catch (e) {
                    print("Can't decode persisted data type. Error: $e.");
                    return null;
                  }
                })
                .withoutNulls
                .toList() ??
            _fetchedMovieQuestions,
      );
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  late LoggableList<dynamic> _activityQuestions = LoggableList([
    jsonDecode(
        '{\"question\":\"What is your mood or energy level right now?\",\"options\":[\"Relaxing\",\"Energizing\",\"Stimulating\"]}'),
    jsonDecode(
        '{\"question\":\"Are you looking for something indoors or outdoors?\",\"options\":[\"Indoor\",\"Outdoor\"]}')
  ]);
  List<dynamic> get activityQuestions =>
      _activityQuestions?..logger = () => debugLogAppState(this);
  set activityQuestions(List<dynamic> value) {
    if (value != null) {
      _activityQuestions = LoggableList(value);
    }

    debugLogAppState(this);
  }

  void addToActivityQuestions(dynamic value) {
    activityQuestions.add(value);
  }

  void removeFromActivityQuestions(dynamic value) {
    activityQuestions.remove(value);
  }

  void removeAtIndexFromActivityQuestions(int index) {
    activityQuestions.removeAt(index);
  }

  void updateActivityQuestionsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    activityQuestions[index] = updateFn(_activityQuestions[index]);
  }

  void insertAtIndexInActivityQuestions(int index, dynamic value) {
    activityQuestions.insert(index, value);
  }

  late LoggableList<QuestionStruct> _fetchedActivityQuestions =
      LoggableList([]);
  List<QuestionStruct> get fetchedActivityQuestions =>
      _fetchedActivityQuestions?..logger = () => debugLogAppState(this);
  set fetchedActivityQuestions(List<QuestionStruct> value) {
    if (value != null) {
      _fetchedActivityQuestions = LoggableList(value);
    }

    prefs.setStringList('ff_fetchedActivityQuestions',
        value.map((x) => x.serialize()).toList());
    debugLogAppState(this);
  }

  void addToFetchedActivityQuestions(QuestionStruct value) {
    fetchedActivityQuestions.add(value);
    prefs.setStringList('ff_fetchedActivityQuestions',
        _fetchedActivityQuestions.map((x) => x.serialize()).toList());
  }

  void removeFromFetchedActivityQuestions(QuestionStruct value) {
    fetchedActivityQuestions.remove(value);
    prefs.setStringList('ff_fetchedActivityQuestions',
        _fetchedActivityQuestions.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFetchedActivityQuestions(int index) {
    fetchedActivityQuestions.removeAt(index);
    prefs.setStringList('ff_fetchedActivityQuestions',
        _fetchedActivityQuestions.map((x) => x.serialize()).toList());
  }

  void updateFetchedActivityQuestionsAtIndex(
    int index,
    QuestionStruct Function(QuestionStruct) updateFn,
  ) {
    fetchedActivityQuestions[index] =
        updateFn(_fetchedActivityQuestions[index]);
    prefs.setStringList('ff_fetchedActivityQuestions',
        _fetchedActivityQuestions.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFetchedActivityQuestions(
      int index, QuestionStruct value) {
    fetchedActivityQuestions.insert(index, value);
    prefs.setStringList('ff_fetchedActivityQuestions',
        _fetchedActivityQuestions.map((x) => x.serialize()).toList());
  }

  late LoggableList<QuestionStruct> _fetchedFoodQuestions = LoggableList([]);
  List<QuestionStruct> get fetchedFoodQuestions =>
      _fetchedFoodQuestions?..logger = () => debugLogAppState(this);
  set fetchedFoodQuestions(List<QuestionStruct> value) {
    if (value != null) {
      _fetchedFoodQuestions = LoggableList(value);
    }

    prefs.setStringList(
        'ff_fetchedFoodQuestions', value.map((x) => x.serialize()).toList());
    debugLogAppState(this);
  }

  void addToFetchedFoodQuestions(QuestionStruct value) {
    fetchedFoodQuestions.add(value);
    prefs.setStringList('ff_fetchedFoodQuestions',
        _fetchedFoodQuestions.map((x) => x.serialize()).toList());
  }

  void removeFromFetchedFoodQuestions(QuestionStruct value) {
    fetchedFoodQuestions.remove(value);
    prefs.setStringList('ff_fetchedFoodQuestions',
        _fetchedFoodQuestions.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFetchedFoodQuestions(int index) {
    fetchedFoodQuestions.removeAt(index);
    prefs.setStringList('ff_fetchedFoodQuestions',
        _fetchedFoodQuestions.map((x) => x.serialize()).toList());
  }

  void updateFetchedFoodQuestionsAtIndex(
    int index,
    QuestionStruct Function(QuestionStruct) updateFn,
  ) {
    fetchedFoodQuestions[index] = updateFn(_fetchedFoodQuestions[index]);
    prefs.setStringList('ff_fetchedFoodQuestions',
        _fetchedFoodQuestions.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFetchedFoodQuestions(int index, QuestionStruct value) {
    fetchedFoodQuestions.insert(index, value);
    prefs.setStringList('ff_fetchedFoodQuestions',
        _fetchedFoodQuestions.map((x) => x.serialize()).toList());
  }

  late LoggableList<QuestionStruct> _fetchedMovieQuestions = LoggableList([]);
  List<QuestionStruct> get fetchedMovieQuestions =>
      _fetchedMovieQuestions?..logger = () => debugLogAppState(this);
  set fetchedMovieQuestions(List<QuestionStruct> value) {
    if (value != null) {
      _fetchedMovieQuestions = LoggableList(value);
    }

    prefs.setStringList(
        'ff_fetchedMovieQuestions', value.map((x) => x.serialize()).toList());
    debugLogAppState(this);
  }

  void addToFetchedMovieQuestions(QuestionStruct value) {
    fetchedMovieQuestions.add(value);
    prefs.setStringList('ff_fetchedMovieQuestions',
        _fetchedMovieQuestions.map((x) => x.serialize()).toList());
  }

  void removeFromFetchedMovieQuestions(QuestionStruct value) {
    fetchedMovieQuestions.remove(value);
    prefs.setStringList('ff_fetchedMovieQuestions',
        _fetchedMovieQuestions.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFetchedMovieQuestions(int index) {
    fetchedMovieQuestions.removeAt(index);
    prefs.setStringList('ff_fetchedMovieQuestions',
        _fetchedMovieQuestions.map((x) => x.serialize()).toList());
  }

  void updateFetchedMovieQuestionsAtIndex(
    int index,
    QuestionStruct Function(QuestionStruct) updateFn,
  ) {
    fetchedMovieQuestions[index] = updateFn(_fetchedMovieQuestions[index]);
    prefs.setStringList('ff_fetchedMovieQuestions',
        _fetchedMovieQuestions.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFetchedMovieQuestions(int index, QuestionStruct value) {
    fetchedMovieQuestions.insert(index, value);
    prefs.setStringList('ff_fetchedMovieQuestions',
        _fetchedMovieQuestions.map((x) => x.serialize()).toList());
  }

  Map<String, DebugDataField> toDebugSerializableMap() => {
        'activityQuestions': debugSerializeParam(
          activityQuestions,
          ParamType.JSON,
          isList: true,
          link:
              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CiUKHQoRYWN0aXZpdHlRdWVzdGlvbnMSCDh4ZmY1aGg3cgQSAggJWhFhY3Rpdml0eVF1ZXN0aW9ucw==',
          name: 'dynamic',
          nullable: false,
        ),
        'fetchedActivityQuestions': debugSerializeParam(
          fetchedActivityQuestions,
          ParamType.DataStruct,
          isList: true,
          link:
              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=CkEKJAoYZmV0Y2hlZEFjdGl2aXR5UXVlc3Rpb25zEgg3dTdncnkxaXIZEgIIFCoTEhEKCHF1ZXN0aW9uEgVreDZ6MVoYZmV0Y2hlZEFjdGl2aXR5UXVlc3Rpb25z',
          name: 'question',
          nullable: false,
        ),
        'fetchedFoodQuestions': debugSerializeParam(
          fetchedFoodQuestions,
          ParamType.DataStruct,
          isList: true,
          link:
              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Cj0KIAoUZmV0Y2hlZEZvb2RRdWVzdGlvbnMSCHJibmd5NDlzchkSAggUKhMSEQoIcXVlc3Rpb24SBWt4NnoxWhRmZXRjaGVkRm9vZFF1ZXN0aW9ucw==',
          name: 'question',
          nullable: false,
        ),
        'fetchedMovieQuestions': debugSerializeParam(
          fetchedMovieQuestions,
          ParamType.DataStruct,
          isList: true,
          link:
              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=appValues&appValuesTab=state',
          searchReference:
              'reference=Cj4KIQoVZmV0Y2hlZE1vdmllUXVlc3Rpb25zEgg3azd6Y29tanIZEgIIFCoTEhEKCHF1ZXN0aW9uEgVreDZ6MVoVZmV0Y2hlZE1vdmllUXVlc3Rpb25z',
          name: 'question',
          nullable: false,
        )
      };
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
