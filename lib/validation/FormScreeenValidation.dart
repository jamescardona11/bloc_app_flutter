import 'package:blocappflutter/validation/mixin_helper.dart';
import 'package:blocappflutter/validation/validation_sample/validation_sample_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormScreen extends StatefulWidget {
  //static const String pageRoute = 'FormScreeenValidation_route_id';

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  FormScreenValidationBloc _bloc;

  final _emailController = TextEditingController();

  @override
  void initState() {
    this._bloc = FormScreenValidationBloc();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormScreenValidationBloc, FormScreenEventSubmitState>(
      bloc: this._bloc,
      listener: (context, state) {
        if (state.submissionSuccess) {
          showDialog(
            context: context,
            child: AlertDialog(title: Text('Submission success!'), content: Text("Your submission was a success"), actions: [
              FlatButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ]),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: BlocBuilder<FormScreenValidationBloc, FormScreenEventSubmitState>(
                bloc: this._bloc,
                builder: (context, state) {
                  if (state.isBusy) {
                    return CircularProgressIndicator();
                  }

                  return Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                    TextField(
                      controller: this._emailController,
                      style: TextStyle(
                        color: this._hasEmailError(state) ? Colors.red : Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        labelStyle: TextStyle(
                          color: this._hasEmailError(state) ? Colors.red : Colors.black,
                        ),
                        hintStyle: TextStyle(
                          color: this._hasEmailError(state) ? Colors.red : Colors.black,
                        ),
                        enabledBorder: this._renderBorder(state),
                        focusedBorder: this._renderBorder(state),
                      ),
                    ),
                    if (this._hasEmailError(state)) ...[
                      SizedBox(height: 5),
                      Text(
                        this._emailErrorText(state.emailError),
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                    SizedBox(height: 30),
                    RaisedButton(
                      child: Text('Submit'),
                      onPressed: () => this._bloc.add(FormScreenEventSubmit(this._emailController.text)),
                    ),
                  ]);
                }),
          ),
        ),
      ),
    );
  }

  UnderlineInputBorder _renderBorder(FormScreenEventSubmitState state) => UnderlineInputBorder(
        borderSide: BorderSide(color: this._hasEmailError(state) ? Colors.red : Colors.black, width: 1),
      );

  bool _hasEmailError(FormScreenEventSubmitState state) => state.emailError != null;

  String _emailErrorText(FieldError error) {
    switch (error) {
      case FieldError.Empty:
        return 'You need to enter an email address';
      case FieldError.Invalid:
        return 'Email address invalid';
      default:
        return '';
    }
  }
}
