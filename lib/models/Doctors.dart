import 'package:doctor/models/Appoitment.dart';

class Doctors {
  String _name, _title, _distance,_img;
  double _log, _lang,_rate;
  int _id, _categoryId;
  Appointment _appointment;

  Doctors();

  Doctors.init(this._name, this._title, this._distance,
      this._id,this._rate, this._categoryId,this._appointment,this._img);

  get img => _img;

  set img(value) {
    _img = value;
  }

  get categoryId => _categoryId;

  set categoryId(value) {
    _categoryId = value;
  }

  get rate => _rate;

  set rate(value) {
    _rate = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  get lang => _lang;

  set lang(value) {
    _lang = value;
  }

  double get log => _log;

  set log(double value) {
    _log = value;
  }

  get distance => _distance;

  set distance(value) {
    _distance = value;
  }

  get title => _title;

  set title(value) {
    _title = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  Appointment get appointment => _appointment;

  set appointment(Appointment value) {
    _appointment = value;
  }
}
