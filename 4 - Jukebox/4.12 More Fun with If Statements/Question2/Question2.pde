float circleX;
float circleY;
color circleFill;

void setup()
{
  size(500,500);
  background(255);
  noStroke();
  circleFill = color(0,0,0);
 }

void draw()
{
  frameRate(500);
  drawRandomCircle();
}

void drawRandomCircle()
{   
    circleX = random(0,width);
    circleY = random(0,height);
    colorCheck();
    ellipse(circleX,circleY,15,15);
}

void colorCheck()
{   
    if (circleX < width/2)
    {
        if ((circleX*2) > (height - circleY))
        {
            circleFill = color (255,0,0); 
        }
        else
        {
            circleFill = color (0,0,255); 
        }
        fill(circleFill);
        }
    else
    {
        if ((2*circleX) < (height + circleY))
        {
            circleFill = color (255,0,0); 
        }
        else
        {
            circleFill = color (0,0,255); 
        }
        fill(circleFill);
    }
}