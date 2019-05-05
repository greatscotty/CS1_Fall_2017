float currentX;
float currentY;
int directionX; 
int directionY; 

void setup() {
    size(1000, 512);
    directionX = 1;
    directionY = 1;
    currentX = 10;
    currentY = 450;
    frameRate(500);
    background(0);
}

void draw() {
  

    ellipse(currentX, currentY, 25, 25);

    if ((currentY == 0) || (currentY == height))
    {
        if ( ( (currentX == 0) || (currentX == width) ) ) 
        {
            reverseDirectionX();
        }
        
        reverseDirectionY();
    }

    else if ( ( (currentX == 0) || (currentX == width) ) ) 
    {
        if ((currentY == 0) || (currentY == height))
        {
            reverseDirectionY();
        }

        reverseDirectionX();
    }

        movement();
}

void reverseDirectionX( )
{
    directionX = directionX * -1;
}

void reverseDirectionY( )
{
    directionY = directionY * -1;
}


void movement()
{
     
    currentX += (1 * directionX);
    currentY = currentY + (1 * directionY);
}
