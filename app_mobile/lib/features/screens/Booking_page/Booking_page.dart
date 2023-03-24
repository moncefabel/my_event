import 'package:flutter/material.dart';
import '../../../models/etablissement.dart';

class BookingPage extends StatefulWidget {
  final Etablissement etb;

  const BookingPage({Key? key, required this.etb}) : super(key: key);

   //static const String routeName = '/Booking';
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  // Define variables for booking information
  int numPeople = 1;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  // Function to show time picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      title: Text('Booking Information for ${widget.etb.nameEtb}'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Number of People:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (numPeople > 1) {
                      setState(() {
                        numPeople--;
                      });
                    }
                  },
                ),
                Text(
                  '$numPeople',
                  style: TextStyle(fontSize: 16.0),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      numPeople++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Date:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(width: 8.0),
                          Text(
                            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
        
            SizedBox(height: 16.0),
            Text(
              'Time:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border:  Border.all(color: Colors.grey),
                         ),
                    child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Icon(Icons.access_time),
                          SizedBox(width: 8.0),
                          Text(
                          '${selectedTime.hour}:${selectedTime.minute}',
                          style: TextStyle(fontSize: 16.0),
                          ),
                          ],
                          ),
                          ),
                          ),
                          ),
                          ],
                          ),
                          SizedBox(height: 200.0),
                          Center(
                          child: ElevatedButton(
                          onPressed: () {
                          // Function to handle submitting the booking information
                          },
                          style: ElevatedButton.styleFrom(primary: Color(0xff4c9fc1)),
                          child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                          child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 18.0),
                          ),
                          ),
                          ),
                          ),
                          ],
                          ),
                          ),
                          );
                          }
          }
