import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage backgroundImage;

Minim minim;
AudioPlayer song1Player;
AudioPlayer song2Player;
AudioPlayer song3Player;

final int buttonWidth = 30;
final int buttonHeight = 40;

final int buttonY = 100;

int middleButtonX;
int leftButtonX;
int rightButtonX;

PFont buttonFont;

int songPlaying;  

int buttonCounter;
final int framesBetweenFlash = 60;

void setup()
{

  buttonCounter = 0;

  backgroundImage = loadImage("Jukebox.jpg");
  surface.setSize(backgroundImage.width, backgroundImage.height);
  
  middleButtonX = width/2;
  leftButtonX = middleButtonX - buttonWidth/2 -30;
  rightButtonX = middleButtonX + buttonWidth/2 +30;

  songPlaying = -1;

  minim = new Minim(this);
  song1Player = minim.loadFile("Boreal_forest.mp3");
  song2Player = minim.loadFile("mexico_8bit.mp3");
  song3Player = minim.loadFile("summerCamp.mp3");

  rectMode(CENTER);
  
  buttonFont = loadFont("Serif-48.vlw");
  textFont(buttonFont, 48);
  textAlign(CENTER, CENTER); // Horizontal and Vertical allignment
}

void draw(){

  buttonCounter++;
if (buttonCounter > framesBetweenFlash * 2)
{
  buttonCounter = 0;
}

  image(backgroundImage, 0, 0);
 
  //Draw the buttons   
  drawButton(leftButtonX, buttonY, 1);
  drawButton(middleButtonX, buttonY, 2);
  drawButton(rightButtonX, buttonY, 3);
}

void drawButton (int x, int y, int buttonNumber)
{
  if (buttonNumber != songPlaying ||
  buttonCounter < framesBetweenFlash)
  {
    fill(240);
    rect(x, y, buttonWidth, buttonHeight); 
          
    fill(0);
    text(buttonNumber, x,y);
  }
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

// Function to handle toggling the song
void toggleSong(AudioPlayer songPlayer, int buttonNumber)
{
      // Save whether the song was playing so we can
      // start playing it if it wasn't
      boolean wasPlaying = songPlayer.isPlaying();
      
      // Stop all the songs
      songPlaying = -1;
      song1Player.pause();  
      song2Player.pause();
      song3Player.pause();
      
      // Start playing this song (whatever it happens
      // to be) if it was previously not playing
      if (!wasPlaying)
      {
        songPlayer.play();
        songPlaying = buttonNumber;
        buttonCounter = 0;
      }
}