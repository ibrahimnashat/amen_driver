import '../consts/exports.dart';

class Loader {
  static void show({required BuildContext context}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 0.0,
            contentPadding: const EdgeInsets.all(35.0),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35),
              borderSide: BorderSide.none,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                AwesomeLoader(
                  loaderType: AwesomeLoader.AwesomeLoader3,
                  color: Coolors.primaryColor,
                ),
              ],
            ),
          );
        });
  }

  static Widget empty() {
    return const SizedBox(
      height: 700,
      child: Center(
        child: MSvg(
          name: Svgs.empty,
          width: 300,
          height: 300,
        ),
      ),
    );
  }

  static Widget loading() {
    return const Center(
      child: AwesomeLoader(
        loaderType: AwesomeLoader.AwesomeLoader3,
        color: Coolors.primaryColor,
      ),
    );
  }

  static void dismiss(BuildContext context) => context.pop();
}
