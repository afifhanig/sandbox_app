import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/const/constant.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/data/category_data.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/util/responsive.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!Responsive.isDesktop(context))
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.grey,
                  size: 25,
                ),
              ),
            ),
          ),
        if (!Responsive.isMobile(context))
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tues, Nov 12',
                  style: TextStyle(color: greyTextColor),
                ),
                const Text(
                  'This week in Estopona',
                  style: TextStyle(color: blackTextColor, fontSize: 24),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: cardBackgroundColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      borderSide: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    hintText: 'What do you feel like doing?',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 21,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      categoryRectangle('Filter'),
                      ...CategoryDetails().categoryData.map(
                            (e) => categoryRectangle(e.categoryName),
                          )
                    ],
                  ),
                ),
              ],
            ),
          ),
        if (Responsive.isMobile(context))
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 25,
                ),
                onPressed: () {},
              ),
              InkWell(
                onTap: () => Scaffold.of(context).openEndDrawer(),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    "assets/images/avatar.png",
                    width: 32,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  categoryRectangle(String title) {
    return Container(
      margin: const EdgeInsets.only(left: 3, right: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.purple.shade200,
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(title),
      ),
    );
  }
}
