import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'data_models/UpdatesModel.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() => runApp(UpdatesScreen());

List<UpdatesModel> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<UpdatesModel>((json) => UpdatesModel.fromJson(json))
      .toList();
}

Future<List<UpdatesModel>> fetchPosts() async {
  final response =
      await http.get('http://aranzazushrine.ph/home/wp-json/capie/v1/news/1');

  return compute(parsePosts, response.body);
}

class UpdatesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: UpdatesPage());
  }
}

class UpdatesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          leading: Icon(Icons.search, color: Colors.black),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 16, bottom: 10, top: 15),
                child: GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      width: 30,
                      fit: BoxFit.cover,
                      imageUrl:
                          "https://scontent.fmnl17-1.fna.fbcdn.net/v/t1.0-9/22815282_1179801335486549_5046548424585309223_n.jpg?_nc_cat=104&_nc_oc=AQmA9bPZObxvfY3ITfD8jff5_DzasX2R6yt6p6zXQHtj_VbOqEf5VitwAATE38FPFJw&_nc_ht=scontent.fmnl17-1.fna&oh=b62193919df6fe5b31d59f41872f9101&oe=5DB46EE5",
                      placeholder: (context, url) =>
                          new CircularProgressIndicator(),
                    ),
                  ),
                ))
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('VIVA ARANZAZU',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      color: Color(0xffFF3454))),
              Text(' PH ',
                  style: TextStyle(color: Color(0xffFF3454), fontSize: 12.0)),
              Text('News',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Colors.black)),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder<List<UpdatesModel>>(
                future: fetchPosts(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? NewsList(news: snapshot.data)
                      : Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ));
  }
}

class NewsList extends StatelessWidget {
  final List<UpdatesModel> news;

  NewsList({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: news.length,
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  news[index].thumbnail,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 5,
            ),
            Text(
              news[index].title,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              news[index].excerpt,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff737474)),
            ),
            SizedBox(height: 7.0),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    timeago.format(DateTime.parse(news[index].date)),
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 9.5,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff737474)),
                  ),
                  Spacer(),
                  Icon(
                    Icons.more_vert,
                    color: Color(0xff737474),
                    size: 17,
                  )
                ]),
            SizedBox(
              height: 20,
            )
          ],
        );
      },
    );
  }
}
