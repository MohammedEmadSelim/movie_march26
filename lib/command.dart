
      //  custom_text_field(
      //         text: 'Search',
      //         iconData: Icons.search,
      //         on_change: (value) {
      //           if (value.isEmpty) {
      //             // عندما يمسح المستخدم النص بالكامل
      //             context.read<SearchCubitCubit>().clearSearch();
      //           } else {
      //             // عند كتابة أي نص يبدأ بالبحث
      //             context.read<SearchCubitCubit>().get_search(value);
      //           }
      //         },
      //       ),
      // import 'dart:collection';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movie_app_march26/Search/presentation/controller/cubit/search_cubit_cubit.dart';
// import 'package:movie_app_march26/Search/presentation/widgets/card_movie.dart';
// import 'package:movie_app_march26/core/theme/AppColor.dart';
// import 'package:movie_app_march26/core/theme/widgets/loading_circler.dart';
// import 'package:movie_app_march26/home/data/modules/Movie_model.dart';
// import 'package:movie_app_march26/home/presentation/widgets/custom_text_field.dart';

// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   final TextEditingController _searchController = TextEditingController();
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Appcolor.prim_color,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(
//             Icons
//                 .arrow_back_ios_new, // شكل سهم الـ iOS الأنيق، أو استخدم Icons.arrow_back
//             color: Appcolor.seco_color, // لون السهم نفس لون النص
//             size: 18, // حجم السهم
//           ),
//           onPressed: () {
//             Navigator.pop(context); // أمر الرجوع للصفحة السابقة
//           },
//         ),
//         backgroundColor: Appcolor.prim_color,
//         centerTitle: true,
//         title: Text(
//           'Search',
//           style: TextStyle(color: Appcolor.seco_color, fontSize: 18),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Icon(
//               Icons.error_outline,
//               color: Appcolor.seco_color,
//               size: 20,
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: [
//             custom_text_field(
//               text: "Search movies...",
//               iconData: Icons.search,
//               controller: _searchController, // تمرير الـ Controller
//               on_change: (value) {
//                 if (value.trim().isEmpty) {
//                   context.read<SearchCubitCubit>().clearSearch();
//                 } else {
//                   context.read<SearchCubitCubit>().get_search(value);
//                 }
//               },
//               on_clear: () {
//                 // هذه الدالة تنفذ عند الضغط على زر X لمسح النص فوراً
//                 context.read<SearchCubitCubit>().clearSearch();
//                 setState(() {}); // لإخفاء زر الـ X وإعادة الأيقونة الأساسية
//               },
//             ),

//             SizedBox(height: 15),
//             BlocBuilder<SearchCubitCubit, SearchCubitState>(
//               builder: (context, state) {
//                 if (state is SearchCubitLoading) {
//                   return loading_circler();
//                 } else if (state is SearchCubitSuccess) {
//                   List<MovieModel> moveies = state.moveies;
//                   if (moveies.isEmpty) {
//                     return const Expanded(
//                       child: Center(
//                         child: Text(
//                           'No movies found matching your search.',
//                           style: TextStyle(color: Colors.grey, fontSize: 16),
//                         ),
//                       ),
//                     );
//                   }
//                   return Expanded(
//                     child: ListView.separated(
//                       itemCount: moveies.length,
//                       padding: EdgeInsets.symmetric(horizontal: 10),
//                       separatorBuilder: (context, index) =>
//                           SizedBox(height: 15),
//                       itemBuilder: (context, index) => Card_movie(movie: moveies[index],),
//                     ),
//                   );
//                 } else if (state is SearchCubitFailure) {
//                   return Expanded(
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(24.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.error_outline_rounded,
//                               size: 70,
//                               color: Colors.red.shade300,
//                             ),
//                             const SizedBox(height: 16),
//                             Text(
//                               'Oops, something went wrong!',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.grey.shade300,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               state.errorMessage,
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 14,
//                               ),
//                             ),
//                             const SizedBox(height: 24),
//                             ElevatedButton.icon(
//                               onPressed: () {
//                                 context.read<SearchCubitCubit>().get_search(
//                                   "batman",
//                                 );
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.amber,
//                                 foregroundColor: Colors.black,
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 24,
//                                   vertical: 12,
//                                 ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 elevation: 0,
//                               ),
//                               icon: const Icon(Icons.refresh_rounded),
//                               label: const Text(
//                                 "Retry",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 } else if (state is SearchCubitInitial) {
//                   // الحالة الابتدائية (Initial State) قبل أن يبدأ المستخدم بالبحث
//                   return  Expanded(
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.movie_filter_outlined,
//                             size: 80,
//                             color: Appcolor.sev_color,
//                           ),
//                           SizedBox(height: 16),
//                           Text(
//                             "Search for your favorite movies!",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w500,
//                               color: Appcolor.eigh_color,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 } else {
//                   return Text('No Found');
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
   // child: Image.network(
          //   // 220 
          //   // 250
          //   "https://image.tmdb.org/t/p/w500${data[index].posterPath}",
          //   height: 220,
          //   width: 250,
          //   fit: BoxFit.cover,
          // ),