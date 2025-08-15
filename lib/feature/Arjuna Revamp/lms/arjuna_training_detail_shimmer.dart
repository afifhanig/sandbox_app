import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

class TrainingDetailShimmer extends StatefulWidget {
  const TrainingDetailShimmer({super.key});

  @override
  State<TrainingDetailShimmer> createState() => _TrainingDetailShimmerState();
}

class _TrainingDetailShimmerState extends State<TrainingDetailShimmer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Column(
        children: [
          headContentLoading(),
          tabbarHeaderLoading(),
          tabbarContentLoading(),
        ],
      ),
    );
  }

  Widget headContentLoading() {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey, //New
              blurRadius: 3.0,
              offset: Offset(0, 0))
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                //padding: EdgeInsets.symmetric(vertical: 110, horizontal: 110),
                color: Colors.white,
                width: double.infinity,
                height: 30,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                //padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                color: Colors.white,
                width: double.infinity,
                height: 30,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                //padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                color: Colors.white,
                width: double.infinity,
                height: 30,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                //padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                color: Colors.white,
                width: double.infinity,
                height: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabbarHeaderLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        //padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        height: 50,
        color: Colors.white,
      ),
    );
  }

  Widget tabbarContentLoading() {
    return Container(
      height: 120,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      // padding: EdgeInsets.symmetric(vertical: 30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey, //New
              blurRadius: 3.0,
              offset: Offset(0, 0))
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                //padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                color: Colors.white,
                width: double.infinity,
                height: 30,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                //padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                color: Colors.white,
                width: 200,
                height: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
