import '/auth/firebase_auth/auth_util.dart';
import '/components/back_icon_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'forget_password_screen_widget.dart' show ForgetPasswordScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreenModel
    extends FlutterFlowModel<ForgetPasswordScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for back_icon_button component.
  late BackIconButtonModel backIconButtonModel;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    backIconButtonModel = createModel(context, () => BackIconButtonModel());

    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    backIconButtonModel.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        widgetStates: {
          'emailText': debugSerializeParam(
            emailTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=forget_password_screen',
            name: 'String',
            nullable: true,
          )
        },
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          'backIconButtonModel (back_icon_button)':
              backIconButtonModel?.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/recomate-w5oj9e/tab=uiBuilder&page=forget_password_screen',
        searchReference:
            'reference=OhZmb3JnZXRfcGFzc3dvcmRfc2NyZWVuUAFaFmZvcmdldF9wYXNzd29yZF9zY3JlZW4=',
        widgetClassName: 'forget_password_screen',
      );
}
