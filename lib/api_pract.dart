import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var inComingData;

class ApiPract extends StatefulWidget {
  const ApiPract({super.key});

  @override
  State<ApiPract> createState() => _ApiPractState();
}

class _ApiPractState extends State<ApiPract> {
  
  Future<List<dynamic>> fetchNobelPrizes() async {
  final response = await http.get('https://irfangul92.github.io/index.json' as Uri);

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON data.
    final data = json.decode(response.body);
    return data['nobelPrizes'];
  } else {
    // If the server did not return a 200 OK response, throw an exception.
    throw Exception('Failed to load data from the API');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: SingleChildScrollView(
        child: FutureBuilder<List<dynamic>>(
          future: fetchNobelPrizes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Loading indicator
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // Display the data in your Flutter widgets
              final nobelPrizes = snapshot.data;
              return GestureDetector(
              onTap: () {
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: const Icon(Icons.person,
                              size: 40,
                            )
                    ),
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container( 
                              width: MediaQuery.of(context).size.width*0.80,
                              child: Text('${nobelPrizes} 1901 - Chemistry ',
                              style: const TextStyle(
                                fontSize :18,
                                fontWeight: FontWeight.w600
                              ),
                              ),
                            ),
                            const Positioned(
                              right: 0,
                              top: 0,
                              child: Icon(Icons.arrow_forward_ios_sharp ,
                              color: Colors.grey,
                              
                              ),
                            )
                          ],
                        ),
                        Text('$inComingData Date Awarded: 1901-11-12',
                        style: const TextStyle(
                          fontSize :14,
                          fontWeight: FontWeight.w400
                        ),
                        ),
                        Text('Laureate: '+'$inComingData Full name', 
                        style: const TextStyle(
                          fontSize :14,
                          fontWeight: FontWeight.w300
                        ),
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width-85
                          ),
                          child: Text('\nMotivation '+"$inComingData in reconnition of the extraordinary services he has rendered by the discovery of the laws of chmical dynamics and osmotic presusure in solutions",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
            }
          },
        )

      ),
    );
  }
}