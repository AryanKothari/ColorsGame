class Letter
{
  String letter;
  Letter(String _letter)
  {
    letter = _letter;
  }

  public void Draw() {
    textFont(audioFont);
    textSize(1500);
    fill(0, 0, 0);
    text(letter, 200, height/2+250);
  }
}
