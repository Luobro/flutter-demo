import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_flutter_demo/common/NetWork.dart';

class Goods {
  String cover;
  String title;
  num salePrice;
  num discount;
  num originPrice;
  num plusPrice;
  num plusDiscount;

  Goods(this.cover, this.title, this.salePrice, this.discount, this.originPrice,
      this.plusDiscount, this.plusPrice);
}

class GoodsList extends ChangeNotifier {
  List<Goods> _list = [];
  UnmodifiableListView<Goods> get list => UnmodifiableListView(_list);

  int page = 1;
  String type = "latest";
  List<Goods> lastPage;
  bool isLoading = false;
  bool get hasMore {
    if (this.lastPage == null) return true;
    if (this.lastPage.length < 20) return false;

    return true;
  }

  GoodsList({String type}) {
    if (type != null) this.type = type;
    this.loadData();
  }

  List<Goods> parseRaw(List rawData) {
    final list = rawData
        .map((row) => Goods(
            row["cover_image"],
            row["name"],
            row["price"]["non_plus_user"]["sale_price"],
            row["price"]["non_plus_user"]["discount"],
            row["price"]["non_plus_user"]["origin_price"],
            row["price"]["plus_user"]["sale_price"],
            row["price"]["plus_user"]["discount"]))
        .toList();

    return list;
  }

  void loadNewPage(List<Goods> newPage) {
    this.lastPage = newPage;
    this._list.addAll(newPage);
    this.page++;
    try {
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future loadData() async {
    if (isLoading) return;
    if (!hasMore) return;

    this.isLoading = true;
    final rawPage = await getPromotionList(type, page);
    final newpage = parseRaw(rawPage);
    this.loadNewPage(newpage);
    this.isLoading = false;
  }

  void changeType(String type) {
    this._list = [];
    this.page = 1;
    this.lastPage = null;
    this.type = type;
    notifyListeners();

    this.loadData();
  }

  @override
  dispose() {
    super.dispose();
    print('dispose!');
  }
}
