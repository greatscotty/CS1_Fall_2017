// Ball Variables
int ballX;
int ballY;
int ballSize;
int ballDirection;

//Paddle Varianbles
int paddleWidth;
int paddleHeight;
int paddle1X;
int paddle1Y;
int paddle2X;
int paddle2Y;

//Score Variables
PFont scoreFont;
int scoreY;
int score1X;
int score2X;
int scorePlayer1;
int scorePlayer2; 

void setup() 
{
    size(1000, 800);
    background(0);
    
    ballX = 100;
    ballY = 100;
    ballSize = width /50;
    ballDirection = 1;

    paddleHeight =  height/8;
    paddleWidth = width/50;

    paddle1Y = paddle2Y = height/2;

    paddle1X = 5 + (paddleWidth/2);
    paddle2X = width - (paddleWidth/2) - 5;

    scoreFont = loadFont("Arial-Black-48.vlw");
    textFont(scoreFont, 48);
    textAlign(CENTER, CENTER);

    scoreY = height/15;
    score1X = width/4;
    score2X = 3*width/4;

    scorePlayer1 = 0;
    scorePlayer2 = 0; 
    
}

void draw() 
{
    background(0);
    drawDivider();

    drawScore(scorePlayer1, score1X);
    drawScore(scorePlayer2, score2X);

    drawBall();
    drawPaddle(paddle1X, paddle1Y);
    drawPaddle(paddle2X, paddle2Y);

    hitSomething();
}

void drawDivider()
{
    fill(255);
    noStroke();
    rectMode(CENTER);
    rect(width/2, height/2, 5, height);
}

void drawBall()
{
    fill(0,0,255);
    stroke(255);
    ellipse(ballX, ballY, ballSize, ballSize);
}

void drawPaddle(int x, int y)
{   
    fill(0,255,0);
    stroke(255);
    rectMode(CENTER);

    if (y > (height - (paddleHeight/2) ) )
    {
        if (x == paddle1X && y==paddle1Y)
        {
            paddle1Y = height - paddleHeight/2;
        }
        else if (x == paddle2X && y==paddle2Y)
        {
            paddle2Y = height - paddleHeight/2;
        }
    }
    else  if (y <= (0 +  paddleHeight/2))
    {      
        if (x == paddle1X && y==paddle1Y)
        {
            paddle1Y = 0 + paddleHeight/2;
        }
        else if (x == paddle2X && y==paddle2Y)
        {
            paddle2Y = 0 + paddleHeight/2;
        }
    }
    rect(x, y, paddleWidth, paddleHeight);
}

void drawScore(int score, int x)
{   
    fill(255);
    stroke(255);
    text(score, x, scoreY);  
}

void keyPressed()
{
    //Paddle Movement Switches
    switch (key)
    {
        case 'w' :
            paddle1Y-=20;
        break;	
        case 's' :
            paddle1Y+=20;
        break;	
        case 'o' :
            paddle2Y-=20;
        break;	
        case 'k' :
            paddle2Y+=20;
        break;	
    }
}
void hitSomething()
{

    //check if hit paddle 1
    if (ballX == paddle1X + paddleWidth/2)
    {   
        if ((ballY <= paddle1Y + paddleHeight/2) &&  (ballY >= paddle1Y - paddleHeight/2))
        {
        ballDirection();
        }
    }

    // check if hit paddle 2
       if (ballX == paddle2X - paddleWidth/2)
    {   
        if ((ballY <= paddle2Y + paddleHeight/2) &&  (ballY >= paddle2Y - paddleHeight/2))
        {
        ballDirection();
        }
    }
    //check if hit ceiling of floor

    //move the ball
    outOfBounds();
}

void ballMovement()
{    
    ballX += (1 * ballDirection);
}

void ballDirection()
{
    ballDirection = ballDirection * -1;
}

void outOfBounds()
{
    if (ballX > width + ballSize)
    {
        ballX = width/50 + 100;
        ballY =  height/8;
        scorePlayer1++;
        ballMovement();
    }
    else if (ballX < 0 - ballSize)
    {
        ballX = 49*width/50 - 100;
        ballY =  height/8;
        scorePlayer2++;
        ballMovement();
    }
    else
    {
    ballMovement();
    }
}