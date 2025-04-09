import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'report_problem_widget.dart' show ReportProblemWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportProblemModel extends FlutterFlowModel<ReportProblemWidget> {
  ///  Local state fields for this page.

  bool? _imageUploaded = false;
  set imageUploaded(bool? value) {
    _imageUploaded = value;
    debugLogWidgetClass(this);
  }

  bool? get imageUploaded => _imageUploaded;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for feedback widget.
  FocusNode? feedbackFocusNode;
  TextEditingController? feedbackTextController;
  String? Function(BuildContext, String?)? feedbackTextControllerValidator;
  String? _feedbackTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Validate Form] action in Button widget.
  bool? _formValidation;
  set formValidation(bool? value) {
    _formValidation = value;
    debugLogWidgetClass(this);
  }

  bool? get formValidation => _formValidation;

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ReportRecord? _reportFeedbackResp;
  set reportFeedbackResp(ReportRecord? value) {
    _reportFeedbackResp = value;
    debugLogWidgetClass(this);
  }

  ReportRecord? get reportFeedbackResp => _reportFeedbackResp;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    feedbackTextControllerValidator = _feedbackTextControllerValidator;

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    feedbackFocusNode?.dispose();
    feedbackTextController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'imageUploaded': debugSerializeParam(
            imageUploaded,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=report_problem',
            searchReference:
                'reference=QicKFgoNaW1hZ2VVcGxvYWRlZBIFdTJ4MGIqBxIFZmFsc2VyBAgFIABQAVoNaW1hZ2VVcGxvYWRlZGIOcmVwb3J0X3Byb2JsZW0=',
            name: 'bool',
            nullable: true,
          )
        },
        widgetStates: {
          'emailText': debugSerializeParam(
            emailTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=report_problem',
            name: 'String',
            nullable: true,
          ),
          'feedbackText': debugSerializeParam(
            feedbackTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=report_problem',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'formValidation': debugSerializeParam(
            formValidation,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=report_problem',
            name: 'bool',
            nullable: true,
          ),
          'reportFeedbackResp': debugSerializeParam(
            reportFeedbackResp,
            ParamType.Document,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=report_problem',
            name: 'report',
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
            'https://app.flutterflow.io/project/recomate-w5oj9e/tab=uiBuilder&page=report_problem',
        searchReference:
            'reference=Og5yZXBvcnRfcHJvYmxlbVABWg5yZXBvcnRfcHJvYmxlbQ==',
        widgetClassName: 'report_problem',
      );
}
