// services/storage_service.dart
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import'scan_history.dart';

class StorageService {
  static const _scanHistoryKey = 'scanHistory';

  Future<void> saveScan(ScanHistory scan) async {
    final prefs = await SharedPreferences.getInstance();
    final history = await getScanHistory();
    
    // Add new scan to beginning of list
    history.insert(0, scan);
    
    // Save only the 10 most recent scans
    final limitedHistory = history.take(10).toList();
    
    // Convert to JSON and save
    final jsonList = limitedHistory.map((scan) => jsonEncode(scan.toJson())).toList();
    await prefs.setStringList(_scanHistoryKey, jsonList);
  }

  Future<List<ScanHistory>> getScanHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStrings = prefs.getStringList(_scanHistoryKey) ?? [];
    
    return jsonStrings.map((jsonString) {
      try {
        final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
        return ScanHistory.fromJson(jsonMap);
      } catch (e) {
        if (kDebugMode) {
         print('Error parsing scan history: $e');
          print('Problematic JSON string: $jsonString');

        }
        return null;
      }
    }).whereType<ScanHistory>().toList();
  }
}