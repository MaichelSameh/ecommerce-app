import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../config/dir_config.dart';
import '../../config/palette.dart';
import '../../models/product_info.dart';
import '../../widgets/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  String title = "watches";
  List<ProductInfo> products = [];

  void initializeProducts() {
    //now let's create some products to see our UI
    for (int i = 0; i < 10; i++) {
      products.add(
        ProductInfo(
          categoryId: "categoryId",
          coverImageURL:
              "https://images.unsplash.com/photo-1585155770447-2f66e2a397b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZHVjdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
          createdAt: DateTime.now(),
          currency: "\$",
          description:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          id: "$i",
          imagesURLs: [
            "https://images.unsplash.com/photo-1610438235354-a6ae5528385c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YWlycG9kc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
            "https://images.unsplash.com/photo-1600375104627-c94c416deefa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YWlycG9kc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
            "https://images.unsplash.com/photo-1572569511254-d8f925fe2cbb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YWlycG9kc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
            "https://images.unsplash.com/photo-1600294037681-c80b4cb5b434?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YWlycG9kc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
            "https://images.unsplash.com/photo-1588423771073-b8903fbb85b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8YWlycG9kc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
            "https://images.unsplash.com/photo-1584635234347-ce88034d9501?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YWlycG9kc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
          ],
          likes: 1,
          price: 1,
          publisherId: "publisherId",
          rate: 1,
          title:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          brandId: "brandId",
          isFavorite: i % 2 == 0,
        ),
      );
      //nowLet's add some images to display
    }
  }

  //now we need to call it when this screen get activated
  @override
  void initState() {
    super.initState();
    initializeProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBar(),
        const SizedBox(height: 30),
        buildSearchBar(),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        CarouselSlider(
          items: products
              .map<Widget>(
                (product) => ProductCard(product: product),
              )
              .toList(),
          options: CarouselOptions(
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            height: 350,
            viewportFraction: 0.77,
          ),
        ),
      ],
    );
  }

  Row buildSearchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextField(
          width: 275,
          height: 50,
          controller: searchController,
          hint: "Search products....",
          suffixWidget: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              DirConfig.icons_dir + "search_icon" + DirConfig.icons_extension,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: MyPalette.secondary_color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            DirConfig.icons_dir + "filters_icon" + DirConfig.icons_extension,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
