import 'package:flutter/material.dart';
import 'package:nck/models/title_detail_model.dart';
import 'package:nck/models/title_model.dart';
import 'package:nck/bloc/details_bloc.dart';
import 'dart:convert';

class TitleDetails extends StatefulWidget {
  final TitleModel title;

  TitleDetails({this.title});

  _TitleDetailsState createState() => _TitleDetailsState();
}

class _TitleDetailsState extends State<TitleDetails> {
  String formattedDate;
  var months = [
    "",
    "January",
    "Febuary",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  @override
  void initState() {
    detailsBloc.fetchTitle(widget.title.id.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title.title} Detail'),
        backgroundColor: Color(0xff2c2d2d),
      ),
      body: Column(
        children: <Widget>[
          Container(
          height: 250,
          width: double.infinity,
          child: Hero(
                      child: Image.memory(base64Decode(widget.title.image),
                  width: double.infinity, fit: BoxFit.cover), tag: "imageTag"+widget.title.id.toString(),
          ),
        ),
          StreamBuilder(
            stream: detailsBloc.allTitles,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return buildDetail(snapshot);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }

  Widget buildDetail(AsyncSnapshot<TitleDetailModel> snapshot) {
    var detail = snapshot.data;
    DateTime date = DateTime.parse(widget.title.createdAt);
    formattedDate =
        "${months[date.month]} ${date.day}, ${date.year} at ${date.hour}:${date.minute}";

    return Column(
      children: <Widget>[
        
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[Text(formattedDate, style: TextStyle(fontSize: 17, color: Colors.white),)],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  widget.title.title,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(widget.title.description,style: TextStyle(fontSize: 20,color: Colors.white),),
            )],
          ),
        ),
      ],
    );
  }
}
