import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_demo/models/Goods.dart';

class GoodsItemWidget extends StatelessWidget {
  final Goods data;
  GoodsItemWidget({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            data.cover,
            width: 100,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
          ),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(data.title ?? '未知名称', style: TextStyle(fontSize: 16)),
                SalePriceSection(data)
              ]))
        ],
      ),
    );
  }
}

class SalePriceSection extends StatelessWidget {
  SalePriceSection(this.data);
  final Goods data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: <Widget>[
          Text('HK\$${data.salePrice}',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
              ))
        ],
      ),
    );
  }
}
