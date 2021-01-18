class category
{
  String _name,_img;
  int _id,_numOFdrs;

  category();

  category.intit(this._name, this._id,this._img,this._numOFdrs);

  get img => _img;

  set img(value) {
    _img = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  get numOFdrs => _numOFdrs;

  set numOFdrs(value) {
    _numOFdrs = value;
  }
}