

void setup()
{
  size(500,500);
}

void draw()
{
  drawMonster(width/3, height/3,100,150,(255));
  drawMonster(2*width/3, height/3,150,150,color(255,0,0));
  drawMonster(width/2, 2*width/3,150,100, color(0,0,255));
}

void drawMonster(int x, int y, int width, int height, color fillColor)
{ 
  final int eyeRadius = 5;
 
  fill(fillColor);
  rectMode(CENTER);
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
