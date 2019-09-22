class Letter
{
  char letter;
  String toL;
  Letter(char _letter, String _tol)
  {
    letter = _letter;
    toL = _tol;
  }

  public void Draw() {
    textFont(alphabetFont);
    textSize(700);
    fill(0, 0, 0);
    text(letter, 160, height/2+250);
  }

  public String getTOL() {
    return toL;
  }

  public void setCharacter(char _letter)
  {
    letter = _letter;
  }

  public void setCharacterType(String _toL) {
    toL = _toL;
  }
  
}
