// cc ted davis [teddavis.org] 2014

import processing.opengl.*;
import java.awt.MouseInfo;
int mX, mY;

// animation output mode, turned off in binary
int aniC = 0;
boolean aniMode = false;

void setup() {
  size(720, 480, OPENGL);
  frame.setTitle("glitchedGL");
  frame.setResizable(true);
  background(0);
  stroke(255);
  noFill();
  strokeWeight(2);
  beginShape();
    vertex(width-5,height-5);
    vertex(width-5,height-15);
    vertex(width-15,height-5);
    vertex(width-5,height-5);
    vertex(width-20,height-20);

  endShape();
  text("bring your mouse over this window", width-250, height-80);
  text("then move it + enjoy the graphic dump!", width-250, height-60);
  text("cc ted davis 2014", width-250, height-40);
}

void draw() {
  frame.setLocation(0, 0);
  mX = MouseInfo.getPointerInfo().getLocation().x;
  mY = MouseInfo.getPointerInfo().getLocation().y;
  if (mX < 50)mX = 50;
  if (mY < 50)mY = 50;
  if (mouseX != 0 && mouseY != 0) {
    frame.setSize(mX, mY);
    if (aniMode) {
      saveFrame("glitchedGL_ani/glitchedGL_"+aniC+".jpg");
      aniC++;
    }
  }
}

void keyPressed() {
  if (keyCode == 32) {
    saveFrame("glitchedGL_output/glitchedGL_"+mX+"x"+mY+"_"+floor(random(9999))+".png");
  }
}

public void init() {
  frame.removeNotify();
  frame.setUndecorated(true);
  frame.addNotify();
  super.init();
}

