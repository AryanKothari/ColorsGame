class Bubble
{
  public float posX;
  public float posY;
  public String Color;
  private int randomVal;
  private boolean isSelected = false;
  public int r = 0;
  public int g = 0;
  public int b = 0;
  public int ID;

  Bubble(float _posx, float _posy, int _ID)
  {
    posX = _posx;
    posY = _posy;
    randomVal = (int)random(0, 1000);
    ID = _ID;
  }

  public void Draw() {
    if (randomVal <= 250) {
      r = 255;
      g = 0;
      b = 0;
      Color = "red";
    } else if (randomVal > 250 && randomVal <= 500) {
      r = 0;
      g = 255;
      b = 0;
      Color = "green";
    } else if (randomVal > 500 && randomVal <= 750) {
      r = 0;
      g = 0;
      b = 255;
      Color = "blue";
    } else if (randomVal > 750 && randomVal <= 1000) {
      r = 255;
      g = 255;
      b = 0;
      Color = "yellow";
    }

    if (isSelected) {
      strokeWeight(5);
      stroke(128, 0, 128);
    } else {
      strokeWeight(2);
      stroke(0);
    }
    fill(r, g, b);
    ellipse(posX, posY, 75, 75);
  }


  public void setColor(int _r, int _g, int _b) {
    r = _r;
    g = _g;
    b = _b;
  }

  public void setIsSelected(boolean answer) {
    isSelected = answer;
  }

  public void setPos(float _posX, float _posY) {
    posX = _posX;
    posY = _posY;
  }

  public void setrandomVal(int _randomVal) {
    randomVal = _randomVal;
  }
}
