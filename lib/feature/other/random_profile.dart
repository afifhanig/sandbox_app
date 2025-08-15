import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'John Doe',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://source.unsplash.com/random'),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Software Engineer',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Joined in January 2021',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Location'),
            subtitle: Text('San Francisco, CA'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('Work'),
            subtitle: Text('OpenAI'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Education'),
            subtitle: Text('Stanford University'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text('johndoe@gmail.com'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.link),
            title: Text('Website'),
            subtitle: Text('johndoe.com'),
          ),
          Divider(),
        ],
      ),
    );
  }
}
