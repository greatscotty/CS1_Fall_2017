
float circleX;
float circleY; 
int cicleRadius;
color circleFill = color(255, 0, 0);

int colourCounter;
boolean colourIncrement = true;
int numberOfBouces;
float maxBouceHeight;
int direction = 1;
boolean bounced;

void setup() 
{
    size(512, 512);

    ellipseMode(CENTER);
    circleX = width/2;
    circleY = height/4;
    cicleRadius = width/6;

    colourCounter = 0;
    bounced = false; 
    numberOfBouces = -1;
}

void draw() 
{
    frameRate(250);
    background(100);
    changeColour(); 
    bounceCalculator();
}

void changeColour()
{   
    if (colourCounter <=255 && colourIncrement == true)
    {
        colourCounter++;
        circleFill = color(255 - colourCounter, 0 , 0 + colourCounter);
        fill(circleFill);

        if (colourCounter == 255)
        {
            colourIncrement = false;
        }
    }
    else 
    {
        colourCounter--;
        circleFill = color(255 - colourCounter, 0 , 0 + colourCounter);
        fill(circleFill);
        
        if(colourCounter == 0)
        {
            colourIncrement = true;
        }
    }
}

void  bounceCalculator()
{   

    circleY += 1 * direction ; // movement of the ball

    if (circleY == 0 + (cicleRadius/2)) // top of the window minus the ball
    {
        reverseDirection();
    }
    else if (circleY == ( (height) - (cicleRadius/2) )) //bottom of the window minus the ball
    {
        reverseDirection();
        numberOfBouces ++; 
    } 
    else if ( (numberOfBouces > 0) && (circleY == ( (height - (height / (numberOfBouces * 2)) )))) // if the ball hits the new top of the arc
    {
        reverseDirection();
    }

    if( numberOfBouces >=6)
    {
        ellipse(circleX, height - cicleRadius/2, cicleRadius, cicleRadius);
    }
    else
    {
        ellipse(circleX, circleY, cicleRadius, cicleRadius);
    }
}

void reverseDirection()
{
    direction = direction * -1;
}