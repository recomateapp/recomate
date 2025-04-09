import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/back_icon_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'about_you_widget.dart' show AboutYouWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AboutYouModel extends FlutterFlowModel<AboutYouWidget> {
  ///  Local state fields for this page.

  late LoggableList<String> _pageCountries = LoggableList([]);
  set pageCountries(List<String> value) {
    if (value != null) {
      _pageCountries = LoggableList(value);
    }

    debugLogWidgetClass(this);
  }

  List<String> get pageCountries =>
      _pageCountries?..logger = () => debugLogWidgetClass(this);
  void addToPageCountries(String item) => pageCountries.add(item);
  void removeFromPageCountries(String item) => pageCountries.remove(item);
  void removeAtIndexFromPageCountries(int index) =>
      pageCountries.removeAt(index);
  void insertAtIndexInPageCountries(int index, String item) =>
      pageCountries.insert(index, item);
  void updatePageCountriesAtIndex(int index, Function(String) updateFn) =>
      pageCountries[index] = updateFn(pageCountries[index]);

  bool _profilePicUploaded = false;
  set profilePicUploaded(bool value) {
    _profilePicUploaded = value;
    debugLogWidgetClass(this);
  }

  bool get profilePicUploaded => _profilePicUploaded;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getCountries)] action in about_you widget.
  ApiCallResponse? _getCountriesResp;
  set getCountriesResp(ApiCallResponse? value) {
    _getCountriesResp = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get getCountriesResp => _getCountriesResp;

  // Model for back_icon_button component.
  late BackIconButtonModel backIconButtonModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for genderDropD widget.
  String? _genderDropDValue;
  set genderDropDValue(String? value) {
    _genderDropDValue = value;
    debugLogWidgetClass(this);
  }

  String? get genderDropDValue => _genderDropDValue;

  FormFieldController<String>? genderDropDValueController;
  // State field(s) for countryDropD widget.
  String? _countryDropDValue;
  set countryDropDValue(String? value) {
    _countryDropDValue = value;
    debugLogWidgetClass(this);
  }

  String? get countryDropDValue => _countryDropDValue;

  FormFieldController<String>? countryDropDValueController;
  // State field(s) for relationshipD widget.
  String? _relationshipDValue;
  set relationshipDValue(String? value) {
    _relationshipDValue = value;
    debugLogWidgetClass(this);
  }

  String? get relationshipDValue => _relationshipDValue;

  FormFieldController<String>? relationshipDValueController;

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
    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'pageCountries': debugSerializeParam(
            pageCountries,
            ParamType.String,
            isList: true,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=about_you',
            searchReference:
                'reference=QiAKFgoNcGFnZUNvdW50cmllcxIFbzUyd3JyBhICCAMgAVABWg1wYWdlQ291bnRyaWVzYglhYm91dF95b3U=',
            name: 'String',
            nullable: false,
          ),
          'profilePicUploaded': debugSerializeParam(
            profilePicUploaded,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=about_you',
            searchReference:
                'reference=QiwKGwoScHJvZmlsZVBpY1VwbG9hZGVkEgUxaHR3ZCoHEgVmYWxzZXIECAUgAVABWhJwcm9maWxlUGljVXBsb2FkZWRiCWFib3V0X3lvdQ==',
            name: 'bool',
            nullable: false,
          )
        },
        widgetStates: {
          'nameText': debugSerializeParam(
            nameTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=about_you',
            name: 'String',
            nullable: true,
          ),
          'genderDropDValue': debugSerializeParam(
            genderDropDValue,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=about_you',
            name: 'String',
            nullable: true,
          ),
          'countryDropDValue': debugSerializeParam(
            countryDropDValue,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=about_you',
            name: 'String',
            nullable: true,
          ),
          'relationshipDValue': debugSerializeParam(
            relationshipDValue,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=about_you',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'getCountriesResp': debugSerializeParam(
            getCountriesResp,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=about_you',
            name: 'ApiCallResponse',
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
            'https://app.flutterflow.io/project/recomate-w5oj9e/tab=uiBuilder&page=about_you',
        searchReference: 'reference=OglhYm91dF95b3VQAVoJYWJvdXRfeW91',
        widgetClassName: 'about_you',
      );
}
