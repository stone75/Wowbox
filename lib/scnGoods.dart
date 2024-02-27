import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wowbox/scnGoodsDetail.dart';

class SceneGoods extends StatefulWidget {
  const SceneGoods({super.key});

  @override
  State<SceneGoods> createState() => _SceneGoodsState();
}

class _SceneGoodsState extends State<SceneGoods> {
  final List<ItemData> items = [
    ItemData(
      id: 1,
      image: 'http://img.dev.wowbox.odinox.com/1691490584.png',
      title: 'Item 1',
      description: 'Description for item 1. \nThis is a sample description.',
      price: '\$19.99',
    ),
    ItemData(
      id: 2,
      image: 'http://img.dev.wowbox.odinox.com/1692717479.png',
      title: 'Item 2',
      description: 'Description for item 2. Another sample description.',
      price: '\$29.99',
    ),
    ItemData(
      id: 3,
      image: 'http://img.dev.wowbox.odinox.com/1691490584.png',
      title: 'Item 3',
      description: 'Description for item 3. This is a sample description.',
      price: '\$19.99',
    ),
    ItemData(
      id: 4,
      image: 'http://img.dev.wowbox.odinox.com/1692717479.png',
      title: 'Item 4',
      description: 'Description for item 4. Another sample description.',
      price: '\$29.99',
    ),
    ItemData(
      id: 5,
      image: 'http://img.dev.wowbox.odinox.com/1691490584.png',
      title: 'Item 5',
      description: 'Description for item 51. This is a sample description.',
      price: '\$19.99',
    ),
    ItemData(
      id: 6,
      image: 'http://img.dev.wowbox.odinox.com/1692717479.png',
      title: 'Item 6',
      description: 'Description for item 6. Another sample description.',
      price: '\$29.99',
    ),
    ItemData(
      id: 7,
      image: 'http://img.dev.wowbox.odinox.com/1691490584.png',
      title: 'Item 7',
      description: 'Description for item 7. This is a sample description.',
      price: '\$19.99',
    ),
    ItemData(
      id: 8,
      image: 'http://img.dev.wowbox.odinox.com/1692717479.png',
      title: 'Item 8',
      description: 'Description for item 8. Another sample description.',
      price: '\$29.99',
    ),
    ItemData(
      id: 9,
      image: 'http://img.dev.wowbox.odinox.com/1691490584.png',
      title: 'Item 9',
      description: 'Description for item 9. This is a sample description.',
      price: '\$19.99',
    ),
    ItemData(
      id: 10,
      image: 'http://img.dev.wowbox.odinox.com/1692717479.png',
      title: 'Item 10',
      description: 'Description for item 10. Another sample description.',
      price: '\$29.99',
    ),
    // Add more items as needed
  ];

  Widget _buildListItem(ItemData item) {
    final id = item.id;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 100,
              child: Center(
                child: CachedNetworkImage(
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                  imageUrl: item.image,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              item.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              item.description,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                item.price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  SceneGoodsDetail(goodsID: id),
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
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildListItem(items[index]);
        },
      ),
    );
  }
}

class ItemData {
  final int id;
  final String image;
  final String title;
  final String description;
  final String price;

  ItemData({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  });
}
