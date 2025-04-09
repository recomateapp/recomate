import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'recommend_ai_movies_result_widget.dart'
    show RecommendAiMoviesResultWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecommendAiMoviesResultModel
    extends FlutterFlowModel<RecommendAiMoviesResultWidget> {
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
          'aiRespData': debugSerializeParam(
            widget?.aiRespData,
            ParamType.JSON,
            isList: true,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_movies_result',
            searchReference:
                'reference=Sh4KFAoKYWlSZXNwRGF0YRIGemIyamozcgYSAggJIABQAVoKYWlSZXNwRGF0YQ==',
            name: 'dynamic',
            nullable: true,
          ),
          'test': debugSerializeParam(
            widget?.test,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_movies_result',
            searchReference:
                'reference=Sh4KDgoEdGVzdBIGbXlqaWxpKgYSBHRlc3RyBAgDIABQAVoEdGVzdA==',
            name: 'String',
            nullable: false,
          )
        }.withoutNulls,
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
            'https://app.flutterflow.io/project/recomate-w5oj9e/tab=uiBuilder&page=recommend_ai_movies_result',
        searchReference:
            'reference=OhpyZWNvbW1lbmRfYWlfbW92aWVzX3Jlc3VsdFABWhpyZWNvbW1lbmRfYWlfbW92aWVzX3Jlc3VsdA==',
        widgetClassName: 'recommend_ai_movies_result',
      );
}
