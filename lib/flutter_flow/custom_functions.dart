import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic convertToJSON(
  String question,
  String option,
) {
  // take the prompt and return a JSON with form [{"role": "user", "content": prompt}]
  return json.decode('{"question": $question, "options": $option}');
}

dynamic saveChatHistory(
  List<dynamic>? chatHistory,
  dynamic newChat,
) {
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

String convertListToString(List<String>? selectedList) {
  return (selectedList ?? []).join(', ');
}

List<dynamic> formateAIResponse(String? generatedResp) {
  final List<Map<String, dynamic>> aiResp = [];

  try {
    // Ensure the input string is non-null and remove outer brackets
    String tempResp = (generatedResp ?? '').trim();
    if (tempResp.startsWith('[') && tempResp.endsWith(']')) {
      tempResp = tempResp.substring(1, tempResp.length - 1);
    }

    // Split the string into chunks based on the delimiter
    List<String> tempRespParts = tempResp.split('ChuksRecomate');

    for (var part in tempRespParts) {
      part = part.trim(); // Remove extra whitespace

      if (part.isNotEmpty) {
        try {
          // Parse each part as JSON and add to the response list
          Map<String, dynamic> parsedItem = json.decode(part);
          aiResp.add(parsedItem);
        } catch (e) {
          print('Error parsing part as JSON: $part');
        }
      }
    }

    // Print the parsed response for debugging
    print('Parsed AI response: $aiResp');
    return aiResp;
  } catch (ex) {
    print("Error processing AI response: ${ex.toString()}");
  }

  return aiResp;
}

String convertJsonToString(List<dynamic> input) {
  return input.toString();
}

String latlongString(
  LatLng location,
  bool isLat,
) {
  if (isLat) {
    return location.latitude.toString();
  } else {
    return location.longitude.toString();
  }
}

List<QuestionStruct> retrieveRandomQuestionFromList(
    List<QuestionStruct>? fullList) {
  if ((fullList ?? []).length <= 3) {
    return (fullList ??
        []); // Return the entire list if it has 3 or fewer items
  }
  (fullList ?? []).shuffle(); // Randomly shuffle the list
  return (fullList ?? []).sublist(0, 3); // Return the first 3 items
}
