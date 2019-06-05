
//Paddle Variables
float paddleY;
float paddleX; 
float paddleWidth; 
float paddleHeight;

//Ball Variables
float ballY;
float ballX; 
float ballSize;
float ballSpeed;
float ballXDirection;
float ballYDirection; 

//Game Variables
int lifesRemaining; 

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
    ballSpeed = 2;
    ballXDirection = 1; 
    ballYDirection = -1;

    lifesRemaining = 3;
}

void draw() 
{
    background(100);
    rect(paddleX, paddleY, paddleWidth, paddleHeight);
    ellipse(ballX, ballY, ballSize, ballSize);
    bounds();
    ballDisplacement();
   
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

void paddleMovement( float distance)
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
    if (ballY <= 0 && ballX >= 0) // top of playzone
    {
        println("Hit Wall");
        ballYDirection = 1;
    }
    else if (ballX <= 0 && ballY >= 0) //left of playzone
    {
        println("Hit Wall");
        ballXDirection = 1;
    }
    else if (ballX >= width && ballY >= 0)  // right of playzone
    {
        println("Hit Wall");
        ballXDirection = -1;
    }
    else if (ballY >= paddleY - ballSize +10 && ballY <= paddleY + paddleHeight/2)
    {
        println("Hit Paddle");
        if (ballX >= paddleX - paddleWidth/2 && ballX <= paddleX + paddleWidth/2)
        {
            ballYDirection = -1;
            ballXDirection = changeDirection(ballXDirection);
        }
    }
    else if (ballY >= height + ballSize/2)
    {
        if(lifesRemaining == 0)     
        {
            println("Game Over, YOU LOSE!");
        }
        else
        {
            println("Out of Bounds, Lose a Life!");
            ballSetup(); 
            lifesRemaining--;
        } 
    }

}

void ballDisplacement()
{    
    ballX +=  ballXDirection * ballSpeed;
    ballY +=  ballYDirection * ballSpeed;
}

float changeDirection(float direction)
{
    return random(-1, 1);
}

void ballSetup()
{
    ballX = paddleX; 
    ballSize = paddleWidth/4; 
    ballY = paddleY - ballSize;
    ballSpeed = 2;
    ballXDirection = 1; 
    ballYDirection = -1;
}