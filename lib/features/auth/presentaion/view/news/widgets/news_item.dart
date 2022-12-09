import 'package:clean_architecture/core/consts/exports.dart';
import 'package:clean_architecture/features/auth/domain/entity/news.dart';
import 'package:clean_architecture/features/auth/presentaion/view/news/news_screen_details.dart';

class NewsItem extends StatelessWidget {
  final News news;

  const NewsItem({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Coolors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(35),
      ),
      padding: const EdgeInsets.all(21.0),
      margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MText(
            text: news.title,
            fontFamily: FoontFamily.mulishBold,
            fontSize: 20.0,
            maxWidth: context.w * 0.9,
            maxLines: 5,
          ),
          MText(
            text: news.summary,
            fontFamily: FoontFamily.mulishRegular,
            fontSize: 16.0,
            maxWidth: context.w * 0.9,
            maxLines: 10,
          ).mPadding(top: 8.0, bottom: 12.0),
          MText(
            text: news.link,
            fontSize: 16.0,
            fontFamily: FoontFamily.mulishRegular,
            maxWidth: context.w * 0.9,
            maxLines: 3,
            fontColor: Coolors.blue,
          ),
        ],
      ),
    ).mAddAction(
        onTap: () => context.push(NewsScreenDetails(id: news.id.toString())));
  }
}
