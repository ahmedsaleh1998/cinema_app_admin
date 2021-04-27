class Film {
  String id;
  String title;
  String description;
  String time;
  String image;
  int numberofchairs;

  String catigory;
  List<Chair> chairslist;
  Film(
      {this.title,
      this.description,
      this.catigory,
      this.image,
      this.time,
      this.id,
      this.numberofchairs,
      this.chairslist});
}

class Chair {
  int number;
  String state;
  Chair({this.number, this.state});
}
