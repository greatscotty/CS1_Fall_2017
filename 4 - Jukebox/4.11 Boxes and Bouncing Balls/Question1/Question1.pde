int currentX;
float currentY;
int direction; 

void setup() {
    size(512, 512);
    direction = 1;
    currentX = 1;
    currentY = 1;
}

void draw() {
    background(0);

    ellipse(currentX, currentY, 25, 25);

    if ( ( (currentX == 0) || (currentX == width) ) ) 
    {
        reverseDirection();
    }

    else if ( ( (currentY == 0) || (currentY == height) ) )
    {
        reverseDirection(); 
    }

    else
    {
        movement();
    }
}

void reverseDirection()
{
    direction = direction * -1;
    movement();
}

void movement()
{
    currentX = currentX + (1 * direction);
    //currentY = currentY + (1 * direction);
}