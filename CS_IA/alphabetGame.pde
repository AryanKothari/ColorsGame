class alphabetGame
{
  boolean needInstructions;
  ArrayList<Letter> letter = new ArrayList<Letter>();

  alphabetGame()
  {
    needInstructions = true;
    for (int i = 0; i < 1; i++) {
      letter.add(new Letter("L"));
    }
  }

  public void Draw()
  {
    for (int i = 0; i < 1; i++) {
      letter.get(i).Draw();
    }

    displayButtons();


    if (needInstructions) 
    {
      instructions();
    } 
  }

  private void instructions() {
    fill(200, 200, 200); //play
    rect(width/2-400, height/2 - 100, 900, 200, 10); 

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

  private void displayButtons() {
    if (mouseX>width/2+40 && mouseX < width/2+600 && mouseY>height/2-300 && mouseY < height/2 - 10) {
      fill(0, 0, 255, 90); 
      rect(width/2+40, height/2-300, 550, 300, 10);
    } else {
      fill(255, 0, 0, 90); 
      rect(width/2+40, height/2-300, 550, 300, 10);
    }

    if (mouseX>width/2+40 && mouseX < width/2+600 && mouseY>height/2+70 && mouseY < height/2 + 370) {
      fill(0, 0, 255, 90); 
      rect(width/2+40, height/2+70, 550, 300, 10);
    } else {
      fill(255, 0, 0, 90); 
      rect(width/2+40, height/2+70, 550, 300, 10);
    }


    textSize(100); 
    fill(0, 0, 0); 
    text("CAPITAL LETTER", width/2+110, height/2-140); 
    text("LOWERCASE LETTER", width/2+75, height/2+230);
  }


  public void setneedInstructions(boolean _needInstructions) {
    needInstructions = _needInstructions;
  }
}
