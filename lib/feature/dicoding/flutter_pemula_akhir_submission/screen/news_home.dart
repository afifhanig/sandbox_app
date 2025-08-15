import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeNews extends StatefulWidget {
  const HomeNews({super.key});

  @override
  State<HomeNews> createState() => _HomeNewsState();
}

class _HomeNewsState extends State<HomeNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 5,
        centerTitle: true,
        title: Text(
          'urnewses',
          style: GoogleFonts.lilitaOne(fontSize: 24, color: Colors.black),
        ),
        actions: [
          InkWell(
            child: Icon(Icons.search),
            onTap: () {
              print("click search");
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width / 4,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  StaggeredGrid.count(
                    axisDirection: AxisDirection.down,
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    children: const [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 4,
                        mainAxisCellCount: 2,
                        child: NewsWidget(
                          newsImage: 'assets/images/travelling_category_1.jpg',
                          newsTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                          newsDate: '11/09/2023',
                          newsDesc:
                              'Nunc vel mauris mattis, dignissim nisi at, molestie neque. Pellentesque tristique placerat lacinia. Integer in consequat mi, quis egestas urna. Nulla vehicula nec nibh sit amet consectetur. Vestibulum rhoncus nulla metus, quis accumsan ipsum sagittis ac. Ut id massa nec nisi vulputate finibus ultrices eu augue.',
                          newsTag: 'Travel',
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: NewsWidget(
                          newsImage: 'assets/images/gaming_category_1.jpg',
                          newsTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                          newsDate: '12/09/2023',
                          newsDesc:
                              'Nunc vel mauris mattis, dignissim nisi at, molestie neque. Pellentesque tristique placerat lacinia. Integer in consequat mi, quis egestas urna. Nulla vehicula nec nibh sit amet consectetur. Vestibulum rhoncus nulla metus, quis accumsan ipsum sagittis ac. Ut id massa nec nisi vulputate finibus ultrices eu augue.',
                          newsTag: 'Gaming',
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: NewsWidget(
                          newsImage: 'assets/images/coffee_category_1.jpg',
                          newsTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                          newsDate: '12/09/2023',
                          newsDesc:
                              'Nunc vel mauris mattis, dignissim nisi at, molestie neque. Pellentesque tristique placerat lacinia. Integer in consequat mi, quis egestas urna. Nulla vehicula nec nibh sit amet consectetur. Vestibulum rhoncus nulla metus, quis accumsan ipsum sagittis ac. Ut id massa nec nisi vulputate finibus ultrices eu augue.',
                          newsTag: 'Coffee',
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 4,
                        mainAxisCellCount: 2,
                        child: NewsWidget(
                          newsImage: 'assets/images/food_category_1.jpg',
                          newsTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                          newsDate: '13/09/2023',
                          newsDesc:
                              'Nunc vel mauris mattis, dignissim nisi at, molestie neque. Pellentesque tristique placerat lacinia. Integer in consequat mi, quis egestas urna. Nulla vehicula nec nibh sit amet consectetur. Vestibulum rhoncus nulla metus, quis accumsan ipsum sagittis ac. Ut id massa nec nisi vulputate finibus ultrices eu augue.',
                          newsTag: 'Food',
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 4,
                        mainAxisCellCount: 2,
                        child: NewsWidget(
                          newsImage: 'assets/images/technology_category_1.jpg',
                          newsTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                          newsDate: '13/09/2023',
                          newsDesc:
                              'Nunc vel mauris mattis, dignissim nisi at, molestie neque. Pellentesque tristique placerat lacinia. Integer in consequat mi, quis egestas urna. Nulla vehicula nec nibh sit amet consectetur. Vestibulum rhoncus nulla metus, quis accumsan ipsum sagittis ac. Ut id massa nec nisi vulputate finibus ultrices eu augue.',
                          newsTag: 'Technology',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewsWidget extends StatelessWidget {
  final String newsImage;
  final String newsTitle;
  final String newsDate;
  final String newsDesc;
  final String newsTag;

  const NewsWidget({super.key, required this.newsImage, required this.newsTitle, required this.newsDate, required this.newsDesc, required this.newsTag});

  Color tagColor(String tag) {
    switch (tag) {
      case 'Travel':
        return Colors.blue.shade200;
      case 'Gaming':
        return Colors.red.shade200;
      case 'Coffee':
        return Colors.lime.shade900;
      case 'Food':
        return Colors.green.shade200;
      case 'Technology':
        return Colors.blueGrey.shade200;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Card(
          elevation: 8,
          color: Colors.white, //Colors.brown.shade50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(newsImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          stops: [0.3, 5],
                          colors: [
                            Colors.black,
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    newsTitle,
                                    style: const TextStyle(color: Colors.white),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  newsDate,
                                  style: const TextStyle(color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            Text(
                              newsDesc,
                              maxLines: 2,
                              style: const TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: tagColor(newsTag),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            newsTag,
                            style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
