import 'package:clean_architecture/core/consts/exports.dart';
import 'package:clean_architecture/core/injection/injectable.dart';
import 'package:clean_architecture/features/auth/presentaion/logic_design/news/news_bloc.dart';
import 'package:clean_architecture/features/auth/presentaion/view/news/widgets/news_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  final _newsBloc = getIt<NewsBloc>();

  @override
  Widget build(BuildContext context) {
    _newsBloc.add(GetAllNewsListEvent());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MText(
              text: "News",
              fontFamily: FoontFamily.mulishBold,
              fontSize: 20.0,
            ).mPadding(vertical: 12.0),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: BlocBuilder<NewsBloc, NewsState>(
                  bloc: _newsBloc,
                  builder: (context, state) {
                    if (state is GetAllNewsList) {
                      return Column(
                        children: state.listOfNews.map((e) {
                          return NewsItem(news: e);
                        }).toList(),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator())
                          .mPadding(all: 50.0);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
