class colorGame
{
  boolean needInstructions;
  ArrayList<Bubble> bubble = new ArrayList<Bubble>();

  colorGame()
  {
    for (int i =0; i < 1; i++) {
      if (i <= 5) {
        bubble.add(new Bubble(random(width/2+200, width-200), random(300, height-150), 255, 0, 0));
      } /*else if (10 >= i && i>5) {
       bubble.add(new Bubble(random(width/2+200, width-100), random(300, height-150), 0, 255, 0));
       } else if (15 >= i && i>10) {
       bubble.add(new Bubble(random(width/2+200, width-100), random(300, height-150), 0, 0, 255));
       } else if (20 >= i && i>15) {
       bubble.add(new Bubble(random(width/2+200, width-100), random(300, height-150), 255, 255, 0));
       }*/
    }

    needInstructions = true;
  }

  public void Draw()
  {
    for (int i =0; i < bubble.size(); i++) {
      bubble.get(i).Draw();
    }

    drawBoxes();

    if (needInstructions) 
    {
      instructions();
    }
  }

  public void selectBubble() {
    for (int i =0; i < bubble.size(); i++) {
      int orgR = bubble.get(i).r;
      int orgG = bubble.get(i).g;
      int orgB = bubble.get(i).b;

      if (dist(mouseX, mouseY, bubble.get(i).posX, bubble.get(i).posY) < 75/2) {
        if (mousePressed) {
          boolean saveColors = true;
          if (saveColors) {
            orgR = bubble.get(i).r;
            orgG = bubble.get(i).g;
            orgB = bubble.get(i).b;
            saveColors = false;
          }
          bubble.get(i).setColor(150, 150, 150);
        }
      } else {
        bubble.get(i).r = orgR;
        bubble.get(i).g = orgG;
        bubble.get(i).b = orgB;
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
    fill(255, 0, 0);
    rect(50, 150, 350, 350, 30);
    textFont(audioFont, 75);
    fill(0, 0, 0);
    text("RED", 150, 210);

    fill(0, 255, 0);
    rect(420, 150, 350, 350, 30);
    textFont(audioFont, 75);
    fill(0, 0, 0);
    text("GREEN", 550, 210);

    fill(0, 0, 255);
    rect(420, 520, 350, 350, 30);
    textFont(audioFont, 75);
    fill(0, 0, 0);
    text("BLUE", 550, 580);

    fill(255, 255, 0);
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

  public void setneedInstructions(boolean _needInstructions) {
    needInstructions = _needInstructions;
  }
}
