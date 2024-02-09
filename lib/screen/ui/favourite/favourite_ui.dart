// import 'package:block_test/screen/bloc/favourite/favourite_bloc.dart';
// import 'package:block_test/screen/models/favourite_item_models.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class FavouriteScreen extends StatelessWidget {
//   const FavouriteScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     context.read<FavouriteBloc>().add(FetchFavouriteList());
//     return Scaffold(
//       appBar: AppBar(title: const Text("Favourite app")),
//       body: BlocBuilder<FavouriteBloc, FavouriteState>(
//         builder: (context, state) {
//           switch (state.listStatus) {
//             case ListStatus.loading:
//               return const CircularProgressIndicator();
//             case ListStatus.success:
//               return ListView.builder(
//                   itemCount: state.favouriteItemList.length,
//                   itemBuilder: (context, index) {
//                     var data = state.favouriteItemList[index];
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Card(
//                         child: ListTile(
//                           title: Text(data.value),
//                           trailing: IconButton(
//                               onPressed: () {
//                                 FavouriteItemModel favouriteItemModel = FavouriteItemModel(id: data.id, value: data.value, isFavourite: data.isFavourite ? false : true);
//                                 print("Model : ${data.isFavourite}");
//                                 context.read<FavouriteBloc>().add(FavouriteItem(item: favouriteItemModel));
//                               }, 
//                               icon:  Icon(data.isFavourite ? Icons.favorite : Icons.favorite_outline)),
//                         ),
//                       ),
//                     );
//                   });
//             case ListStatus.failure:
//               return const Text("Something went wrong");
//           }
//         },
//       ),
//     );
//   }
// }
