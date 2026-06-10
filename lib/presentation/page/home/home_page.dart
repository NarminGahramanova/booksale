import 'package:booksale/core/navigation/custom_navigation_helper.dart';
import 'package:booksale/core/theme/app_colors.dart';
import 'package:booksale/presentation/page/home/bloc/home_bloc.dart';
import 'package:booksale/presentation/page/home/product_lists_type.dart';
import 'package:booksale/presentation/page/home/search_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/book_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(LoadBooks()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            scrolledUnderElevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  context.go(CustomNavigationHelper.notficationsPath);
                },
                icon: Icon(
                  Icons.notifications_outlined,
                  color: AppColors.primaryBrown,
                ),
              ),
            ],
            title: Text(
              'Kitab Bazari',

              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: "Newsreader",
                fontStyle: FontStyle.italic,
                color: AppColors.primaryBrown,
              ),
            ),
            centerTitle: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is HomeLoaded) {
                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: 'Kitabxanada yeni\nbir',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontFamily: "Newsreader",
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '\nhekayə tapın.',
                                    style: TextStyle(
                                      color: AppColors.primaryBrown,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _StickyHeaderDelegate(
                          child: Container(
                            color: AppColors.backgroundColor,
                            padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                            child: Column(
                              children: [
                                SearchButton(),
                                SizedBox(height: 10),
                                ProductListsType(),
                              ],
                            ),
                          ),
                          height: 132,
                        ),
                      ),

                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) =>
                              BookCard(book: state.filteredBooks[index]),
                          childCount: state.filteredBooks.length,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.65,
                            ),
                      ),
                    ],
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _StickyHeaderDelegate({required this.child, required this.height});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(_StickyHeaderDelegate oldDelegate) => false;
}
