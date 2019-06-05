
//Paddle Variables
int paddleY;
int paddleX; 
int paddleWidth; 
int paddleHeight;

//Ball Variables
int ballY;
int ballX; 
int ballSize; 
int ballXDirection;
int ballYDirection; 

//

void setup() 
{
    size(512, 512);
    background(100);
    rectMode(CENTER);

    paddleX = width/2;
    paddleY = height - 40;
    paddleHeight = height/30;
    paddleWidth = width/6;

    ballX = paddleX; 
    ballSize = paddleWidth/4; 
    ballY = paddleY - ballSize;
    ballXDirection = 1;
    ballYDirection = -1;
}

void draw() 
{
    background(100);
    rect(paddleX, paddleY, paddleWidth, paddleHeight);
    ellipse(ballX, ballY, ballSize, ballSize);
    ballMovement();
    bounds();
}

void keyPressed()
{
    switch (key)
    {
        case 'w' :
            paddleMovement(-20);
        break;	
        case 'r' :
            paddleMovement(20);
        break;	
    }
}

void paddleMovement( int distance)
{
    if (paddleX < 0 + paddleWidth/2)
    {
        paddleX = paddleWidth/2;
    }
    else if (paddleX > width - paddleWidth/2) 
    {
        paddleX = width - paddleWidth/2;
    }
    else
    {
        paddleX += distance;
    }
}


void bounds()
{
    if (ballY == 0 && ballX >= 0)
    {
        println("Hit Wall");
    }
    else if (ballX == 0 && ballY >= 0) 
    {
        println("Hit Wall");
    }
    else if (ballX == width && ballY >= 0) 
    {
        println("Hit Wall");
    }
}

void ballMovement()
{    
    ballX += (1 * ballXDirection);
    ballY += (1 * ballYDirection);
}