import 'package:flutter/material.dart';

class SeatSelectionScreen extends StatefulWidget {
  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  List<List<bool>> seats = List.generate(6, (row) => List.generate(6, (col) => false));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Theater Seat Selection'),
      ),
      body: Center(
        child: InteractiveViewer(
          minScale: 1.0,
          maxScale: 5.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Screen',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                height: 300,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    int row = index ~/ 6;
                    int col = index % 6;
                    bool isSeatSelected = seats[row][col];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          seats[row][col] = !isSeatSelected;
                        });
                      },
                      child: Container(
                        color: isSeatSelected ? Colors.green : Colors.grey,
                        child: Center(
                          child: Text(
                            '${String.fromCharCode(row + 65)}${col + 1}',
                            style: TextStyle(
                              color: isSeatSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 6 * 6,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement the action when the user clicks on "Confirm Selection" button.
                  // For this example, let's just print the selected seats to the console.
                  List<String> selectedSeats = [];
                  for (int row = 0; row < 6; row++) {
                    for (int col = 0; col < 6; col++) {
                      if (seats[row][col]) {
                        selectedSeats.add('${String.fromCharCode(row + 65)}${col + 1}');
                      }
                    }
                  }
                  print('Selected seats: $selectedSeats');
                },
                child: Text('Confirm Selection'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
