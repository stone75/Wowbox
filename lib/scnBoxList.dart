import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wowbox/scnBoxBuy.dart';
import 'package:wowbox/scnBoxOpen.dart';
import 'package:wowbox/scnBoxView.dart';

class SceneBoxList extends StatefulWidget {
  const SceneBoxList({super.key});

  @override
  State<SceneBoxList> createState() => _SceneBoxListState();
}

class _SceneBoxListState extends State<SceneBoxList> {
  final List<ItemData> items = [
    ItemData(
      id: '1',
      from: 'Wowcoin 으로 구매',
      getdate: '구매 날짜 : 2024-02-01',
      isOpend: 1,
    ),
    ItemData(
      id: '2',
      from: 'oidnox 님이 선물',
      getdate: '선물 받은 날짜 : 2024-01-25',
      isOpend: 1,
    ),
    ItemData(
      id: '3',
      from: 'Wowcoin 으로 구매',
      getdate: '구매 날짜 : 2024-02-01',
      isOpend: 0,
    ),
    ItemData(
      id: '4',
      from: 'oidnox 님이 선물',
      getdate: '선물 받은 날짜 : 2024-01-25',
      isOpend: 0,
    ),
    ItemData(
      id: '5',
      from: 'Wowcoin 으로 구매',
      getdate: '구매 날짜 : 2024-02-01',
      isOpend: 1,
    ),
    ItemData(
      id: '6',
      from: 'oidnox 님이 선물',
      getdate: '선물 받은 날짜 : 2024-01-25',
      isOpend: 1,
    ),
    ItemData(
      id: '7',
      from: 'Wowcoin 으로 구매',
      getdate: '구매 날짜 : 2024-02-01',
      isOpend: 0,
    ),
    ItemData(
      id: '8',
      from: 'oidnox 님이 선물',
      getdate: '선물 받은 날짜 : 2024-01-25',
      isOpend: 0,
    ),    ItemData(
      id: '9',
      from: 'Wowcoin 으로 구매',
      getdate: '구매 날짜 : 2024-02-01',
      isOpend: 1,
    ),
    ItemData(
      id: '11',
      from: 'oidnox 님이 선물',
      getdate: '선물 받은 날짜 : 2024-01-25',
      isOpend: 1,
    ),
    ItemData(
      id: '12',
      from: 'Wowcoin 으로 구매',
      getdate: '구매 날짜 : 2024-02-01',
      isOpend: 0,
    ),
    ItemData(
      id: '13',
      from: 'oidnox 님이 선물',
      getdate: '선물 받은 날짜 : 2024-01-25',
      isOpend: 0,
    ),    // Add more items as needed
  ];

@override
  void didUpdateWidget(covariant SceneBoxList oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget....");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies, mounted');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate, mounted: $mounted');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose, mounted: $mounted');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble, mounted: $mounted');
  }


  Widget _buildBuyButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Card(
          color: Colors.deepOrange,
          child: ListTile(
            title: Center(
              child: Text("Box 구매"),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
              const SceneBoxBuy(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(-1.0, 0.0);
                const end = Offset.zero;
                final tween = Tween(begin: begin, end: end);
                final offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          ).then((value) { setState(() {});});
        },
      ),
    );
  }


  Widget _buildListItem(ItemData item) {
    var itemimg = (item.isOpend == 0)
        ? AssetImage('assets/opened.png')
        : AssetImage('assets/closed.jpg');
    var nextScene = (item.isOpend == 0)
        ? SceneBoxView(itemID : item.id)
        : SceneBoxOpen();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Card(
          child: ListTile(
            // leading: itemimg,
            leading: Image(
              width: 100,
              image: itemimg,
            ),
            title: Text(item.from),
            subtitle: Text(item.getdate),
            // trailing: Icon(Icons.more_vert),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                nextScene,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(-1.0, 0.0);
                const end = Offset.zero;
                final tween = Tween(begin: begin, end: end);
                final offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          ).then((value) { setState(() {});});
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("New Build...");
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildBuyButton();
          } else {
            return _buildListItem(items[index-1]);
          }
        },
      ),
    );
  }
}

class ItemData {
  final String id;
  final String from;
  final String getdate;
  final int isOpend;

  ItemData({
    required this.id,
    required this.from,
    required this.getdate,
    required this.isOpend,
  });
}
