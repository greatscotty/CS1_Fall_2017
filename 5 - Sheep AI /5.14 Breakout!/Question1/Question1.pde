
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
int ballState; 
final int normalState = 1;
final int fastState = 2;

//Game Variables
PFont gameFont;
int lifesRemaining; 
int score;
boolean gameOver = false;
boolean hitOrangeBrick = false;
boolean hitRedBrick = false;
int bricksHit = 0;

//Brick Variables
final int numOfBricks = 112;
final int numOfRows = 8;
final color[] listOfColours = 
{
    color(255, 0, 0), //red 
    color(230, 130 , 50), // orange
    color(0, 255, 0), // green
    color(245 , 200, 70) //yellow
};
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
    int brickRow = 0;
    int brickColumn = 0; 
    brickWidth = width/(numOfBricks/numOfRows); 
    brickHeight = height/30; 

    while(brickNum < brickX.length)
    {
        brickColour[brickNum] = listOfColours[brickRow/2]; // uses a cheat with int division. :) 
        brickX[brickNum] = brickWidth * brickColumn + brickWidth/2;
        brickY[brickNum] = (brickHeight *  brickRow) + brickHeight/2; 

        if((brickNum + 1) % (numOfBricks/numOfRows) == 0) 
        {
            brickColumn = 0;
        }
        else 
        {
            brickColumn++;       
        }
        if ((brickNum + 1) % (numOfBricks/numOfRows) == 0) 
        {
            brickRow++;
        }
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

    lifesRemaining = 2;
}

void draw() 
{
    background(100);
    fill(255);
    rect(paddleX, paddleY, paddleWidth, paddleHeight);
    ellipse(ballX, ballY, ballSize, ballSize);
    bounds();
    ballDisplacement();
    drawBricks();
    hitBrick();
    drawUI();
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
            // println("Out of Bounds, Lose a Life!");
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
    hitOrangeBrick = false;
    hitRedBrick = false;
    bricksHit = 0;
    ballState = normalState;
}

void drawUI()
{   
    fill(255);
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
        if (brickColour[brickNum] !=  color(0, 0, 0)) // if brick is black don't draw the brick 
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
        if (brickColour[brickNum] != color(0, 0, 0))// check if brick has been drawn. 
        {
            if (ballY >= brickY[brickNum] - brickHeight/2 && ballY <= brickY[brickNum] + brickHeight/2 )
            {
                if (ballX >= (brickX[brickNum] - brickWidth/2) && ballX <= (brickX[brickNum] + brickWidth/2) ) //brick is hit
                {
                    // println("increment score");
                    scorekeeper(brickColour[brickNum]);
                    bricksHit++;
                    ballSpeedChanger();
                    brickColour[brickNum] = color(0, 0, 0); // change colour if hit
                    ballXDirection = changeDirection(ballXDirection);
                    ballYDirection = ballYDirection * -1;
                }  
            }
        }  
        brickNum++;
    }
}

void scorekeeper(color brickColour)
{
    if (brickColour == color(255, 0, 0))//red 
    {
        score += 7;
        hitRedBrick = true;
    }
    else if (brickColour == color(230, 130 , 50)) // orange
    {
        score += 5;
        hitOrangeBrick = true;
    }
    else if (brickColour == color(0, 255, 0))// green
    {
        score += 3;
    }
    else if (brickColour == color(245 , 200, 70))//yellow
    {
        score += 1;
    }
}

void ballSpeedChanger()
{   
    if ((hitOrangeBrick == true || hitRedBrick == true) && ballState == normalState)
    {   
        ballSpeed = 2.5;
        println("Fast State ballSpeed: "+ballSpeed); 
        if (bricksHit >4 && bricksHit <=11)
        {
            ballSpeed = ballSpeed + 0.25;
            println("Fast state 4 hits ballSpeed: "+ballSpeed);
        }
        else if (bricksHit > 12)
        {
            ballSpeed = ballSpeed + 0.50;
            println("faste state 12 hits ballSpeed: "+ballSpeed);
        }
        ballState = fastState;
    }

    if (bricksHit == 4)
    {
        ballSpeed = ballSpeed + 0.25;
        println(" 4 hits ballSpeed: "+ballSpeed);
    }
    else if (bricksHit == 12)
    {
        ballSpeed = ballSpeed + 0.25;
        println(" 12 hits ballSpeed: "+ballSpeed);
    }
}