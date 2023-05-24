part of "../../login.dart";

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();
    final formKey = GlobalKey<FormState>();
    void submit() {
      if (!formKey.currentState!.validate()) return;
      context.read<AuthenticationBloc>().add(LoginButtonPressedEvent(
          user:
              UserEntity(phone: phoneCtrl.text, password: passwordCtrl.text)));
    }

    bool obs = true;
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Pding.paddingS, horizontal: Pding.paddingL),
            child: TextFormField(
                controller: phoneCtrl,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Phone number is empty!";
                  }
                  if (value.length < 11) {
                    return "Phone number must be 11 char!";
                  }
                  return null;
                },
                decoration: inputDeco(hint: "Enter your phone")),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: Pding.paddingS, horizontal: Pding.paddingL),
              child: StatefulBuilder(builder: (context, setState) {
                return TextFormField(
                    controller: passwordCtrl,
                    onFieldSubmitted: (value) => submit(),
                    obscureText: obs,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is empty!";
                      }
                      if (value.length < 6) {
                        return "Password is too short!";
                      }
                      return null;
                    },
                    decoration: inputDeco(
                        hint: "Password",
                        icon: InkWell(
                            onTap: () {
                              obs = !obs;
                              setState(() {});
                            },
                            child: Icon(obs
                                ? Icons.visibility
                                : Icons.visibility_off))));
              })),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: Pding.paddingS, horizontal: Pding.paddingL),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  textAlign: TextAlign.end,
                  style: safeGoogleFont(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff757575),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Pding.paddingHbtn),
            child: ElevatedButton(
              onPressed: submit,
              child: Text(
                'Login',
                style: safeGoogleFont(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  InputDecoration inputDeco({required String hint, Widget? icon}) =>
      InputDecoration(
          hintText: hint,
          suffixIcon: icon,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
          hintStyle: safeGoogleFont(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xff8b8fa0),
          ));
}
