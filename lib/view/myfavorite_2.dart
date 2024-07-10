import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider/favorite_provider.dart';

class MyFavoriteScreen extends StatefulWidget {
  const MyFavoriteScreen({super.key});

  @override
  State<MyFavoriteScreen> createState() => _MyFavoriteScreenState();
}

class _MyFavoriteScreenState extends State<MyFavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Favorites'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favoriteProvider.seletedItems.length,
                itemBuilder: ((context, index) {
                  return Consumer<FavoriteProvider>(
                      builder: ((context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.seletedItems.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      leading: const Icon(Icons.gif_box),
                      title: Text('item $index'),
                      trailing: Icon(value.seletedItems.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border),
                    );
                  }));
                })),
          )
        ],
      ),
    );
  }
}
