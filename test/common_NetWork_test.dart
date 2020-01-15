import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_demo/common/NetWork.dart';

void main() {
  test("测试网络请求", () async {
    final b = await getPromotionList('latest', 1);
    expect(b is List, true);
  });
}