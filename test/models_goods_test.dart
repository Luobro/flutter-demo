import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_demo/models/Goods.dart';

void main() {
  test("测试 goods models", () async {
    GoodsList goodsList = GoodsList();
    await goodsList.loadData();
  });

}