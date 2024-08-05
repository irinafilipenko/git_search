import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/presentation/components/custom_card.dart';
import 'package:git_search/presentation/resurces/app_strings.dart';
import 'package:git_search/presentation/resurces/constants.dart';
import 'package:git_search/presentation/screens/favorite/bloc/favorite_bloc.dart';
import 'package:git_search/presentation/screens/favorite/bloc/favorite_state.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state.status == LoadingStatus.loading)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoActivityIndicator(),
                  ],
                ),
              if (state.status == LoadingStatus.success)
                state.favoriteList != null && state.favoriteList!.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final item = state.favoriteList![index];
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
                          itemCount: state.favoriteList!.length,
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
      },
    );
  }
}
