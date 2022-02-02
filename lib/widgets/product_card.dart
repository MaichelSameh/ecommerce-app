import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/palette.dart';
import '../config/dir_config.dart';
import '../models/product_info.dart';
import 'custom_button.dart';

class ProductCard extends StatelessWidget {
  final ProductInfo product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 285,
      decoration: BoxDecoration(
        color: MyPalette.secondary_color,
        boxShadow: MyPalette.secondary_shadow,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImage(context),
          buildBodyText(context),
          buildFooter(context),
        ],
      ),
    );
  }

  /// in this widget you gonna find:
  /// - the product price
  /// - the add to cart button
  Flexible buildFooter(BuildContext context) {
    return Flexible(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomButton(
                width: 200,
                height: 40,
                child: Text("Add to cart"),
              ),
              Row(
                children: [
                  Text(
                    product.price.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    " ",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    product.currency.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// in this widget you gonna find:
  /// - the product title
  /// - the product description
  Padding buildBodyText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            width: 150,
            height: 35,
            child: Text(
              product.title,
              style: Theme.of(context).textTheme.headline2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 150,
            child: Text(
              product.description,
              style: Theme.of(context).textTheme.bodyText2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }

  /// in this widget you gonna find:
  /// - the love button
  /// - the rate budget
  /// - the product cover image
  Stack buildImage(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(product.coverImage),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: Container(
            height: 160,
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(133, 133, 133, 1),
                  Color.fromRGBO(0, 0, 0, 1),
                ],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  DirConfig.icons_dir +
                      "love" +
                      (product.isFavorite ? "_bordered_icon" : "_icon") +
                      DirConfig.icons_extension,
                  color: const Color.fromRGBO(217, 63, 47, 1),
                  height: 25,
                ),
                Container(
                  height: 35,
                  width: 70,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(69, 77, 90, 0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        DirConfig.icons_dir +
                            "star_icon" +
                            DirConfig.icons_extension,
                      ),
                      Text(
                        product.rate.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
