class alphabetGame
{
  boolean needInstructions;
  ArrayList<Letter> letter = new ArrayList<Letter>();
  int letteronDisplay = 0;

  alphabetGame()
  {
    needInstructions = true;
    int asciiletter = 0;
    String toL = "";
    for (int i = 0; i < 20; i++) {
      int random = (int)random(0, 100);
      if (random < 50) {
        asciiletter = (int)random(65, 90);
        toL = "capital";
      } else {
        asciiletter = (int)random(97, 122);
        toL = "lowercase";
      }
      char ch = (char) asciiletter;
      letter.add(new Letter(ch, toL));
    }
  }

  public void Draw()
  {
    letter.get(letteronDisplay).Draw();


    displayButtons();
    resetButton();

    textFont(audioFont, 20); 
    textSize(60); 
    fill(0, 0, 0); 
    text("LETTERS REMAINING: " + (letter.size() - letteronDisplay), 50, height/2-300); 


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

    textFont(audioFont, 75); 
    textSize(100); 
    fill(0, 0, 0); 
    text("CAPITAL LETTER", width/2+110, height/2-140); 
    text("LOWERCASE LETTER", width/2+75, height/2+230);
  }

  private void resetButton() {
    if (mouseX> 1150 && mouseX < 1300 && mouseY > 100 && mouseY < 150) {
      fill(0, 0, 255, 90);
    } else {
      fill(0, 0, 0);
    }
    textFont(audioFont, 50);
    text("RESET", 1200, 135);
  }

  public void reset() {
    int asciiletter = 0;
    String toL = "";
    for (int i = 0; i < letter.size(); i++) {
      int random = (int)random(0, 100);
      if (random < 50) {
        asciiletter = (int)random(65, 90);
        toL = "capital";
      } else {
        asciiletter = (int)random(97, 122);
        toL = "lowercase";
      }
      char ch = (char) asciiletter;
      letter.get(i).setCharacter(ch);
      letter.get(i).setCharacterType(toL);
    }

    letteronDisplay = 0;
  }


  public void setneedInstructions(boolean _needInstructions) {
    needInstructions = _needInstructions;
  }

  public void checkAnswer(String answer) {
    if (answer.equals(letter.get(letteronDisplay).getTOL())) {
      letteronDisplay += 1;
    }
  }
}
