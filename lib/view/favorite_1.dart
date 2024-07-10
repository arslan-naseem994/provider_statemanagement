import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider/favorite_provider.dart';
import 'package:provider_state/view/myfavorite_2.dart';

class FavoriteProviderScreen extends StatefulWidget {
  const FavoriteProviderScreen({super.key});

  @override
  State<FavoriteProviderScreen> createState() => _FavoriteProviderScreenState();
}

class _FavoriteProviderScreenState extends State<FavoriteProviderScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyFavoriteScreen()));
              },
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
          title: const Text('Favorites'),
        ),
        body: Column(
          children: [
            Expanded(child: ListView.builder(itemBuilder: ((context, index) {
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
                  leading: Text(
                    '${index + 1}',
                  ),
                  title: Text('Item Name ${index + 1}'),
                  trailing: Icon(value.seletedItems.contains(index)
                      ? Icons.favorite
                      : Icons.favorite_border),
                );
              }));
            }))),
          ],
        ));
  }
}
