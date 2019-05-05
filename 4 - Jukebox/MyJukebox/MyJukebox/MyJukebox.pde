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

  mouseClicked(if (mouseY >= buttonY - (buttonHeight/2) &&
    mouseY <= buttonY + (buttonHeight/2) &&
    mouseX >= leftButtonX - (buttonWidth/2) &&
    mouseX <= leftButtonX + (buttonWidth/2))
{
  // toggle playing the song
})
}

void drawButton (
  int x, int y, int buttonNumber)
  {
  fill(240);
  rectMode(CENTER);
  rect(x, y, buttonWidth, buttonHeight); 
    
  fill(0);
  text(buttonNumber, x,y);
  }

////
// When the mouse is clicked, we have to figure out
// what button was clicked on and play/stop the song
void mouseClicked()
{  
  // First check if we're in range in terms of the vertical
  // click location, since it's the same for all three
  if (mouseY >= buttonY - (buttonHeight/2) &&
      mouseY <= buttonY + (buttonHeight/2))
  {
    // Now see which button we might have clicked on
    if (mouseX >= leftButtonX - (buttonWidth/2) &&
        mouseX <= leftButtonX + (buttonWidth/2))
    {
      // Left button clicked
      toggleSong(song1Player, 1);
    }
    else if (mouseX >= middleButtonX - (buttonWidth/2) &&
             mouseX <= middleButtonX + (buttonWidth/2))
    {
      // Middle button clicked
      toggleSong(song2Player, 2);
    }
    else if (mouseX >= rightButtonX - (buttonWidth/2) &&
             mouseX <= rightButtonX + (buttonWidth/2))
    {
      // Right button clicked
      toggleSong(song3Player, 3);
    }
  }
}
