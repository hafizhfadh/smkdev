import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseProxy {
  // Get a reference your Supabase client
  static final supabase = Supabase.instance.client;

  static Future<dynamic> fetchData(
      {String tableName = "", String? parameter}) async {
    return supabase.from(tableName).select('''$parameter''');
  }

  static Future<dynamic> insertData(
      {String tableName = "", required Object parameter}) async {
    return supabase.from(tableName).insert(parameter);
  }

  static Future<dynamic> updateData({
    dynamic id,
    String tableName = "",
    required Map<dynamic, dynamic> parameter,
  }) async {
    return supabase.from(tableName).update(parameter).match({'id': id});
  }

  static Future<dynamic> deleteData({
    dynamic id,
    String tableName = "",
  }) async {
    return supabase.from(tableName).delete().match({'id': id});
  }
}
