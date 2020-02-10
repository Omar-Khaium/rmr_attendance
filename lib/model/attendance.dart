class Attendance {
  int _id;
  String _clockedInAt;
  String _clockedInNote;
  double _clockedInPosition;
  String _clockedOutAt;
  String _clockedOutNote;
  double _clockedOutPosition;
  double _duration;

  Attendance(this._id, this._clockedInAt, this._clockedInNote,
      this._clockedInPosition, this._clockedOutAt, this._clockedOutNote,
      this._clockedOutPosition, this._duration);

  double get duration => _duration;

  set duration(double value) {
    _duration = value;
  }

  double get clockedOutPosition => _clockedOutPosition;

  set clockedOutPosition(double value) {
    _clockedOutPosition = value;
  }

  String get clockedOutNote => _clockedOutNote;

  set clockedOutNote(String value) {
    _clockedOutNote = value;
  }

  String get clockedOutAt => _clockedOutAt;

  set clockedOutAt(String value) {
    _clockedOutAt = value;
  }

  double get clockedInPosition => _clockedInPosition;

  set clockedInPosition(double value) {
    _clockedInPosition = value;
  }

  String get clockedInNote => _clockedInNote;

  set clockedInNote(String value) {
    _clockedInNote = value;
  }

  String get clockedInAt => _clockedInAt;

  set clockedInAt(String value) {
    _clockedInAt = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}
