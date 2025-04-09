import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'recommend_ai_past_resoponse_results_widget.dart'
    show RecommendAiPastResoponseResultsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecommendAiPastResoponseResultsModel
    extends FlutterFlowModel<RecommendAiPastResoponseResultsWidget> {
  ///  Local state fields for this page.

  late LoggableList<dynamic> _aiResponse = LoggableList([]);
  set aiResponse(List<dynamic> value) {
    if (value != null) {
      _aiResponse = LoggableList(value);
    }

    debugLogWidgetClass(this);
  }

  List<dynamic> get aiResponse =>
      _aiResponse?..logger = () => debugLogWidgetClass(this);
  void addToAiResponse(dynamic item) => aiResponse.add(item);
  void removeFromAiResponse(dynamic item) => aiResponse.remove(item);
  void removeAtIndexFromAiResponse(int index) => aiResponse.removeAt(index);
  void insertAtIndexInAiResponse(int index, dynamic item) =>
      aiResponse.insert(index, item);
  void updateAiResponseAtIndex(int index, Function(dynamic) updateFn) =>
      aiResponse[index] = updateFn(aiResponse[index]);

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {}

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetParameters: {
          'test': debugSerializeParam(
            widget?.test,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_past_resoponse_results',
            searchReference:
                'reference=Sh4KDgoEdGVzdBIGbXlqaWxpKgYSBHRlc3RyBAgDIABQAVoEdGVzdA==',
            name: 'String',
            nullable: false,
          ),
          'pageTitle': debugSerializeParam(
            widget?.pageTitle,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_past_resoponse_results',
            searchReference:
                'reference=SioKEwoJcGFnZVRpdGxlEgZmNXk4cHQqDRILQUkgUmVzcG9uc2VyBAgDIABQAVoJcGFnZVRpdGxl',
            name: 'String',
            nullable: false,
          )
        }.withoutNulls,
        localStates: {
          'aiResponse': debugSerializeParam(
            aiResponse,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_past_resoponse_results',
            searchReference:
                'reference=QhsKEwoKYWlSZXNwb25zZRIFY3poeHVyBBICCAlQAVoKYWlSZXNwb25zZWIjcmVjb21tZW5kX2FpX3Bhc3RfcmVzb3BvbnNlX3Jlc3VsdHM=',
            name: 'dynamic',
            nullable: false,
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
            'https://app.flutterflow.io/project/recomate-w5oj9e/tab=uiBuilder&page=recommend_ai_past_resoponse_results',
        searchReference:
            'reference=OiNyZWNvbW1lbmRfYWlfcGFzdF9yZXNvcG9uc2VfcmVzdWx0c1ABWiNyZWNvbW1lbmRfYWlfcGFzdF9yZXNvcG9uc2VfcmVzdWx0cw==',
        widgetClassName: 'recommend_ai_past_resoponse_results',
      );
}
