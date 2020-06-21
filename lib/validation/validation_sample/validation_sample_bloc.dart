import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blocappflutter/validation/mixin_helper.dart';
import 'package:meta/meta.dart';

part 'validation_sample_event.dart';

part 'validation_sample_state.dart';

class FormScreenValidationBloc extends Bloc<FormScreenEventSubmitEvent, FormScreenEventSubmitState> with ValidationMixin {
  @override
  FormScreenEventSubmitState get initialState => FormScreenEventSubmitState();

  @override
  Stream<FormScreenEventSubmitState> mapEventToState(FormScreenEventSubmitEvent event) async* {
    if (event is FormScreenEventSubmit) {
      yield FormScreenEventSubmitState(isBusy: true);

      if (this.isFieldEmpty(event.email)) {
        yield FormScreenEventSubmitState(emailError: FieldError.Empty);
        return;
      }

      if (!this.validateEmailAddress(event.email)) {
        yield FormScreenEventSubmitState(emailError: FieldError.Invalid);
        return;
      }

      yield FormScreenEventSubmitState(submissionSuccess: true);
    }
  }
}
