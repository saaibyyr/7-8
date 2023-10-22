import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_formreg_aierke/bloc/avto_bloc.dart';
import 'package:flutter_formreg_aierke/bloc/avto_event.dart';
import 'package:flutter_formreg_aierke/bloc/avto_state.dart';
import 'package:flutter_formreg_aierke/generated/codegen_loader.g.dart';
import 'package:flutter_formreg_aierke/generated/locale_keys.g.dart';
import 'package:flutter_formreg_aierke/userdetailspage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ru'), Locale('kk')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        assetLoader: CodegenLoader(),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: CCC(),
    );
  }
}

class CCC extends StatefulWidget {
  @override
  _CCCState createState() => _CCCState();
}

class _CCCState extends State<CCC> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final NewUser newUser = NewUser(
    fullName: '',
    phoneNumber: '',
    email: '',
    country: '',
    about: '',
    password: '',
    confirmPassword: '',
  );

  final _avtoBloc = AvtoBloc();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  List<String> countries = ['USA', 'Canada', 'UK', 'Australia'];

  @override
  void dispose() {
    _avtoBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Регистрация пользователя'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: LocaleKeys.name.tr()),
                    onSaved: (value) {
                      newUser.fullName = value!;
                    },
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: LocaleKeys.phone.tr()),
                    onSaved: (value) {
                      newUser.phoneNumber = value!;
                    },
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: LocaleKeys.mail.tr()),
                    onSaved: (value) {
                      newUser.email = value!;
                    },
                  ),
                  DropDownField(
                    value: newUser.country,
                    labelText: LocaleKeys.country.tr(),
                    items: countries,
                    setter: (dynamic newValue) {
                      newUser.country = newValue;
                    },
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: LocaleKeys.life.tr()),
                    onSaved: (value) {
                      newUser.about = value!;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration:
                        InputDecoration(labelText: LocaleKeys.password.tr()),
                    obscureText: true,
                  ),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(labelText: LocaleKeys.rec.tr()),
                    obscureText: true,
                    validator: (valuenew) {
                      if (valuenew != _passwordController.text) {
                        return 'Пароли не совпадают';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        _avtoBloc.dispatch(PostUserDetailsEvent(newUser));
                      }
                    },
                    child: Text(LocaleKeys.Register.tr()),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      context.setLocale(Locale('kk'));
                    },
                    child: const Text('Казахский'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.setLocale(Locale('ru'));
                    },
                    child: const Text('Русский'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.setLocale(Locale('en'));
                    },
                    child: const Text('English'),
                  ),
                  StreamBuilder<AvtoState>(
                    stream: _avtoBloc.state,
                    builder: (context, snapshot) {
                      if (snapshot.data is LoadingState) {
                        return CircularProgressIndicator();
                      } else if (snapshot.data is ErrorState) {
                        final errorState = snapshot.data as ErrorState;
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(errorState.message)));
                        return SizedBox.shrink();
                      } else if (snapshot.data is SuccessState) {
                        Future.microtask(() {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) =>
                                  UserDetailsPage(newUser: newUser),
                            ),
                          );
                        });
                        return SizedBox.shrink();
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NewUser {
  String fullName = '';
  String phoneNumber = '';
  String email = '';
  String country = '';
  String about = '';
  String password = '';
  String confirmPassword = '';

  NewUser({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.country,
    required this.about,
    required this.password,
    required this.confirmPassword,
  });
}
