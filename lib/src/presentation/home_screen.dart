import 'package:flutter/material.dart';
import '../data/data_source.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String data = 'me famma hatta chy ';

  void makeRequest() async {
    RemoteDataSourceImpl a = RemoteDataSourceImpl(productCode: '6194013927318');

    String response = await a.retrieveCountry();
    setState(() {
      data = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text('Country Origin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data),
            ElevatedButton(
                onPressed: () {
                  makeRequest();
                },
                child: const Text('Press me '))
          ],
        ),
      ),
    );
  }
}

int a = '3' as int;
