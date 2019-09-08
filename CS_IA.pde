import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer backgroundmusic;


int screen = 0;
PFont font;
PFont quit_font;

ArrayList<ball> ball = new ArrayList<ball>();


void setup() {
  background(183, 209, 218);
  fullScreen();

  font = createFont("font.TTF", 32);
  quit_font = createFont("quit.ttf", 32);

  minim = new Minim(this); //Music 
  backgroundmusic = minim.loadFile("background.mp3");
  backgroundmusic.loop();

  ball.add(new ball(330, 520));
  ball.add(new ball(300, 580));
  ball.add(new ball(300, 530));
  ball.add(new ball(200, 530));
  ball.add(new ball(100, 560));
  ball.add(new ball(150, 550));
  ball.add(new ball(100, 530));
  ball.add(new ball(200, 580));
  ball.add(new ball(250, 560));
  ball.add(new ball(260, 490));
  ball.add(new ball(350, 550));
  ball.add(new ball(160, 500));
}

void draw() {
  background(183, 209, 218);
  backgroundmusic.play();
  quitButton(255, 0, 0);

  if (screen == 0) {
    fill(0, 0, 100);
    textFont(font, width/8);
    text("Julliette Wonderland", width/12, height/3.5);
    for (int i = 0; i < ball.size(); i++) {
      ball.get(i).Draw();
    }
  }


  if (mouseX > width/1.07 && 
    mouseX < width && mouseY > 0 && mouseY < 37) {
    quitButton(0, 255, 0);
    if (mousePressed) {
      exit();
    }
  }
}




void quitButton(int r, int b, int g) {
  stroke(r, g, b);
  fill(r, g, b);
  rect(width/1.07, 0, 140, 35);
  fill(0, 0, 0);
  textFont(quit_font, width/8);
  textSize(50);
  text("QUIT", width/1.055, 25);
}
