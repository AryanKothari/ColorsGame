class Bubble
{
  public float posX;
  public float posY;
  public int r;
  public int g; 
   int b;
  Bubble(float _posx, float _posy, int _r, int _g, int _b)
  {
    posX = _posx;
    posY = _posy;
    r = _r;
    g = _g;
    b = _b;
  }

  public void Draw() {
    stroke(0);
    strokeWeight(2);
    fill(r, g, b);
    ellipse(posX, posY, 75, 75);
  }

  public void setColor(int _r, int _g, int _b) {
    r = _r;
    g = _g;
    b = _b;
  }

  public int getColorR() {
    return r;
  }
  public int getColorG() {
    return g;
  }
   public int getColorB() {
    return b;
  }
}
