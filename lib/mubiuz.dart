import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:ussd/ucell.dart';
import 'package:ussd/uzmobile.dart';

import 'beeline.dart';

class Mobiuz extends StatefulWidget {
  const Mobiuz({Key? key}) : super(key: key);

  @override
  State<Mobiuz> createState() => _MobiuzState();
}

class _MobiuzState extends State<Mobiuz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'MOBIUZ',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
          // leading: IconButton(
          //     icon: const Icon(
          //       Icons.support_agent,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {}),
          iconTheme: IconThemeData(color: Colors.black54),
          brightness: Brightness.light,
          actions: <Widget>[
            // IconButton(
            //     icon: const Icon(
            //       Icons.language,
            //       color: Colors.white,
            //     ),
            //     onPressed: () {}),
          ],
        ),
        body: _textBuild(),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.red,
          ),
          child: BottomNavigationBar(
            onTap: (index){
              if(index == 0) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Ucell()));
              } else if (index == 1) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Beeline()));
              } else if (index == 2) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Mobiuz()));
              } else if (index == 3) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Uzmobile()));
              }
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/ucell_1.png',
                  width: 100,
                  height: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/beel.png',
                  width: 100,
                  height: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/m.png',
                  width: 100,
                  height: 30,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/uzm.png',
                  width: 100,
                  height: 30,
                ),
                label: '',
              ),
            ],
          ),
        )
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       print('Text');
      //     },
      //     child: const Text("Add"),
      //     backgroundColor: Colors.grey[900]),
      // backgroundColor: Colors.grey[100],
    );
  }
}

//фото 500х500 размерда
List<String> images = ['11.jpeg', '22.jpg', '33.jpg'];

Widget _textBuild() {
  return Column(
    children: [
      CarouselSlider(
        options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlay: true),
        items: images.map((index) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/$index'))),
                // child: Text('text $i', style: const TextStyle(fontSize: 16.0),)
              );
            },
          );
        }).toList(),
      ),
      _listView(),
    ],
  );
}

class _listView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

Widget _myListView() {
  return Expanded(
    child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Row(
                    children: [
                      Text(data[index]['MB']!, style: TextStyle(fontSize: 12)),
                      SizedBox(width: 10),
                      Text(data[index]['summa']!, style: TextStyle(fontSize: 13)),
                      SizedBox(width: 10),
                      Text(data[index]['kod']!, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.phone),
                    color: Colors.green,
                    onPressed: () async {
                      final number = data[index]['kod']!;
                      await FlutterPhoneDirectCaller.callNumber(number);
                    },
                  ),
                ),
              );
            })
    ),
  );
}

List<Map<String, String>> data = [
  {
    'MB': '300 mb',
    'summa': '8000 so\'m',
    'kod': '*171*019*1*010600181#',
  },
  {
    'MB': '500 mb',
    'summa': '9000 so\'m',
    'kod': '*171*019*7*010600181#',
  },
  {
    'MB': '1000 mb',
    'summa': '11000 so\'m',
    'kod': '*171*019*2*010600181#',
  },
  {
    'MB': '2000 mb',
    'summa': '17000 so\'m',
    'kod': '*171*019*5*010600181#',
  },
  {
    'MB': '3000 mb',
    'summa': '25000 so\'m',
    'kod': '*171*019*3*010600181#',
  },
  {
    'MB': '5000 mb',
    'summa': '33000 so\'m',
    'kod': '*171*019*4*010600181#',
  },
  {
    'MB': '10000 mb',
    'summa': '50000 so\'m',
    'kod': '*171*019*6*010600181#',
  },
  {
    'MB': '20000 mb',
    'summa': '55000 so\'m',
    'kod': '*171*019*8*010600181#',
  },
  {
    'MB': '30000 mb',
    'summa': '65000 so\'m',
    'kod': '*171*019*9*010600181#',
  },
  {
    'MB': '50000 mb',
    'summa': '75000 so\'m',
    'kod': '*171*019*10*010600181#',
  },

];
