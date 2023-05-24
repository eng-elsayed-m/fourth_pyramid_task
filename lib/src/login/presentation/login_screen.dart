part of "../login.dart";

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => sl<AuthenticationBloc>(),
        child: BlocConsumer<AuthenticationBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushReplacementNamed(context, "/main");
            }
          },
          builder: (context, state) {
            return Stack(
              fit: StackFit.expand,
              children: [
                const LoginPaint(),
                Column(
                  children: [
                    SizedBox(height: size.height * 0.14),
                    EntranceFader(
                      child: Text(
                        'Login',
                        style: safeGoogleFont(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff000000),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.14),
                    const EntranceFader(child: LoginForm()),
                  ],
                ),
                if (state is AuthLoading) ...[
                  const ModalBarrier(color: Colors.black38),
                  const AppLoader(),
                ]
              ],
            );
          },
        ),
      ),
    );
  }
}
