import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/presentation/resurces/constants.dart';
import 'package:git_search/presentation/screens/favorite/bloc/favorite_bloc.dart';
import 'package:git_search/presentation/screens/favorite/bloc/favorite_state.dart';
// import 'package:get/get.dart';
// import 'package:git_search/presentation/resurces/constants.dart';
// import 'package:git_search/presentation/screens/favorite/favorite_controller.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        print(state.status);
        print(state.favoriteList);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state.status == LoadingStatus.loading)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CupertinoActivityIndicator(),
                  ],
                ),
              if (state.status == LoadingStatus.success)
                state.favoriteList != null && state.favoriteList!.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: double.infinity,
                              height: 55,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2F2F2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListTile(
                                leading: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  child: Text(
                                    state.favoriteList![index].name,
                                    style: kItemTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                trailing: InkWell(
                                  onTap: () {
                                    context
                                        .read<FavoriteBloc>()
                                        .add(DeleteFavoriteEvent(index: index));
                                  },
                                  child: state.favoriteList![index].isFavorite!
                                      ? SvgPicture.asset(
                                          "assets/icons/favorite.svg")
                                      : SvgPicture.asset(
                                          "assets/icons/favorite_active.svg"),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: state.favoriteList!.length,
                        ),
                      )
                    : Expanded(
                        child: Center(
                          child: Text(
                            "You have no favorites. \n Click on star while searching to add first favorite",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: kPlaceholderScreenTextStyle,
                          ),
                        ),
                      ),
            ],
          ),
        );
      },
    );
  }
}

// class FavoriteBody extends StatelessWidget {
//   const FavoriteBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FavoriteBloc, FavoriteState>(
//       builder: (context, state) {
//         print(state.status);
//         print(state.favoriteList);
//         return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   if (state.status == LoadingStatus.loading)
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CupertinoActivityIndicator(),
//                       ],
//                     ),
//                   if (state.status == LoadingStatus.success)
//                     state.favoriteList != [] || state.favoriteList!.isNotEmpty
//                         ? Expanded(
//                             child: ListView.separated(
//                                 shrinkWrap: true,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return Container(
//                                     width: double.infinity,
//                                     height: 55,
//                                     decoration: BoxDecoration(
//                                       color: const Color(0xFFF2F2F2),
//                                       borderRadius: BorderRadius.circular(10.0),
//                                     ),
//                                     child: ListTile(
//                                       leading: SizedBox(
//                                         width:
//                                             MediaQuery.of(context).size.width /
//                                                 1.3,
//                                         child: Text(
//                                           state.favoriteList![index].name,
//                                           style: kItemTextStyle,
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                         ),
//                                       ),
//                                       trailing: InkWell(
//                                         onTap: () {
//                                           context.read<FavoriteBloc>().add(
//                                               DeleteFavoriteEvent(
//                                                   index: index));
//                                         },
//                                         child: state.favoriteList![index]
//                                                 .isFavorite!
//                                             ? SvgPicture.asset(
//                                                 "assets/icons/favorite.svg")
//                                             : SvgPicture.asset(
//                                                 "assets/icons/favorite_active.svg"),
//                                       ),
//                                     ),
//                                   );
//                                 },
//                                 separatorBuilder:
//                                     (BuildContext context, int index) {
//                                   return const SizedBox(
//                                     height: 10,
//                                   );
//                                 },
//                                 itemCount: state.favoriteList!.length),
//                           )
//                         : Expanded(
//                             child: Center(
//                                 child: Text(
//                                     "You have no favorites. \n Click on star while searching to add first favorite",
//                                     textAlign: TextAlign.center,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: kPlaceholderScreenTextStyle)),
//                           ),
//                 ]));
//       },
//     );
//   }
// }
