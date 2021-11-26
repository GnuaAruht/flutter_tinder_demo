import 'package:flutter/material.dart';
import 'package:flutter_tinder_demo/data/temp.dart';
import 'package:flutter_tinder_demo/model/tinder_user.dart';

enum CardStatus { like, dislike, superlike }

class CardProvider extends ChangeNotifier {
  Offset _position = Offset.zero;
  Offset get position => _position;

  double _angle = 0.0;
  Size _screenSize = Size.zero;
  List<TinderUser> _users = [];
  bool _isDragging = false;

  bool get isDragging => _isDragging;
  double get angle => _angle;
  List<TinderUser> get users => _users;

  CardProvider() {
    _resetUsers();
  }

  void _resetUsers() {
    _users = sampleUsers;
    notifyListeners();
  }

  void setScreenSize(Size size) => _screenSize = size;

  void startPosition(DragStartDetails details) {
    _isDragging = true;
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;
    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;
    notifyListeners();
  }

  void endPosition() {
    _isDragging = false;
    notifyListeners();

    final _status = getStatus();

    switch (_status) {
      case CardStatus.like:
        like();
        break;
      case CardStatus.dislike:
        dislike();
        break;
      case CardStatus.superlike:
        superlike();
        break;
      default:
        _resetPosition();
    }
  }

  CardStatus? getStatus() {
    final x = position.dx;
    final y = position.dy;

    final forceSuperlike = x.abs() < 20;

    const delta = 100;

    if (x >= delta) {
      return CardStatus.like;
    } else if (x <= -delta) {
      return CardStatus.dislike;
    } else if (y <= -delta / 2 && forceSuperlike) {
      return CardStatus.superlike;
    }
  }

  void like() {
    _angle = 20;
    _position += Offset(2 * _screenSize.width, 0);
    _nextCard();
    notifyListeners();
  }

  void dislike() {
    _angle = -20;
    _position += Offset(-2 * _screenSize.width, 0.0);
    _nextCard();
    notifyListeners();
  }

  void superlike() {
    _angle = 0;
    _position += Offset(0, -_screenSize.height);
    _nextCard();
    notifyListeners();
  }

  Future<void> _nextCard() async {
    if (_users.isEmpty) return;

    await Future.delayed(const Duration(milliseconds: 400));
    _users.removeAt(0);

    _resetPosition();
    notifyListeners();
  }

  void _resetPosition() {
    _position = Offset.zero;
    _isDragging = false;
    _angle = 0;
  }
}
