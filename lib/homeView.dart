import 'package:flutter/material.dart';
import 'package:takehomeproject/detailview.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.amber,
        title: const  
         Center(child: 
          Text('Nobel Prizes', 
           style: TextStyle(
            color: Colors.black
           ),
        )),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(10),
        itemCount: 8,
        itemBuilder: (BuildContext , int index) {
          return
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=> DetailView()));
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
                              child: Text('$inComingData 1901 - Chemistry',
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
      }),
    );
  }
}