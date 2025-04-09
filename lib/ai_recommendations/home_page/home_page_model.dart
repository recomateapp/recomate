import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String _location = 'nil';
  set location(String value) {
    _location = value;
    debugLogWidgetClass(this);
  }

  String get location => _location;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GeoCodeReverse)] action in home_page widget.
  ApiCallResponse? _locationResp;
  set locationResp(ApiCallResponse? value) {
    _locationResp = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get locationResp => _locationResp;

  // Stores action output result for [Firestore Query - Query a collection] action in home_page widget.
  QuestionRecord? _activityResp;
  set activityResp(QuestionRecord? value) {
    _activityResp = value;
    debugLogWidgetClass(this);
  }

  QuestionRecord? get activityResp => _activityResp;

  // Stores action output result for [Firestore Query - Query a collection] action in home_page widget.
  QuestionRecord? _foodResp;
  set foodResp(QuestionRecord? value) {
    _foodResp = value;
    debugLogWidgetClass(this);
  }

  QuestionRecord? get foodResp => _foodResp;

  // Stores action output result for [Firestore Query - Query a collection] action in home_page widget.
  QuestionRecord? _movieResp;
  set movieResp(QuestionRecord? value) {
    _movieResp = value;
    debugLogWidgetClass(this);
  }

  QuestionRecord? get movieResp => _movieResp;

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
        localStates: {
          'location': debugSerializeParam(
            location,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=home_page',
            searchReference:
                'reference=Qh0KEQoIbG9jYXRpb24SBTA1MzlpKgISAHIECAMgAVABWghsb2NhdGlvbmIJaG9tZV9wYWdl',
            name: 'String',
            nullable: false,
          )
        },
        actionOutputs: {
          'locationResp': debugSerializeParam(
            locationResp,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=home_page',
            name: 'ApiCallResponse',
            nullable: true,
          ),
          'activityResp': debugSerializeParam(
            activityResp,
            ParamType.Document,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=home_page',
            name: 'Question',
            nullable: true,
          ),
          'foodResp': debugSerializeParam(
            foodResp,
            ParamType.Document,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=home_page',
            name: 'Question',
            nullable: true,
          ),
          'movieResp': debugSerializeParam(
            movieResp,
            ParamType.Document,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=home_page',
            name: 'Question',
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
            'https://app.flutterflow.io/project/recomate-w5oj9e/tab=uiBuilder&page=home_page',
        searchReference: 'reference=Oglob21lX3BhZ2VQAVoJaG9tZV9wYWdl',
        widgetClassName: 'home_page',
      );
}
