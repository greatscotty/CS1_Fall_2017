final color button1Colour1 = color(60, 40, 85);
final color button1Colour2 = color(235, 235, 65);
final color button2Colour1 = color(125, 245, 75);
final color button2Colour2 = color(230, 60, 140);
final color button3Colour1 = color(0, 45, 190);
final color button3Colour2 = color(230, 100, 45);

boolean colourSwitched1;
boolean colourSwitched2;
boolean colourSwitched3;

int buttonSize = 100;
int buttonY;
int middleButtonX;
int leftButtonX;
int rightButtonX;

PFont buttonFont;

void setup() {
size(512, 512);
background(100);

buttonY = height/2;
leftButtonX = width/4;
middleButtonX = 2*width/4;
rightButtonX =  3*width/4;

colourSwitched1 = false;
colourSwitched2 = false;
colourSwitched3 = false;

buttonFont = loadFont("Serif-48.vlw");
textFont(buttonFont, 48);
textAlign(CENTER,CENTER);
}

void draw() {
    rectMode(CENTER);
    drawButton(leftButtonX, buttonSize, colourSwitched1, button1Colour1, button1Colour2, 1);
    drawButton(middleButtonX, buttonSize, colourSwitched2, button2Colour1, button2Colour2, 2);
    drawButton(rightButtonX, buttonSize, colourSwitched3, button3Colour1, button3Colour2, 3);
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
        }
        else if (mouseX >= middleButtonX - (buttonSize/2) &&
                mouseX <= middleButtonX + (buttonSize/2))
        {
        // Middle button clicked
        colourSwitched2 = changeColour(colourSwitched2);
        }
        else if (mouseX >= rightButtonX - (buttonSize/2) &&
                mouseX <= rightButtonX + (buttonSize/2))
        {
        // Right button clicked
        colourSwitched3 = changeColour(colourSwitched3);
        }
    }
}

void drawButton(int x, int buttonSize, boolean colourSwitched , color buttonFill1, color buttonFill2, int buttonNumber)
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

    fill(0);
    text(buttonNumber, x, buttonY);
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
