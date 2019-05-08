final color button1Colour1 = color(60, 40, 85);
final color button1Colour2 = color(235, 235, 65);
final color button2Colour1 = color(125, 245, 75);
final color button2Colour2 = color(230, 60, 140);
final color button3Colour1 = color(0, 45, 190);
final color button3Colour2 = color(230, 100, 45);

boolean colourSwitched1;
boolean colourSwitched2;
boolean colourSwitched3;

color displayColour1;
color displayColour2;
color displayColour3;

int buttonSize = 100;
int buttonY;
int middleButtonX;
int leftButtonX;
int rightButtonX;

void setup() {
size(512, 512);
background(0);

buttonY = height/2;
leftButtonX = 2*width/4;
middleButtonX = width/4;
rightButtonX =  3*width/4;

colourSwitched1 = false;
colourSwitched2 = false;
colourSwitched3 = false;
}

void draw() {
    rectMode(CENTER);

    drawButton(leftButtonX, buttonSize, colourSwitched1, button1Colour1, button1Colour2);
    drawButton(middleButtonX, buttonSize, colourSwitched2, button2Colour1, button2Colour2);
    drawButton(rightButtonX, buttonSize, colourSwitched3, button3Colour1, button3Colour2);
}

void mouseClicked()
{
    if (mouseY >= buttonY - (buttonSize/2) &&
      mouseY <= buttonY + (buttonSize/2))
    {
      // Now see which button we might have clicked on
    if (mouseX >= leftButtonX - (buttonSize/2) &&
        mouseX <= leftButtonX + (buttonSize/2))
    {
      // Left button clicked
      colourSwitched1 = changeColour(colourSwitched1);
      println("test1");
    }
    else if (mouseX >= middleButtonX - (buttonSize/2) &&
             mouseX <= middleButtonX + (buttonSize/2))
    {
      // Middle button clicked
      colourSwitched2 = changeColour(colourSwitched2);
      println("test2");
    }
    else if (mouseX >= rightButtonX - (buttonSize/2) &&
             mouseX <= rightButtonX + (buttonSize/2))
    {
      // Right button clicked
       colourSwitched3 = changeColour(colourSwitched3);
     println("test3");
    }
    }
}

void drawButton(int x, int buttonSize, boolean colourSwitched , color buttonFill1, color buttonFill2)
{
    if (!colourSwitched)
    {
        fill(buttonFill1);
        rect( x, buttonY, buttonSize, buttonSize);
    }
    else {
        fill(buttonFill2);
        rect( x, buttonY, buttonSize, buttonSize);
    }
}

boolean changeColour(boolean colourSwitched)
{
    
    if (!colourSwitched)
    {
        return true;
    }
    else {
        return false;
    }
}       
