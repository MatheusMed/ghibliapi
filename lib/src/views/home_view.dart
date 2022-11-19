import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ghibliapi/src/controllers/home_controller.dart';
import 'package:ghibliapi/src/services/get_services_ghibli/get_service_ghibli_imp.dart';
import 'package:ghibliapi/src/services/http/http_client_imp.dart';
import 'package:ghibliapi/src/views/view_ghibli.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =
        HomeController(GetServiceGhibliImp(HttpClientImp(Dio())));

    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
            valueListenable: controller.searchTap,
            builder: (context, valor, child) {
              return valor == true
                  ? TextFormField(
                      controller: controller.controllerSearch,
                      onChanged: (value) => controller.searchFilms(value),
                      decoration:
                          InputDecoration(label: Text("Pesquise o filme")),
                    )
                  : const Text('Ghibli List Movie');
            }),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => controller.saveRequest(),
              icon: const Icon(Icons.refresh)),
          ValueListenableBuilder(
              valueListenable: controller.searchTap,
              builder: (context, valor, child) {
                return IconButton(
                  onPressed: () => controller.togleSearch(),
                  icon: valor == false ? Icon(Icons.search) : Icon(Icons.close),
                );
              }),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.listValeu,
        builder: (context, lista, child) {
          return controller.isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                    backgroundColor: Colors.brown,
                  ),
                )
              : ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    final item = lista[index];
                    return ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewGhibli(ghibliModel: item),
                          )),
                      leading: CachedNetworkImage(
                        imageUrl: item.image!,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      title: Text(item.title!),
                      subtitle: Text(item.director!),
                    );
                  },
                );
        },
      ),
    );
  }
}
