float currentX;
float currentY;
int directionX; 
int directionY; 

void setup() {
    size(1000, 512);
    directionX = 1;
    directionY = 1;
    currentX = 1;
    currentY = 400;
    frameRate(500);
    background(0);
}

void draw() {
  
    background(0);
    rect(450, 350, 300 , 100);

    ellipse(currentX, currentY, 25, 25);

    if (currentX >= (450-8))
    {
        reverseDirectionX();
    }
    else if ( ( (currentX == 0) || (currentX == width) ) ) 
    {
        reverseDirectionX();
    }

    movement();
}

void reverseDirectionX( )
{
    directionX = directionX * -1;
}

void movement()
{    
    currentX += (1 * directionX);
}
