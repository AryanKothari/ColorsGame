class colorGame
{
  boolean needInstructions;
  boolean bubbleSelected = true;
  ArrayList<Bubble> bubble = new ArrayList<Bubble>();

  colorGame()
  {
    int ID = 1;
    for (int i =0; i < 5; i++) {
      for (int j = 0; j < 4; j++) {
        bubble.add(new Bubble(935+ i*100, 300 + j*150, ID));
        ID = ID + 1;
      }
    }
    needInstructions = true;
  }

  public void Draw()
  {

    drawBoxes();
    resetButton();
    for (int i =0; i < bubble.size(); i++) {
      bubble.get(i).Draw();
    }

    if (needInstructions) 
    {
      instructions();
    }
  }

  public void selectBubble() {
    for (int i =0; i < bubble.size(); i++) {
      float distX = mouseX - bubble.get(i).posX;
      float distY = mouseY - bubble.get(i).posY;
      float distance = sqrt( (distX*distX) + (distY*distY) );

      if (distance < 75/2) {
        if (mousePressed) {
          bubble.get(bubble.get(i).ID-1).setIsSelected(true);
          bubble.get(bubble.get(i).ID-1).posX = mouseX;
          bubble.get(bubble.get(i).ID-1).posY = mouseY;
        } else {
          bubble.get(bubble.get(i).ID-1).setIsSelected(true);
        }
      } else {
        bubble.get(bubble.get(i).ID-1).setIsSelected(false);
      }
    }
  }


  private void instructions() {
    fill(200, 200, 200); //play
    rect(width/2-400, height/2 - 100, 900, 200, 10);
    noStroke();

    if (mouseX>width/2+330 && mouseX < width/2 + 500 && mouseY > height/2 && mouseY < height/2+100) {
      fill(0, 0, 255, 50);
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
    text("Welcome to Colors Galore!", width/2-230, height/2-50);
    text("READY", width/2+345, height/2+65);
  }


  private void drawBoxes() {
    strokeWeight(2);
    stroke(0);
    if (mouseX>50 && mouseX < 400 && mouseY > 150 && mouseY < 500) {
      fill(255, 0, 0, 90);
    } else {
      fill(255, 0, 0);
    }
    rect(50, 150, 350, 350, 30);
    textFont(audioFont, 75);
    fill(0, 0, 0);
    text("RED", 180, 210);

    if (mouseX> 420 && mouseX < 770 && mouseY > 150 && mouseY < 500) {
      fill(0, 255, 0, 90);
    } else {
      fill(0, 255, 0);
    }
    rect(420, 150, 350, 350, 30);
    textFont(audioFont, 75);
    fill(0, 0, 0);
    text("GREEN", 550, 210);

    if (mouseX> 420 && mouseX < 770 && mouseY > 520 && mouseY < 870) {
      fill(0, 0, 255, 90);
    } else {
      fill(0, 0, 255);
    }
    rect(420, 520, 350, 350, 30);
    textFont(audioFont, 75);
    fill(0, 0, 0);
    text("BLUE", 550, 580);

    if (mouseX> 50 && mouseX < 400 && mouseY > 520 && mouseY < 870) {
      fill(255, 255, 0, 90);
    } else {
      fill(255, 255, 0);
    }
    rect(50, 520, 350, 350, 30);
    textFont(audioFont, 75);
    fill(0, 0, 0);
    text("YELLOW", 150, 580);


    fill(150, 150, 150, 50);
    rect(870, 150, 530, 720, 30);
    textFont(audioFont, 75);
    fill(0, 0, 0);
    text("UNORGANISED", 1000, 200);
  }

  private void resetButton() {
    if (mouseX> 1250 && mouseX < 1400 && mouseY > 100 && mouseY < 150) {
      fill(0, 0, 255, 90);
    } else {
      fill(0, 0, 0);
    }
    textFont(audioFont, 50);
    text("RESET", 1300, 135);
  }

  public void setneedInstructions(boolean _needInstructions) {
    needInstructions = _needInstructions;
  }

  public void reset() {
    int ID = 0;
    for (int i =0; i < 5; i++) {
      for (int j = 0; j < 4; j++) {
        bubble.get(ID).setPos(935+ i*100, 300 + j*150);
        bubble.get(ID).setrandomVal((int)random(0, 1000));
        ID = ID + 1;
      }
    }
  }
}
