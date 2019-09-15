import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer backgroundmusic;
int volume = 100;


int screen = 0;
PFont font;
PFont audioFont;

PImage exitON;
PImage exitOFF;
PImage audioImgON;
PImage audioImgOFF;

boolean audioConfig = false;


ArrayList<ball> ball = new ArrayList<ball>();


void setup() {
  background(183, 209, 218);
  fullScreen();

  font = createFont("font.TTF", 32);
  audioFont = createFont("audiocontrol.ttf", 32);
  exitON = loadImage("EXITON.png");
  exitOFF = loadImage("EXITOFF.png");
  audioImgON = loadImage("AUDIOON.png");
  audioImgOFF = loadImage("AUDIOOFF.png");


  minim = new Minim(this); //Music 
  backgroundmusic = minim.loadFile("background.mp3");
  backgroundmusic.loop();

  ball.add(new ball(330 + 150, 520));
  ball.add(new ball(300 + 150, 580));
  ball.add(new ball(300 + 150, 530));
  ball.add(new ball(200 + 150, 530));
  ball.add(new ball(100 + 150, 560));
  ball.add(new ball(150 + 150, 550));
  ball.add(new ball(100 + 150, 530));
  ball.add(new ball(200 + 150, 580));
  ball.add(new ball(250 + 150, 560));
  ball.add(new ball(260 + 150, 490));
  ball.add(new ball(350 + 150, 550));
  ball.add(new ball(160 + 150, 500));
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
    fill(0, 0, 100);
    textFont(font, width/8);
    text("Julliette Wonderland", width/12, height/3.5);
    for (int i = 0; i < ball.size(); i++) {
      ball.get(i).Draw();
    }
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
    rectMode(CENTER);
    fill(155, 201, 50, 60);
    rect(width/2, 50, 1000, 80);

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
      fill(255, 0, 0);
      text("OFF", 450, 60);
      if (mousePressed) {
        volume = -50;
          audioConfig = false;
      }
    }

    if (mouseX > 550 && 
      mouseX < 700 && mouseY > 40 && mouseY < 80) {
      fill(255, 0, 0);
      text("LOW", 600, 60);
      if (mousePressed) {
        volume = -10;
        audioConfig = false;
      }
    }

    if (mouseX > 750 && 
      mouseX < 900 && mouseY > 40 && mouseY < 80) {
      fill(255, 0, 0);
      text("MEDIUM", 800, 60);
      if (mousePressed) {
        volume = 0;
        audioConfig = false;
      }
    }

    if (mouseX > 950 && 
      mouseX < 1110 && mouseY > 40 && mouseY < 80) {
      fill(255, 0, 0);
      text("HIGH", 1050, 60);
      if (mousePressed) {
        volume = 100;
        audioConfig = false;
      }
    }
  }
}
