import 'dart:ui';

class CategoryModel {
  String id;
  String name;
  String image;
  Color color;
  CategoryModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.color});
  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          id: 'business', name: 'Business', image: 'assets/bussines.png', color: Color(0xffCF7E48)),
      CategoryModel(
          id: 'entertainment',
          name: 'Entertainment',
          image: 'assets/environment.png',
          color: Color(0xff4882CF)),
      CategoryModel(
          id: 'general', name: 'General', image: 'assets/Politics.png', color: Color(0xff003E90)),
      CategoryModel(
          id: 'health', name: 'Health', image: 'assets/health.png', color: Color(0xffED1E79)),
      CategoryModel(
          id: 'science', name: 'Science', image: 'assets/science.png', color: Color(0xffF2D352)),
      CategoryModel(
          id: 'sports', name: 'Sports', image: 'assets/sports.png', color: Color(0xffC91C22)),
      CategoryModel(
          id: 'technology', name: 'Technology', image: 'assets/technology.png', color: Color(
          0xff52f2cd)),
    ];
  }
}
