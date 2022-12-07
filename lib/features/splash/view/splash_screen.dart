import 'package:amen_driver/core/consts/exports.dart';
import 'package:amen_driver/core/injection/injectable.dart';
import 'package:amen_driver/features/splash/logic_design/splash_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final _splashBloc = getIt<SplashBloc>();
  @override
  Widget build(BuildContext context) {
    _splashBloc.add(StartScreenEvent(context: context));
    return BlocBuilder<SplashBloc, SplashState>(
      bloc: _splashBloc,
      builder: (context, state) {
        if (state is StartScreenState) {
          return Scaffold(
            backgroundColor: Coolors.primaryColor,
            body: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: state.logoParts.map((e) {
                      return DelayedDisplay(
                        fadingDuration: const Duration(seconds: 2),
                        slidingCurve: Curves.easeInOutCubicEmphasized,
                        delay: const Duration(milliseconds: 400),
                        slidingBeginOffset: Offset(0, e["start"] as double),
                        child: MText(
                          text: e["title"].toString(),
                          fontColor: Coolors.white,
                          fontSize: FoontSize.font36,
                          fontFamily: FoontFamily.mulishMedium,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          maxWidth: context.w,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                PositionedDirectional(
                  bottom: -150,
                  start: -50,
                  end: -50,
                  child: MSvg(
                    name: Svgs.shadow,
                    width: context.w,
                    height: 450,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
