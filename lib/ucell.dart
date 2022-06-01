import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:ussd/uzmobile.dart';

import 'beeline.dart';
import 'mubiuz.dart';

class Ucell extends StatefulWidget {
  const Ucell({Key? key}) : super(key: key);

  @override
  State<Ucell> createState() => _UcellState();
}

class _UcellState extends State<Ucell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'UCELL',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
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
            canvasColor: Colors.deepPurpleAccent,
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
List<String> images = ['1.jpg', '2.jpg', '3.jpg'];

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
                Text(data[index]['MB']!, style: TextStyle(fontSize: 14)),
                SizedBox(width: 10),
                Text(data[index]['summa']!, style: TextStyle(fontSize: 15)),
                SizedBox(width: 10),
                Text(data[index]['kod']!, style: TextStyle(fontSize: 13)),
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
    'MB': '1000 mb',
    'summa': '8900 so\'m',
    'kod': '*558*1*1*23355#',
  },
  {
    'MB': '1,500 mb',
    'summa': '13000 so\'m',
    'kod': '*558*1*2*23355#',
  },
  {
    'MB': '2000 mb',
    'summa': '15000 so\'m',
    'kod': '*558*1*3*23355#',
  },
  {
    'MB': '4000 mb',
    'summa': '25000 so\'m',
    'kod': '*558*1*4*23355#',
  },
  {
    'MB': '7000 mb',
    'summa': '35000 so\'m',
    'kod': '*558*1*5*23355#',
  },
  {
    'MB': '10000 mb',
    'summa': '45000 so\'m',
    'kod': '*558*1*13*23355#',
  },
  {
    'MB': '13000 mb',
    'summa': '55000 so\'m',
    'kod': '*558*1*6*23355#',
  },
  {
    'MB': '20000 mb',
    'summa': '65000 so\'m',
    'kod': '*558*1*7*23355#',
  },
  {
    'MB': '30000 mb',
    'summa': '75000 so\'m',
    'kod': '*558*1*8*23355#',
  },
  {
    'MB': '50000 mb',
    'summa': '85000 so\'m',
    'kod': '*558*1*9*23355#',
  },
  {
    'MB': '80000 mb',
    'summa': '115000 so\'m',
    'kod': '*558*1*10*23355#',
  },
  {
    'MB': '90000 mb',
    'summa': '135000 so\'m',
    'kod': '*558*1*11*23355#',
  },
  {
    'MB': '135000 mb',
    'summa': '188000 so\'m',
    'kod': '*558*1*12*23355#',
  },

];
