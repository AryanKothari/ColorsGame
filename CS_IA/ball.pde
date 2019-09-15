class ball {
  private float posx;
  private float posy;
  private float r;
  private float g;
  private float b;
  ball(float _posx, float _posy) {
    posx = _posx;
    posy = _posy;
    r = random(0,255);
    g = random(0,255);
    b = random(0,255);
  }
  
   public void Draw()
  {
    stroke(0,0,0);
    strokeWeight(5);
    if(mouseX > 100 && mouseX < 400 && mouseY > 480 && mouseY < 600) {
    fill(r,g,b,50);
    } else {
      fill(175,175,175,50);
    }
    ellipse(posx, posy, 75, 75);
    
    if(mouseX > 100 && mouseX < 400 && mouseY > 480 && mouseY < 600) {
      fill(155,0,0);
    } else {
      fill(0,0,0);
    }
  
    textFont(font, width/20);
    text("Colors Galore", 210, 680);
  }
  
}
