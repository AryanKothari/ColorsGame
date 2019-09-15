class alphabetGame
{
  boolean needInstructions;

  alphabetGame()
  {
    needInstructions = true;
  }

  public void Draw()
  {

    if (needInstructions) 
    {
      instructions();
    }
  }

  private void instructions() {
    fill(0, 150, 0, 50); //play
    rect(width/2-400, height/2 - 100, 900, 200, 10);
    noStroke();

    if (mouseX>width/2+330 && mouseX < width/2 + 500 && mouseY > height/2 && mouseY < height/2+100) {
      fill(0, 0, 150, 50);
      rect(width/2+330, height/2 + 30, 150, 50, 10);
      if (mousePressed)
      {
        needInstructions = false;
      }
    } else {
      fill(150, 150, 150);
      rect(width/2+330, height/2 + 30, 150, 50, 10);
    }

    textFont(audioFont, 75);
    fill(0, 0, 0);
    text("Welcome to Alphabet Adventures!", width/2-230, height/2-50);
    text("READY", width/2+345, height/2+65);
  }


  public void setneedInstructions(boolean _needInstructions) {
    needInstructions = _needInstructions;
  }
}
