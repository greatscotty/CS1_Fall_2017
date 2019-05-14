int circleX;
int circleY;
int circleDiameter;

void setup() 
{
    size(512, 512);
    background(100);
    circleX = width/2;
    circleY = height/2;
    circleDiameter = height/6;
}

void draw()
{
    background(100);
    ellipse(circleX, circleY, circleDiameter, circleDiameter);
}

void mouseDragged()
{   
    if ((mouseX >=  (circleX - circleDiameter/2)) && //  mouse in the x bounds of  circle
        (mouseX <= (circleX + circleDiameter/2)))
    {
       if ((mouseY >=  (circleY - circleDiameter/2)) && //  mouse in the y  bounds of circle
        (mouseY <= (circleY + circleDiameter/2)))
        {
            if (mouseY < 0 + (circleDiameter/2))
            {
                circleY = 0 + circleDiameter/2;
            }
            else if (mouseY > height - (circleDiameter/2))
            {
                circleY = height - circleDiameter/2;
            }
            else 
            {
                circleY = mouseY;
            }

            if (mouseX < 0 + (circleDiameter/2))
            {
                circleX = 0 + circleDiameter/2;
            }
            else if (mouseX > width - (circleDiameter/2))
            {
                circleX = width - circleDiameter/2;
            }
            else 
            {
                circleX = mouseX;
            }
            ellipse(circleX, circleY, circleDiameter, circleDiameter);
        }
    }
}
