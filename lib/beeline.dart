import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:ussd/mubiuz.dart';
import 'package:ussd/ucell.dart';
import 'package:ussd/uzmobile.dart';

class Beeline extends StatefulWidget {
  const Beeline({Key? key}) : super(key: key);

  @override
  State<Beeline> createState() => _BeelineState();
}

class _BeelineState extends State<Beeline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'BEELINE',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
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
            canvasColor: Colors.amber,
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
List<String> images = ['1111.jpg', '2222.jpg', '3333.jpg'];

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
                      Text(data[index]['MB']!, style: TextStyle(fontSize: 15)),
                      SizedBox(width: 20),
                      Text(data[index]['summa']!, style: TextStyle(fontSize: 15)),
                      SizedBox(width: 20),
                      Text(data[index]['kod']!, style: TextStyle(fontSize: 15)),
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
    'summa': '10000 so\'m',
    'kod': '*1*01*0065#',
  },
  {
    'MB': '2000 mb',
    'summa': '15000 so\'m',
    'kod': '*1*02*0065#',
  },
  {
    'MB': '5000 mb',
    'summa': '25000 so\'m',
    'kod': '*1*05*0065#',
  },
  {
    'MB': '10000 mb',
    'summa': '45000 so\'m',
    'kod': '*1*10*0065#',
  },
  {
    'MB': '20000 mb',
    'summa': '65000 so\'m',
    'kod': '*1*20*0065#',
  },
  {
    'MB': '30000 mb',
    'summa': '75000 so\'m',
    'kod': '*1*30*0065#',
  },
  {
    'MB': '50000 mb',
    'summa': '90000 so\'m',
    'kod': '*1*50*0065#',
  },
  {
    'MB': '75000 mb',
    'summa': '110000 so\'m',
    'kod': '*1*75*0065#',
  },

];

