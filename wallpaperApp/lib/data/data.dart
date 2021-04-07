import 'package:wallpaperApp/model/categorie_model.dart';

String apiKEY = "563492ad6f917000010000010517ff114f4849f8b908b39213eafd26";

List<CategorieModel> getCategories() {
  List<CategorieModel> list = new List();
  CategorieModel model = new CategorieModel();
  model.categorieName = 'Street Art';
  model.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  list.add(model);

  model = new CategorieModel();
  model.categorieName = 'Wild Life';
  model.imgUrl =
      "https://images.pexels.com/photos/46519/leopard-cat-big-cat-wildcat-46519.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  list.add(model);

  model = new CategorieModel();
  model.categorieName = 'Nature';
  model.imgUrl =
      "https://images.pexels.com/photos/1785493/pexels-photo-1785493.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  list.add(model);

  model = new CategorieModel();
  model.categorieName = 'City';
  model.imgUrl =
      "https://images.pexels.com/photos/3876782/pexels-photo-3876782.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  list.add(model);

  model = new CategorieModel();
  model.categorieName = 'Motivation';
  model.imgUrl =
      "https://images.pexels.com/photos/1742370/pexels-photo-1742370.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  list.add(model);

  model = new CategorieModel();
  model.categorieName = 'Bikes';
  model.imgUrl =
      "https://images.pexels.com/photos/1191109/pexels-photo-1191109.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  list.add(model);

  model = new CategorieModel();
  model.categorieName = 'Cars';
  model.imgUrl =
      "https://images.pexels.com/photos/4024484/pexels-photo-4024484.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  list.add(model);

  return list;
}
