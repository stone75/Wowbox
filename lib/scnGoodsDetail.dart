import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SceneGoodsDetail extends StatefulWidget {
  const SceneGoodsDetail({super.key});

  @override
  State<SceneGoodsDetail> createState() => _SceneGoodsDetailState();
}

class _SceneGoodsDetailState extends State<SceneGoodsDetail> {
  int imageselect = 0;
  final GoodsDetailItemData detailitemdata = GoodsDetailItemData(
    goodsid: "prod123123",
    title: "샘플 상품",
    imagelist: [
      "http://img.dev.wowbox.odinox.com/1691490584.png",
      "http://img.dev.wowbox.odinox.com/1692717479.png",
      "http://img.dev.wowbox.odinox.com/1691490584.png",
      "http://img.dev.wowbox.odinox.com/1692717479.png",
      "http://img.dev.wowbox.odinox.com/1691490584.png",
      "http://img.dev.wowbox.odinox.com/1692717479.png",
    ],
    description: "WowBox 의 획기적인 상품\n한 번만 잡솨봐",
    price: '\$19.99',
    reviews: [
      GoodsReviewData(
        usernick: 'John Doe',
        review: 'Comment for the product. This is a sample comment.',
      ),
      GoodsReviewData(
        usernick: 'John Doe',
        review:
            'Another comment for the product. More details can be added here.',
      ),
      GoodsReviewData(
        usernick: '박병석',
        review: '이거 정말 좋아요.\n내가 써 봐서 잘 알죠',
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 400,
              child: Center(
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: 400.0,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                  imageUrl: detailitemdata.imagelist[imageselect],
                ),
              ),
            ),


            SizedBox(height: 8.0),
            // _buildThumbnailImages(),
            Container(
              height: 150.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: detailitemdata.imagelist.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Center(
                        child: CachedNetworkImage(
                          width: double.infinity,
                          height: 150.0,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                ),
                              ),
                          imageUrl: detailitemdata.imagelist[index],
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        imageselect = index;
                      });
                    },
                  );
                },
              ),
            ),

            SizedBox(height: 8.0),
            _buildProductInfo(),

            // SizedBox(height: 8.0),
            // _buildUserReviews(),
          ],
        ),
      ),
    );
  }


  // Widget _buildThumbnailImages() {
  //   return Container(
  //     height: 150.0,
  //     child: ListView(
  //       scrollDirection: Axis.horizontal,
  //       children: [
  //         _buildThumbnailImage('assets/icon.png'), // 대체 이미지 사용
  //         _buildThumbnailImage('assets/icon.png'), // 대체 이미지 사용
  //         _buildThumbnailImage('assets/icon.png'), // 대체 이미지 사용
  //         _buildThumbnailImage('assets/icon.png'), // 대체 이미지 사용
  //         _buildThumbnailImage('assets/icon.png'), // 대체 이미지 사용
  //         _buildThumbnailImage('assets/icon.png'), // 대체 이미지 사용
  //         _buildThumbnailImage('assets/icon.png'), // 대체 이미지 사용
  //       ],
  //     ),
  //   );
  // }

  Widget _buildThumbnailImage(String imagePath) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detailitemdata.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            detailitemdata.description,
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                detailitemdata.price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserReviews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildUserReview(
            'John Doe', 'Comment for the product. This is a sample comment.'),
        _buildUserReview('Jane Doe',
            'Another comment for the product. More details can be added here.'),
        // Add more reviews as needed
      ],
    );
  }

  Widget _buildUserReview(String userName, String comment) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                ),
              ),
              Row(
                children: [
                  _buildSmallButton('Like'),
                  _buildSmallButton('Reply'),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            comment,
            style: TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallButton(String label) {
    return Container(
      margin: EdgeInsets.only(left: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10.0,
        ),
      ),
    );
  }
}

class GoodsDetailItemData {
  final String goodsid;
  final List<String> imagelist;
  final String title;
  final String description;
  final String price;
  final List<GoodsReviewData> reviews;

  GoodsDetailItemData({
    required this.goodsid,
    required this.imagelist,
    required this.title,
    required this.description,
    required this.price,
    required this.reviews,
  });
}

class GoodsReviewData {
  final String usernick;
  final String review;

  GoodsReviewData({
    required this.usernick,
    required this.review,
  });
}
