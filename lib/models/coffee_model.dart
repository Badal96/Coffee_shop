class CoffeeModel {
  String? title;
  String? description;
  List<String>? ingredients;
  String? image;
  int? id;

  CoffeeModel(
      {this.title, this.description, this.ingredients, this.image, this.id});

  CoffeeModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    if (json['ingredients'] != null && json['ingredients'] is List) {
      ingredients = [];
      json['ingredients'].forEach((e) {
        ingredients!.add(e.toString());
      });
    }
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['ingredients'] = this.ingredients;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}

enum Ingredients {
  espresso,
  milk,
  chocolate,
  coffee,
  panela,
}
