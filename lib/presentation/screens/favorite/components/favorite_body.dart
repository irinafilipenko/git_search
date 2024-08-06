import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/presentation/widgetes/custom_card.dart';
import 'package:git_search/presentation/resurces/app_strings.dart';
import 'package:git_search/presentation/resurces/constants.dart';
import 'package:git_search/presentation/screens/favorite/bloc/favorite_bloc.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    final (:status, :favoriteList) = context.select((FavoriteBloc bloc) {
      return (
        status: bloc.state.status,
        favoriteList: bloc.state.favoriteList,
      );
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (status == LoadingStatus.loading)
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoActivityIndicator(),
              ],
            ),
          if (status == LoadingStatus.success)
            favoriteList != null && favoriteList.isNotEmpty
                ? Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        final item = favoriteList[index];
                        return CustomCard(
                          item: item,
                          index: index,
                          onTap: () {
                            context
                                .read<FavoriteBloc>()
                                .add(DeleteFavoriteEvent(index: index));
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: favoriteList.length,
                    ),
                  )
                : Expanded(
                    child: Center(
                      child: Text(
                        AppStrings.favoriteEmptyListAlert,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: kPlaceholderScreenTextStyle,
                      ),
                    ),
                  ),
        ],
      ),
    );
  }
}
