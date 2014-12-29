part of FrameUI;

enum CURSOR {
  DEFAULT, CROSSHAIR, HELP, MOVE, POINTER, PROGRESS, TEXT, WAIT
}

class Style {

  List<int> backgroundColor = [220, 220, 220];

  int borderSize = 1;
  List<int> borderTopColor;
  List<int> borderLeftColor;
  List<int> borderRightColor;
  List<int> borderBottomColor;

  List<int> padding = [1, 1, 1, 1];

  int get paddingTop => padding[0];
  void set paddingTop(int size) { padding[0] = size; }

  int get paddingLeft => padding[3];
  void set paddingLeft(int size) { padding[3] = size; }

  int get paddingRight => padding[1];
  void set paddingRight(int size) { padding[1] = size; }

  int get paddingBottom => padding[2];
  void set paddingBottom(int size) { padding[2] = size; }

  bool visible = true;

  CURSOR cursor = CURSOR.DEFAULT;
  String get cursorName =>
      cursor.toString().replaceFirst("CURSOR.", "").toLowerCase();

  Style() {

    // BORDERS

    borderTopColor = backgroundColor.map((component){
      return component + 25 >= 255 ? 255 : component + 25;
    }).toList();

    borderLeftColor = borderTopColor;

    borderRightColor = backgroundColor.map((component){
      return component - 35 <= 0 ? 0 : component - 35;
    }).toList();

    borderBottomColor = borderRightColor;

  }
}