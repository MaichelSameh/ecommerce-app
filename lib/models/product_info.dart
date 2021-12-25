import 'package:intl/intl.dart';

class ProductInfo {
  //Now let's create the class constructor
  ProductInfo({
    required String categoryId,
    required String coverImageURL,
    required DateTime createdAt,
    required String currency,
    required String description,
    required String id,
    required List<String> imagesURLs,
    required int likes,
    required double price,
    required String publisherId,
    required double rate,
    required String title,
  }) {
    _categoryId = categoryId;
    _coverImageURL = coverImageURL;
    _createdAt = createdAt;
    _currency = currency;
    _description = description;
    _id = id;
    _images = imagesURLs;
    _likes = likes;
    _price = price;
    _publisherId = publisherId;
    _rate = rate;
    _title = title;
  }

  //Now we need to create a constructor for the firebase
  ProductInfo.fromFirebase(Map<String, dynamic> data, String id) {
    _categoryId = data["category_id"];
    _coverImageURL = data["cover_image"];
    _createdAt = DateTime.parse(data["created_at"]);
    _currency = data["currency"];
    _description = data["description"];
    _id = id;
    _images = data["images"];
    _likes = data["likes"];
    _price = data["price"];
    _publisherId = data["publisher_id"];
    _rate = data["rate"];
    _title = data["title"];
  }

  late String _categoryId;
  late String _coverImageURL;
  late DateTime _createdAt;
  late String _currency;
  late String _description;
  late String _id;
  late List<String> _images;
  late int _likes;
  late double _price;
  late String _publisherId;
  late double _rate;
  late String _title;

  //Now lets create a toMap function so we can convert the product to json format easily
  Map<String, dynamic> toMap() {
    //Here we need to import the intl package
    return {
      "category_id": categoryId,
      "cover_image": coverImage,
      "created_at": DateFormat("yyyy-MM-dd hh:mm:ss", "en").format(createdAt),
      "currency": currency,
      "description": description,
      "likes": likesCount,
      "price": price,
      "publisher_id": publisherId,
      "rate": rate,
      "title": title,
    };
  }

  //Let's first create the getter methods
  //in this variable we are storing the category id, to reference on the category on which this product came from
  String get categoryId => _categoryId;

  //This variables present the image's link on the product card
  String get coverImage => _coverImageURL;

  //the date on which this product is created
  DateTime get createdAt => _createdAt;

  //the currency of the price
  String get currency => _currency;

  //the description of the product
  String get description => _description;

  //the id of the product as it's present in the firestore database
  String get id => _id;

  //this list is holding the images of the product to be displayed in the details screen
  List<String> get images => _images;

  //the number of persons that liked this product
  int get likesCount => _likes;

  //the price of the product
  double get price => _price;

  //the seller id
  String get publisherId => _publisherId;

  //the rate of the product
  double get rate => _rate;

  //the title of the product
  String get title => _title;

  @override
  String toString() {
    String images = "[\n";
    for (String image in this.images) {
      image += "\t" + image + ",\n";
    }
    images += "]";
    return '''
      ProductInfo(
        categoryId: $categoryId,
        coverImage: $coverImage,
        currency: $currency,
        description: $description,
        id: $id,
        images: $images,
        likesCount: $likesCount,
        price: $price,
        publisherId: $publisherId,
        rate: $rate,
        title: $title,
      );
    ''';
  }
}
