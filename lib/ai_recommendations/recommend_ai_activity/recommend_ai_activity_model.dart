import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/back_icon_button_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'recommend_ai_activity_widget.dart' show RecommendAiActivityWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class RecommendAiActivityModel
    extends FlutterFlowModel<RecommendAiActivityWidget> {
  ///  Local state fields for this page.

  int _currentQuestionIndex = 0;
  set currentQuestionIndex(int value) {
    _currentQuestionIndex = value;
    debugLogWidgetClass(this);
  }

  int get currentQuestionIndex => _currentQuestionIndex;

  late LoggableList<dynamic> _userResponses = LoggableList([]);
  set userResponses(List<dynamic> value) {
    if (value != null) {
      _userResponses = LoggableList(value);
    }

    debugLogWidgetClass(this);
  }

  List<dynamic> get userResponses =>
      _userResponses?..logger = () => debugLogWidgetClass(this);
  void addToUserResponses(dynamic item) => userResponses.add(item);
  void removeFromUserResponses(dynamic item) => userResponses.remove(item);
  void removeAtIndexFromUserResponses(int index) =>
      userResponses.removeAt(index);
  void insertAtIndexInUserResponses(int index, dynamic item) =>
      userResponses.insert(index, item);
  void updateUserResponsesAtIndex(int index, Function(dynamic) updateFn) =>
      userResponses[index] = updateFn(userResponses[index]);

  bool _aiLoading = false;
  set aiLoading(bool value) {
    _aiLoading = value;
    debugLogWidgetClass(this);
  }

  bool get aiLoading => _aiLoading;

  ///  State fields for stateful widgets in this page.

  // State field(s) for mainList widget.
  ScrollController? mainList;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) {
    choiceChipsValueController?.value = val;
    debugLogWidgetClass(this);
  }

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Stores action output result for [Backend Call - API (chatCompletion)] action in Image widget.
  ApiCallResponse? _aiResp;
  set aiResp(ApiCallResponse? value) {
    _aiResp = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get aiResp => _aiResp;

  // Stores action output result for [Backend Call - Create Document] action in Image widget.
  UserAiHistoryRecord? _historyResp;
  set historyResp(UserAiHistoryRecord? value) {
    _historyResp = value;
    debugLogWidgetClass(this);
  }

  UserAiHistoryRecord? get historyResp => _historyResp;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    mainList = ScrollController();
    listViewController = ScrollController();

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    mainList?.dispose();
    listViewController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'currentQuestionIndex': debugSerializeParam(
            currentQuestionIndex,
            ParamType.int,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_activity',
            searchReference:
                'reference=QiUKHQoUY3VycmVudFF1ZXN0aW9uSW5kZXgSBTg0Ymh2cgQIASABUAFaFGN1cnJlbnRRdWVzdGlvbkluZGV4YhVyZWNvbW1lbmRfYWlfYWN0aXZpdHk=',
            name: 'int',
            nullable: false,
          ),
          'userResponses': debugSerializeParam(
            userResponses,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_activity',
            searchReference:
                'reference=Qh4KFgoNdXNlclJlc3BvbnNlcxIFaGNiYjNyBBICCAlQAVoNdXNlclJlc3BvbnNlc2IVcmVjb21tZW5kX2FpX2FjdGl2aXR5',
            name: 'dynamic',
            nullable: false,
          ),
          'aiLoading': debugSerializeParam(
            aiLoading,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_activity',
            searchReference:
                'reference=QiMKEgoJYWlMb2FkaW5nEgU5ZXllNioHEgVmYWxzZXIECAUgAVABWglhaUxvYWRpbmdiFXJlY29tbWVuZF9haV9hY3Rpdml0eQ==',
            name: 'bool',
            nullable: false,
          )
        },
        widgetStates: {
          'choiceChipsValues': debugSerializeParam(
            choiceChipsValues,
            ParamType.String,
            isList: true,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_activity',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'aiResp': debugSerializeParam(
            aiResp,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_activity',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'historyResp': debugSerializeParam(
            historyResp,
            ParamType.Document,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_activity',
            name: 'userAiHistory',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/recomate-w5oj9e/tab=uiBuilder&page=recommend_ai_activity',
        searchReference:
            'reference=OhVyZWNvbW1lbmRfYWlfYWN0aXZpdHlQAVoVcmVjb21tZW5kX2FpX2FjdGl2aXR5',
        widgetClassName: 'recommend_ai_activity',
      );
}
