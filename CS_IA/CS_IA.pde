import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer backgroundmusic;
int volume = 10;


int screen = 0;
PFont font;
PFont audioFont;

PImage exitON;
PImage exitOFF;
PImage audioImgON;
PImage audioImgOFF;
PImage bubblesPicOFF;
PImage bubblesPicON;
PImage backUncolored;
PImage backColored;

boolean audioConfig = false;

alphabetGame alphabetGame;
colorGame colorGame;


void setup() {
  background(183, 209, 218);
  fullScreen();

  font = createFont("font.TTF", 32);
  audioFont = createFont("audiocontrol.ttf", 32);
  exitON = loadImage("EXITON.png");
  exitOFF = loadImage("EXITOFF.png");
  audioImgON = loadImage("AUDIOON.png");
  audioImgOFF = loadImage("AUDIOOFF.png");
  bubblesPicOFF = loadImage("Bubbles(uncolored).png");
  bubblesPicON = loadImage("Bubbles(colored).png");
  backUncolored = loadImage("goback(uncolored).png");
  backColored = loadImage("goback(colored).png");



  minim = new Minim(this); //Music 
  backgroundmusic = minim.loadFile("background.mp3");
  backgroundmusic.loop();

  alphabetGame = new alphabetGame();
  colorGame = new colorGame();
}

void draw() {
  background(183, 209, 218);
  backgroundmusic.play();
  backgroundmusic.setGain(volume);

  quitButton(exitOFF);
  audio(audioImgOFF);

  switch(screen) 
  {
  case 0:
    fill(0, 0, 0);
    textFont(audioFont);
    textSize(40);
    text("A Project by Aryan Kothari", 990, 300);
    fill(0, 0, 100);
    textFont(font, width/8);
    text("Juliet Wonderland", width/6.5, height/3.5);


    if (mouseX > 100 && mouseX < 700 && mouseY > 400 && mouseY < 800) {
      fill(100, 0, 0);
      textSize(110);
      text("Colors Galore", 155, 760);
      image(bubblesPicON, 60, 270, 666, 500);
      if (mousePressed)
      {
        colorGame.setneedInstructions(true);
        screen = 1;
      }
    } else {
      fill(20, 20, 20);
      textSize(110);
      text("Colors Galore", 155, 760);
      image(bubblesPicOFF, 60, 270, 666, 500);
    }

    if (mouseX > 750 && mouseX < 1350 && mouseY > 400 && mouseY < 800) {
      fill(100, 0, 0);
      textSize(300);
      text("Aa", 950, 620);
      textSize(80);
      text("Alphabet Adventures", 800, 760);
      if (mousePressed)
      {
        alphabetGame.setneedInstructions(true);
        screen = 2;
      }
    } else {
      fill(0, 0, 0);
      textSize(300);
      text("Aa", 950, 620);
      textSize(80);
      text("Alphabet Adventures", 800, 760);
    }

    break;
  case 1: 
    colorGame.Draw();
    colorGame.selectBubble();
    goBack();
    break;
  case 2:
    alphabetGame.Draw();
    goBack();
    break;
  }

  if (mouseX > width-50 && 
    mouseX < width-10 && mouseY > 5 && mouseY < 50) {
    quitButton(exitON);
    if (mousePressed) {
      exit();
    }
  }

  if (mouseX > width-120 && 
    mouseX < width-60 && mouseY > 5 && mouseY < 50) {
    audio(audioImgON);
    if (mousePressed) {
      audioConfig = true;
    }
  }
}

void keyPressed() {
  if (key == ESC) {
    key = 5;
  }
}






void quitButton(PImage img) {
  image(img, width-60, 10, 56, 40);
}

void audio(PImage img) {
  image(img, width-120, 10, 56, 40);

  if (audioConfig) {
    fill(155, 250, 50, 20);
    rect(width/2-528, 20, 1000, 80, 10);
    fill(0, 0, 0);
    textFont(audioFont);
    textSize(40);
    text("VOLUME CONTROL:", 250, 60);
    text("OFF", 450, 60);
    text("LOW", 600, 60);
    text("MEDIUM", 800, 60);
    text("HIGH", 1050, 60);

    if (mouseX > 400 && 
      mouseX < 500 && mouseY > 40 && mouseY < 80) {
      fill(0, 0, 255);
      text("OFF", 450, 60);
      if (mousePressed) {
        volume = -100;
        audioConfig = false;
      }
    }

    if (mouseX > 550 && 
      mouseX < 700 && mouseY > 40 && mouseY < 80) {
      fill(0, 0, 255);
      text("LOW", 600, 60);
      if (mousePressed) {
        volume = -10;
        audioConfig = false;
      }
    }

    if (mouseX > 750 && 
      mouseX < 900 && mouseY > 40 && mouseY < 80) {
      fill(0, 0, 255);
      text("MEDIUM", 800, 60);
      if (mousePressed) {
        volume = 0;
        audioConfig = false;
      }
    }

    if (mouseX > 950 && 
      mouseX < 1110 && mouseY > 40 && mouseY < 80) {
      fill(0, 0, 255);
      text("HIGH", 1050, 60);
      if (mousePressed) {
        volume = 100;
        audioConfig = false;
      }
    }
  }
}

public void goBack() {
  if (mouseX > 10 && mouseX < 150 && mouseY > 0 && mouseY < 100) {
    image(backColored, 10, -25, 130, 144);
    if (mousePressed)
    {
      screen = 0;
      colorGame.reset();
    }
  } else {
    image(backUncolored, 10, -25, 130, 144);
  }
}
