String getRatingString(double rating) {
  String _ratingString;
  if (rating > 5) rating = 5;
  if (rating < 0) rating = 0;

  if (rating > 4) {
    _ratingString = 'Отлично';
  } else if (rating > 3) {
    _ratingString = 'Хорошо';
  } else if (rating > 2) {
    _ratingString = 'Так себе';
  } else {
    _ratingString = 'Плохо';
  }
  return _ratingString;
}
