import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ghibliapi/src/components/text_row.dart';
import 'package:ghibliapi/src/models/ghibli_model.dart';

class ViewGhibli extends StatelessWidget {
  final GhibliModel ghibliModel;
  const ViewGhibli({Key? key, required this.ghibliModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ghibliModel.title!),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: ghibliModel.id!,
                  child: CachedNetworkImage(
                    imageUrl: ghibliModel.image!,
                    width: MediaQuery.of(context).size.width * 0.7,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                TextRow(title: "Title:", description: ghibliModel.title!),
                TextRow(
                    title: "Original title:",
                    description: ghibliModel.originalTitle!),
                TextRow(title: "Director:", description: ghibliModel.director!),
                TextRow(
                    title: "Release year:",
                    description: ghibliModel.releaseDate!),
                TextRow(
                  title: "Description:",
                  description: ghibliModel.description!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
