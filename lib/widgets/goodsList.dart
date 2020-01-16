import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_demo/models/Goods.dart';
import 'package:my_flutter_demo/widgets/goodsItem.dart';
import 'package:provider/provider.dart';



class GoodsListWidget extends StatefulWidget {
  final String _type;
  GoodsListWidget(this._type);

  @override
  _GoodsListWidget createState() => _GoodsListWidget(_type);
}

class _GoodsListWidget extends State<GoodsListWidget> with AutomaticKeepAliveClientMixin {
  final String _type;
  _GoodsListWidget(this._type);

  @override
  get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (context) => GoodsList(type: _type),
      child: Consumer<GoodsList>(
        builder: (context, goodsList, child) {
          return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) goodsList.loadData();
                return;
              },
              child: _listView(goodsList));
        },
      ),
    );
  }
}

Widget _listView(goodsList) => ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: goodsList.list.length,
      itemBuilder: (context, index) {
        return GoodsItemWidget(data: goodsList.list[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 1.0);
        },
    );
