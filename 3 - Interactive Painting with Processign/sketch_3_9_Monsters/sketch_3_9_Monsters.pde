 int robotWidth = 100;
 int robotHeight = 50;
 int x;
 int y;
final color backgroundColor = color(255);
final color fillColor = color(149,124,185);

void setup()
{
  size(500,500);
  background(backgroundColor);
 
  
 }

void draw()
{
  background(backgroundColor);
  drawMonster(x,y,robotWidth,robotHeight,fillColor);
}

void drawMonster(int x, int y, int width, int height, color fillColor)
{ 
  final int eyeRadius = 5;
 
  rectMode(CENTER);
  fill(fillColor);
  rect(x, y, width, height);

  // Draw the left ear
  triangle(x - width/4, // x1
           y - height/2, // y1
           x - width/4 - 10, // x2
           y - height/2, // y2
           x - width/4 - 5, //x3
           y - height/2 - 10); //y3
 
  // Draw the right ear
  triangle(x + width/4, // x1
           y - height/2, // y1
           x + width/4 + 10, // x2
           y - height/2, // y2
           x + width/4 + 5, //x3
           y - height/2 - 10); //y3
 
  // Draw the left eye
  ellipse(x - width/5,
          y - height/4,
          eyeRadius * 2,
          eyeRadius * 2);
 
 // Draw the right eye
 ellipse(x + width/5,
         y - height/4,
         eyeRadius * 2,
         eyeRadius * 2);
}

void mouseClicked()
{
  x = mouseX;
  y = mouseY;
}
