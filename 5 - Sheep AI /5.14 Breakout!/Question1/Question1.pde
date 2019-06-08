
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
PFont gameFont;
int lifesRemaining; 
int score;
boolean gameOver = false;

//Brick Variables
final int numOfBricks = 10;
color[] brickColour = new color[numOfBricks];
int[] brickX = new int[numOfBricks];
int[] brickY = new int[numOfBricks];
int brickWidth; 
int brickHeight; 

void setup() 
{
    size(512, 512);
    background(100);
    rectMode(CENTER);

    gameFont =  loadFont("Arial-Black-48.vlw");
    textFont(gameFont, 36);
    textAlign(CENTER,CENTER);
    
    int brickNum = 0; 
    brickWidth = width/numOfBricks; 
    brickHeight = height/30; 
    while(brickNum < brickX.length)
    {
        brickX[brickNum] = (width/numOfBricks) * brickNum + brickWidth/2;
        brickY[brickNum] = 0 + brickHeight/2; 
        brickColour[brickNum] = color(255 , 0, 0);
        brickNum++;
    }

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
    fill(255);
    rect(paddleX, paddleY, paddleWidth, paddleHeight);
    ellipse(ballX, ballY, ballSize, ballSize);
    bounds();
    ballDisplacement();
    drawUI();
    drawBricks();
    hitBrick();
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
    else if (ballY >= paddleY - paddleHeight/2 - ballSize/2 && ballY <= paddleY + paddleHeight/2) // paddle handling
    {
        if (ballX >= paddleX - paddleWidth/2 && ballX <= paddleX + paddleWidth/2)
        {
            println("Hit Paddle");
            ballYDirection = -1;
            ballXDirection = changeDirection(ballXDirection);
        }
    }
    else if (ballY >= height + ballSize/2) // Off Playzone
    {
        if(lifesRemaining == 0)     
        {
            gameOver = true;
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

void drawUI()
{
    text(lifesRemaining, width - 100, 100 );
    text(score, 100, 100);
    if (gameOver == true)
    {
        text("Game Over! You LOSE!", width/2, height/2);
    }
}

void drawBricks()
{
    int brickNum = 0;
    while (brickNum < brickX.length)
    {   
        if (brickColour[brickNum] !=  color(0, 0, 0))
        {
            fill(brickColour[brickNum]);
            rect(brickX[brickNum], brickY[brickNum], brickWidth, brickHeight);
        } 
        brickNum++;
    }
}

void hitBrick()
{   
    int brickNum = 0; 
    
    while (brickNum < brickX.length)
    {
        if (brickColour[brickNum] != color(0, 0, 0))
        {
            if (ballY >= brickY[brickNum] - brickHeight/2 && ballY <= brickY[brickNum] + brickHeight/2 )
            {
                if (ballX >= (brickX[brickNum] - brickWidth/2) && ballX <= (brickX[brickNum] + brickWidth/2) )
                {
                    brickColour[brickNum] = color(0, 0, 0); // change colour if hit
                    ballXDirection = changeDirection(ballXDirection);
                    ballYDirection = ballYDirection * -1;
                }  
            }
        }  
        brickNum++;
    }
    
}