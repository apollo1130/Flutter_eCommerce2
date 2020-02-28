import 'package:ecommers/core/provider_models/sign_up_provider_model.dart';
import 'package:ecommers/generated/i18n.dart';
import 'package:ecommers/ui/decorations/assets.dart';
import 'package:ecommers/ui/decorations/dimens/index.dart';
import 'package:ecommers/ui/decorations/index.dart';
import 'package:ecommers/ui/pages/authorization/index.dart';
import 'package:ecommers/ui/widgets/authorization/index.dart';
import 'package:ecommers/ui/widgets/button/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localization = I18n.of(context);
    final provider = Provider.of<SignUpProviderModel>(context, listen: false);

    return AuthorizationTabBase(
      children: <Widget>[
        const SizedBox(height: Insets.x5),
        AuthTextFieldAreaContainer(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AuthTextField(
                labelText: localization.email,
                keyboardType: TextInputType.emailAddress,
                assetIconPath: Assets.mailIcon,
              ),
              AuthTextField(
                labelText: localization.username,
                assetIconPath: Assets.profileIcon,
              ),
              AuthTextField(
                labelText: localization.password,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                assetIconPath: Assets.passwordIcon,
              ),
            ],
          ),
        ),
        const SizedBox(height: Insets.x3_5),
        PrimaryButtonWidget(
          text: localization.signUp,
          assetIconPath: Assets.arrowRightIcon,
          onPressedFunction: () {},
        ),
        const SizedBox(height: Insets.x8_5),
        AuthRichText(textSpanModelList: provider.bottomText),
      ],
    );
  }
}
