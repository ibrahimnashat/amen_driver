// ignore_for_file: must_be_immutable

import 'package:clean_architecture/core/consts/exports.dart';
import 'package:clean_architecture/core/injection/injectable.dart';
import 'package:clean_architecture/features/auth/presentaion/logic_design/news/news_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreenDetails extends StatelessWidget {
  String id;
  NewsScreenDetails({super.key, required this.id});

  final _newsBloc = getIt<NewsBloc>();

  @override
  Widget build(BuildContext context) {
    _newsBloc.add(GetOneOfNewsListEvent(id: id));
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<NewsBloc, NewsState>(
          bloc: _newsBloc,
          builder: (context, state) {
            if (state is GetOneOfNewsListState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MText(
                    text: state.news.title,
                    fontFamily: FoontFamily.mulishBold,
                    fontSize: 16.0,
                    maxWidth: context.w * 0.9,
                    maxLines: 5,
                  ),
                  MText(
                    text: state.news.summary,
                    fontFamily: FoontFamily.mulishRegular,
                    fontSize: 12.0,
                    maxWidth: context.w * 0.9,
                    maxLines: 10,
                  ).mPadding(top: 8.0, bottom: 12.0),
                  MText(
                    text: state.news.link,
                    fontSize: 12.0,
                    fontFamily: FoontFamily.mulishRegular,
                    maxWidth: context.w * 0.9,
                    maxLines: 3,
                    fontColor: Coolors.blue,
                  ),
                ],
              ).mPadding(horizontal: 18.0, vertical: 20.0);
            }
            return const Center(child: CircularProgressIndicator())
                .mPadding(all: 50.0);
          },
        ),
      ),
    );
  }
}
