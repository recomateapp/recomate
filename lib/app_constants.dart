import 'package:flutter/material.dart';
import 'flutter_flow/flutter_flow_util.dart';

abstract class FFAppConstants {
  static const String versionNumber = 'v1';
  static const List<String> countriesList = ['USA', 'Netherlands', 'Canada'];
  static Map<String, DebugDataField> toDebugSerializableMap() => {
        'versionNumber': debugSerializeParam(
          versionNumber,
          ParamType.String,
          link:
              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=appValues&appValuesTab=constant',
          searchReference:
              'reference=Eh0KFwoNdmVyc2lvbk51bWJlchIGcW41czRmcgIIA1oNdmVyc2lvbk51bWJlcg==',
          name: 'String',
          nullable: false,
        ),
        'countriesList': debugSerializeParam(
          countriesList,
          ParamType.String,
          isList: true,
          link:
              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=appValues&appValuesTab=constant',
          searchReference:
              'reference=Eh8KFwoNY291bnRyaWVzTGlzdBIGeTF0cjRhcgQSAggDWg1jb3VudHJpZXNMaXN0',
          name: 'String',
          nullable: false,
        )
      };
}
