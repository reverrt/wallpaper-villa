import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperApp/data/data.dart';
import 'package:wallpaperApp/model/wallpaper_model.dart';
import 'package:wallpaperApp/widgets/widget.dart';
import 'package:http/http.dart' as http;

class SearchView extends StatefulWidget {
  final String searchQuery;
  SearchView({this.searchQuery});
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
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
    getSearchWallpapers(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
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
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5F5f5),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: 'search', border: InputBorder.none),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          getSearchWallpapers(searchController.text);
                        },
                        child: Icon(Icons.search)),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              wallpapersList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
