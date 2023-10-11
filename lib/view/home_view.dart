import 'package:flutter/material.dart';
import 'package:takehomeproject/data/api.dart';
import 'package:takehomeproject/view/detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await Api.fetchNobelPrizes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.amber,
          title: const Center(
              child: Text(
            'Nobel Prizes',
            style: TextStyle(color: Colors.black),
          )),
        ),
        body: ListView.builder(
            itemCount: Api.nobelPrizes.length,
            itemBuilder: (context, index) {
              final nobelPrize = Api.nobelPrizes[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DetailView(
                                nobelPrize: nobelPrize,
                              )));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: const Icon(
                            Icons.person,
                            size: 40,
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.80,
                                child: Text(
                                  nobelPrize.awardYear.toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Positioned(
                                right: 0,
                                top: 0,
                                child: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          Text(
                            nobelPrize.prizeAmount.toString(),
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            nobelPrize.dateAwarded.toString(),
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width - 85),
                            child: Text(nobelPrize.category.toString()),
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
            }));
  }
}
