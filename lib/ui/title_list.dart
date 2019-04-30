import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:nck/bloc/titles_bloc.dart';
import 'package:nck/models/title_model.dart';
import 'package:nck/ui/title_details.dart';

class TitleList extends StatefulWidget {
  TitleList({Key key}) : super(key: key);

  _TitleListState createState() => _TitleListState();
}

class _TitleListState extends State<TitleList> {
  @override
  void initState() {
    bloc.fetchAllTitles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NCK Titles"),
        backgroundColor: Color(0xff2c2d2d),
      ),
      body: StreamBuilder(
        stream: bloc.allTitles,
        builder: (context, AsyncSnapshot<Titles> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

Widget buildList(AsyncSnapshot<Titles> snapshot) {
  return GridView.builder(
      itemCount: snapshot.data.usersModel.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          child: InkResponse(
            enableFeedback: true,
            child: Column(
              children: <Widget>[
                Hero(child: imageFromBase64String(snapshot.data.usersModel[index].image), tag: "imageTag"+index.toString(),),
                Text(snapshot.data.usersModel[index].title,style: TextStyle(color: Colors.white),),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TitleDetails(
                            title: snapshot.data.usersModel[index],
                          )));
            },
          ),
        );
      });
}

// openDetailPage(Users data, int index) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) {
//       return UserDetails(
//         name: data.usersModel[index].name,
//         userName: data.usersModel[index].userName,
//         id: data.usersModel[index].id,
//         address: data.usersModel[index].address,
//         phone: data.usersModel[index].phone,
//         website: data.usersModel[index].website,
//         email: data.usersModel[index].email,

//       );
//     }),
//   );
// }

Image imageFromBase64String(String base64String) {
  return Image.memory(base64Decode(base64String));
}
