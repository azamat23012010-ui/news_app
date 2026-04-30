import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/features/home/cubit/home_cubit.dart';
import 'package:news_app/src/features/home/cubit/home_state.dart';
import 'package:news_app/src/features/home/widgets/app_bar_widget.dart';
import 'package:news_app/src/features/home/widgets/categories_widget.dart';
import 'package:news_app/src/features/home/widgets/error_widget.dart';
import 'package:news_app/src/features/home/widgets/loading_widget.dart';
import 'package:news_app/src/features/home/widgets/news_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: NewsAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                int index = 0; // default

                if (state is HomeLoadedState) {
                  index = state.index;
                }

                return Categories(
                  newindex: index,
                  categories: ["apple", "tesla", "top"],
                );
              },
            ),

            const SizedBox(height: 27),

            Expanded(
              // obshiy expanded qoydim bittalab yozmaslikka
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeErrorState) {
                    return CustomErrorWidget(errorText: state.errorText);
                  } else if (state is HomeLoadingState) {
                    return LoadingWidget();
                  } else if (state is HomeLoadedState) {
                    return NewsWidget(model: state.model);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
