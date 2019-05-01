import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer song1Player;
AudioPlayer song2Player;
AudioPlayer song3Player;

PImage backgroundImage;
PFont buttonFont;

final int buttonWidth = 30;
final int buttonHeight = 40;

final int buttonY = 100;

int middleButtonX;
int leftButtonX;
int rightButtonX;

void setup(){
  backgroundImage = loadImage("Jukebox.jpg");
  surface.setSize(backgroundImage.width, backgroundImage.height);
  
  minim = new Minim(this);
  song1Player = minim.loadFile("Boreal_forest.mp3");
  song2Player = minim.loadFile("mexico_8bit.mp3");
  song3Player = minim.loadFile("summerCamp.mp3");
  
  middleButtonX = width/2;
  leftButtonX = middleButtonX - buttonWidth/2 -30;
  rightButtonX = middleButtonX + buttonWidth/2 +30;
  
  buttonFont = loadFont("Serif-48.vlw");
  textFont(buttonFont, 48);
  textAlign(CENTER,CENTER); // Horizontal and Vertical allignment
}

void draw(){
  image(backgroundImage,0,0);
  
 
  //Draw the buttons   
  drawButton(middleButtonX,buttonY,2);
  drawButton(leftButtonX,buttonY,1);
  drawButton(rightButtonX,buttonY,3);
}

void drawButton (int x, int y, int buttonNumber)
  {
  fill(240);
  rectMode(CENTER);
  rect(x, y, buttonWidth, buttonHeight); 
    
  fill(0);
  text(buttonNumber, x,y);
  }
