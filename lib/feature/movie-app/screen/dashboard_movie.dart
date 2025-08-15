import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sandbox_flutter_3/feature/movie-app/controller/movies_controller.dart';
import 'package:intl/intl.dart';

class DashboardMovies extends StatefulWidget {
  const DashboardMovies({super.key});

  @override
  State<DashboardMovies> createState() => _HomeNewsState();
}

class _HomeNewsState extends State<DashboardMovies> {
  late MoviesController _mc;

  @override
  void initState() {
    _mc = Get.put(MoviesController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 39, 34, 34)),
        backgroundColor: Colors.white,
        elevation: 5,
        centerTitle: true,
        title: Text(
          'Dashboard Movies',
          style: GoogleFonts.lilitaOne(fontSize: 24, color: Colors.black),
        ),
        // actions: [
        //   InkWell(
        //     child: Icon(Icons.search),
        //     onTap: () {
        //       print("click search");
        //     },
        //   ),
        //   SizedBox(width: 10),
        // ],
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width / 4,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Obx(
                () {
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      _mc.isLoading.value
                          ? const Center(child: CircularProgressIndicator(color: Colors.amber))
                          : _mc.nowPlayingMoviesList.isNotEmpty
                              ? StaggeredGrid.count(
                                  axisDirection: AxisDirection.down,
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  children: [
                                    ..._mc.nowPlayingMoviesList.take(6).map((data) => StaggeredGridTile.count(
                                          crossAxisCellCount: 2,
                                          mainAxisCellCount: 3,
                                          child: MoviesWidget(
                                            moviesImage: data.posterPath,
                                            moviesTitle: data.title,
                                            moviesReleaseDate: data.releaseDate,
                                            moviesDesc: data.overview,
                                            moviesRating: data.voteAverage.toStringAsFixed(2),
                                          ),
                                        ))
                                  ],
                                )
                              : const Text('No data found'),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MoviesWidget extends StatelessWidget {
  final String moviesImage;
  final String moviesTitle;
  final String moviesReleaseDate;
  final String moviesDesc;
  final String moviesRating;

  const MoviesWidget({super.key, required this.moviesImage, required this.moviesTitle, required this.moviesReleaseDate, required this.moviesDesc, required this.moviesRating});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Card(
          elevation: 8,
          color: Colors.white,
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
                          image: NetworkImage('https://image.tmdb.org/t/p/original/$moviesImage'),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              moviesTitle,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 1),
                            Text(
                              dateFormat(moviesReleaseDate),
                              style: const TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            const SizedBox(height: 1),
                            Text(
                              moviesDesc,
                              maxLines: 2,
                              style: const TextStyle(color: Colors.white, fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.center,
                          stops: [0.4, 9],
                          colors: [
                            Colors.black,
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.lime.shade900, //tagColor(moviesRating),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  moviesRating,
                                  style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                showBottomSheet();
                              },
                              icon: const Icon(Icons.more_vert),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  showBottomSheet() {
    Get.bottomSheet(
      Container(
          height: 150,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    color: Colors.black,
                  ),
                  const SizedBox(width: 10),
                  const Text('Save Poster to Local Storage'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    color: Colors.black,
                  ),
                  const SizedBox(width: 10),
                  const Text('Add to Favorites'),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    color: Colors.black,
                  ),
                  const SizedBox(width: 10),
                  const Text('Add to Watchlist'),
                ],
              ),
            ],
          )),
      isDismissible: true,
    );
  }

  dateFormat(String rDate) {
    DateTime date = DateTime.parse(rDate);
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    return formattedDate;
  }
}
