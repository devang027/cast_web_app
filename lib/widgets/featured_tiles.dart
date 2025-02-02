import 'package:demo_web_app/utils/app_strings.dart';
import 'package:flutter/material.dart';

class ProductTiles extends StatefulWidget {
  const ProductTiles({super.key, required this.screenSize});

  final Size screenSize;

  @override
  _ProductTilesState createState() => _ProductTilesState();
}

class _ProductTilesState extends State<ProductTiles> {
  final ScrollController _scrollController = ScrollController();

  final List<String> assets = AppStrings.imagePaths;

  final List<String> title = AppStrings.imagePathsName;

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - widget.screenSize.width / 2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + widget.screenSize.width / 2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.screenSize.height * 0.06,
        left: widget.screenSize.width / 15,
        right: widget.screenSize.width / 15,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: _scrollLeft,
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(assets.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: widget.screenSize.width / 6,
                              width: widget.screenSize.width / 3.8,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  assets[index],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: widget.screenSize.height / 70),
                              child: Text(
                                title[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppStrings.fontMontserrat,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .titleMedium!
                                      .color,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: _scrollRight,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
