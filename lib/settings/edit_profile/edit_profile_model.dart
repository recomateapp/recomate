import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
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

  bool? _imagePickedCam = true;
  set imagePickedCam(bool? value) {
    _imagePickedCam = value;
    debugLogWidgetClass(this);
  }

  bool? get imagePickedCam => _imagePickedCam;

  bool? _imagePickedGen = true;
  set imagePickedGen(bool? value) {
    _imagePickedGen = value;
    debugLogWidgetClass(this);
  }

  bool? get imagePickedGen => _imagePickedGen;

  late LoggableList<FFUploadedFile> _uploadedFiles = LoggableList([]);
  set uploadedFiles(List<FFUploadedFile> value) {
    if (value != null) {
      _uploadedFiles = LoggableList(value);
    }

    debugLogWidgetClass(this);
  }

  List<FFUploadedFile> get uploadedFiles =>
      _uploadedFiles?..logger = () => debugLogWidgetClass(this);
  void addToUploadedFiles(FFUploadedFile item) => uploadedFiles.add(item);
  void removeFromUploadedFiles(FFUploadedFile item) =>
      uploadedFiles.remove(item);
  void removeAtIndexFromUploadedFiles(int index) =>
      uploadedFiles.removeAt(index);
  void insertAtIndexInUploadedFiles(int index, FFUploadedFile item) =>
      uploadedFiles.insert(index, item);
  void updateUploadedFilesAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      uploadedFiles[index] = updateFn(uploadedFiles[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getCountries)] action in edit_profile widget.
  ApiCallResponse? _getCountriesResp;
  set getCountriesResp(ApiCallResponse? value) {
    _getCountriesResp = value;
    debugLogWidgetClass(this);
  }

  ApiCallResponse? get getCountriesResp => _getCountriesResp;

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  DateTime? datePicked;
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
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};
  @override
  void initState(BuildContext context) {
    debugLogWidgetClass(this);
  }

  @override
  void dispose() {
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        localStates: {
          'pageCountries': debugSerializeParam(
            pageCountries,
            ParamType.String,
            isList: true,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=edit_profile',
            searchReference:
                'reference=QiAKFgoNcGFnZUNvdW50cmllcxIFZ2FxenJyBhICCAMgAVABWg1wYWdlQ291bnRyaWVzYgxlZGl0X3Byb2ZpbGU=',
            name: 'String',
            nullable: false,
          ),
          'imagePickedCam': debugSerializeParam(
            imagePickedCam,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=edit_profile',
            searchReference:
                'reference=Qh8KFwoOaW1hZ2VQaWNrZWRDYW0SBWs1aXJjcgQIBSAAUAFaDmltYWdlUGlja2VkQ2FtYgxlZGl0X3Byb2ZpbGU=',
            name: 'bool',
            nullable: true,
          ),
          'imagePickedGen': debugSerializeParam(
            imagePickedGen,
            ParamType.bool,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=edit_profile',
            searchReference:
                'reference=QigKFwoOaW1hZ2VQaWNrZWRHZW4SBWkxcHpxKgcSBWZhbHNlcgQIBSAAUAFaDmltYWdlUGlja2VkR2VuYgxlZGl0X3Byb2ZpbGU=',
            name: 'bool',
            nullable: true,
          ),
          'uploadedFiles': debugSerializeParam(
            uploadedFiles,
            ParamType.FFUploadedFile,
            isList: true,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=edit_profile',
            searchReference:
                'reference=Qh4KFgoNdXBsb2FkZWRGaWxlcxIFa3drczhyBBICCBhQAVoNdXBsb2FkZWRGaWxlc2IMZWRpdF9wcm9maWxl',
            name: 'FFUploadedFile',
            nullable: false,
          )
        },
        widgetStates: {
          'fullNameText': debugSerializeParam(
            fullNameTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=edit_profile',
            name: 'String',
            nullable: true,
          ),
          'emailText': debugSerializeParam(
            emailTextController?.text,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=edit_profile',
            name: 'String',
            nullable: true,
          ),
          'countryDropDValue': debugSerializeParam(
            countryDropDValue,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=edit_profile',
            name: 'String',
            nullable: true,
          ),
          'relationshipDValue': debugSerializeParam(
            relationshipDValue,
            ParamType.String,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=edit_profile',
            name: 'String',
            nullable: true,
          )
        },
        actionOutputs: {
          'getCountriesResp': debugSerializeParam(
            getCountriesResp,
            ParamType.ApiResponse,
            link:
                'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=edit_profile',
            name: 'ApiCallResponse',
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
            'https://app.flutterflow.io/project/recomate-w5oj9e/tab=uiBuilder&page=edit_profile',
        searchReference: 'reference=OgxlZGl0X3Byb2ZpbGVQAVoMZWRpdF9wcm9maWxl',
        widgetClassName: 'edit_profile',
      );
}
