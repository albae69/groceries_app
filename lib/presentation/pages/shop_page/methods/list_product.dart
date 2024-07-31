import 'package:flutter/material.dart';
import 'package:groceries_app/config/config.dart';
import 'package:groceries_app/domain/model/product.dart';
import 'package:groceries_app/presentation/misc/methods.dart';

class ListProduct extends StatelessWidget {
  final String? title;
  final List<Product>? data;
  final VoidCallbackAction? onTap;

  const ListProduct({super.key, required this.title, this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? 'title',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ThemeConfig.blackColor,
              ),
            ),
            Text('See All',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ThemeConfig.primaryColor,
                )),
          ],
        ),
        verticalSpace(20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: data!.isEmpty
                ? []
                : [
                    ...data!
                        .map(
                          (item) => Padding(
                            padding: EdgeInsets.only(
                              left: item == data?.first ? 0 : 16,
                            ),
                            child: SizedBox(
                              height: 248,
                              width: 175,
                              child: Container(
                                child: Column(
                                  children: [
                                    Image.network(
                                        'http://192.168.1.12:3001/${item.imageUrl}'),
                                    Text(item.productName),
                                    Text((item.price).toString()),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList()
                  ],
          ),
        ),
      ],
    ));
  }
}
