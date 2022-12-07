import 'package:amen_driver/core/consts/exports.dart';
import 'package:amen_driver/core/injection/injectable.dart';
import 'package:amen_driver/features/auth/presentaion/logic_design/sign_up/sign_up_bloc.dart';
import 'package:country_calling_code_picker/country_code_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signUpBloc = getIt<SignUpBloc>();
  @override
  void initState() {
    _signUpBloc.add(DefaultCountryCodeEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              width: context.w,
              height: 300,
              child: Stack(
                children: [
                  PositionedDirectional(
                    top: -100,
                    bottom: 0,
                    start: -80,
                    end: -80,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Coolors.primaryColor,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(1000),
                        ),
                      ),
                      child: Stack(
                        children: const [
                          PositionedDirectional(
                            top: -20,
                            bottom: -100,
                            start: -50,
                            end: -50,
                            child: MSvg(
                              name: Svgs.shadow,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                const MSvg(
                  name: Svgs.logo,
                  width: 200,
                  height: 60,
                ).mPadding(bottom: 21.0),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: MText(
                    text: "Phone Number",
                    fontFamily: FoontFamily.mulishBold,
                    fontSize: FoontSize.font18,
                  ).mPadding(bottom: 12.0),
                ),
                MTextFiled(
                  prefix: BlocBuilder<SignUpBloc, SignUpState>(
                    bloc: _signUpBloc,
                    builder: (context, state) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (state is HasCountryCodeState)
                                Image.asset(
                                  state.countryCode.flag,
                                  package: countryCodePackageName,
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.contain,
                                ),
                              if (state is HasCountryCodeState)
                                MText(
                                  text: state.countryCode.name,
                                  fontSize: FoontSize.font16,
                                  fontColor: Coolors.black,
                                ),
                            ],
                          ),
                          Container(
                            height: 40,
                            width: 1,
                            color: Coolors.borderColor,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                          )
                        ],
                      ).mAddAction(
                        onTap: () {
                          _signUpBloc
                              .add(SetCountryCodeEvent(context: context));
                        },
                      ).mPadding(start: 10.0, vertical: 5.0);
                    },
                  ),
                  paddingHorizontal: 20.0,
                  paddingVertical: 12.0,
                  textSize: FoontSize.font22,
                  fillColor: Coolors.highLight,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Coolors.borderColor,
                      width: 0.5,
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  filled: true,
                ),
                MText(
                  text:
                      "The phone number you enter here will be used for the registration process And to enter the application at any time, make sure that the phone belongs to you",
                  fontColor: Coolors.red,
                  fontFamily: FoontFamily.mulishMedium,
                  fontSize: FoontSize.font14,
                  maxLines: 5,
                  maxWidth: context.w * 0.95,
                ).mPadding(bottom: context.h * 0.15, top: 12.0),
                MBouncingButton(
                  title: "Sign Up",
                )
              ],
            ).mPadding(vertical: 50.0, horizontal: 24.0)
          ],
        ),
      ),
    );
  }
}
