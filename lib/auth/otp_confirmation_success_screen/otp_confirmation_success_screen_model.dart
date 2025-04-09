import '/components/back_icon_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'otp_confirmation_success_screen_widget.dart'
    show OtpConfirmationSuccessScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OtpConfirmationSuccessScreenModel
    extends FlutterFlowModel<OtpConfirmationSuccessScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for back_icon_button component.
  late BackIconButtonModel backIconButtonModel;

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
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
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
            'https://app.flutterflow.io/project/recomate-w5oj9e/tab=uiBuilder&page=otp_confirmation_success_screen',
        searchReference:
            'reference=Oh9vdHBfY29uZmlybWF0aW9uX3N1Y2Nlc3Nfc2NyZWVuUAFaH290cF9jb25maXJtYXRpb25fc3VjY2Vzc19zY3JlZW4=',
        widgetClassName: 'otp_confirmation_success_screen',
      );
}
