import 'package:flutter/material.dart';
import 'package:my_flutter_demo/widgets/goodsList.dart';

class GoodsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              tabs: <Widget>[
                Tab(
                  text: '最新优惠',
                ),
                Tab(
                  text: '热门游戏',
                ),
                Tab(
                  text: '会员独享',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              GoodsListWidget('latest'),
              GoodsListWidget('hot'),
              GoodsListWidget('plus'),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), title: Text('正在促销')),
          BottomNavigationBarItem(icon: Icon(Icons.all_inclusive), title: Text('所有游戏')),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), title: Text('我')),
        ],
          ),
        ),
      );
}
