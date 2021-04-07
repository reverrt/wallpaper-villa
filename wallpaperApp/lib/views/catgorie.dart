import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperApp/data/data.dart';
import 'package:wallpaperApp/model/wallpaper_model.dart';
import 'package:wallpaperApp/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Categorie extends StatefulWidget {
  final String categorieName;
  Categorie({this.categorieName});
  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<WallpaperModel> wallpapers = new List();

  TextEditingController searchController = new TextEditingController();
  getSearchWallpapers(String query) async {
    var response = await http.get(
        "https://api.pexels.com/v1/search?query=$query&per_page=18",
        headers: {"Authorization": apiKEY});

    //print(response.body.toString());
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
      //print(wallpaperModel.toString() + "  " + wallpaperModel.src.portrait);
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getSearchWallpapers(widget.categorieName);
    super.initState();
    searchController.text = widget.categorieName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              wallpapersList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
