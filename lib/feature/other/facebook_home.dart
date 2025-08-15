import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:math';
import 'package:sandbox_flutter_3/feature/other/random_profile.dart';

class FacebookHome extends StatefulWidget {
  @override
  _FacebookHomeState createState() => _FacebookHomeState();
}

class _FacebookHomeState extends State<FacebookHome> {
  List<String> profileImageUrls = [];

  @override
  void initState() {
    super.initState();
    fetchProfileImageUrls();
  }

  Future<void> fetchProfileImageUrls() async {
    final dio = Dio();
    try {
      final response = await dio.get('https://randomuser.me/api/?results=10');
      final data = jsonDecode(response.data);
      setState(() {
        profileImageUrls = List.generate(
          10,
          (index) => data['results'][index]['picture']['large'],
        );
      });
    } catch (e) {
      print('Error fetching profile image URLs: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Facebook',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://source.unsplash.com/random'),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Navigate to Home screen if needed
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Navigate to Settings screen if needed
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          _buildPostContainer(),
          _buildPostContainer(),
          _buildPostContainer(),
        ],
      ),
    );
  }

  Widget _buildPostContainer() {
    final random = Random();
    final randomProfileImageUrl =
        profileImageUrls.isNotEmpty ? profileImageUrls[random.nextInt(profileImageUrls.length)] : '';
    final randomPostImageUrl = 'https://source.unsplash.com/random';

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(randomProfileImageUrl),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '2 hours ago',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_horiz),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'This is a sample post content. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id ligula sit amet dui eleifend convallis. Phasellus pellentesque rutrum lectus, at finibus odio rhoncus et.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 16),
          Image.network(
            randomPostImageUrl,
            fit: BoxFit.cover,
            height: 300,
            width: double.infinity,
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.thumb_up, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        'Like',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.comment, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        'Comment',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.share, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        'Share',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
