import 'package:dio/dio.dart';
Future<List<dynamic>> getPromotionList(type, page) async {
  final result = await Dio().get("https://api-plus.lhbgame.com/Promotion/getTabList?type=$type&page=$page");
  return result.data["info"]["data"];
}

Future<List<dynamic>> getGameList(page) async {
  final result = await Dio().get("https://api-plus.lhbgame.com//game/filter?page=$page");
  return result.data["info"]["data"];
}