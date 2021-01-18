import 'package:flutter/material.dart';

class Appointment
{
  bool _isEvening,_isMorning;
  List<int> _workdays=[];
  List<TimeOfDay>_clockMorning=[];
  List<TimeOfDay>_clockEvening=[];

  Appointment();

  Appointment.init(this._isEvening, this._isMorning, this._workdays,
      this._clockMorning, this._clockEvening);

  List<TimeOfDay> get clockEvening => _clockEvening;

  set clockEvening(List<TimeOfDay> value) {
    _clockEvening = value;
  }

  List<TimeOfDay> get clockMorning => _clockMorning;

  set clockMorning(List<TimeOfDay> value) {
    _clockMorning = value;
  }

  List<int> get workdays => _workdays;

  set workdays(List<int> value) {
    _workdays = value;
  }

  get isMorning => _isMorning;

  set isMorning(value) {
    _isMorning = value;
  }

  bool get isEvening => _isEvening;

  set isEvening(bool value) {
    _isEvening = value;
  }
}