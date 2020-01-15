import 'package:flutter/cupertino.dart';
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
            child: Text(data.title,
                style: TextStyle(
                  fontSize: 16,
                )),
          )
        ],
      ),
    );
  }
}
