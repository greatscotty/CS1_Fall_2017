int ballX;
int ballY;
int ballSize;

int paddle1X;
int paddle1Y;

int paddle2X;
int paddle2Y;

int paddleWidth;
int paddleHeight;

int scoreY;
int score1X;
int score2X;

PFont scoreFont;

void setup() 
{
    size(1000, 800);
    background(0);
    
    ballX = 100;
    ballY = 100;
    ballSize = width /50; 

    paddleHeight =  height/8;
    paddleWidth = width/50;

    paddle1Y = paddle2Y = height/2;

    paddle1X = 0 + (paddleWidth/2);
    paddle2X = width - (paddleWidth/2);

    scoreFont = loadFont("Arial-Black-48.vlw");
    textFont(scoreFont, 48);
    textAlign(CENTER, CENTER);

    scoreY = height/15;
    score1X = width/4;
    score2X = 3*width/4;
    
}

void draw() 
{
    background(0);
    drawDivider();

    drawScore(1, score1X);
    drawScore(1, score2X);

    drawBall();
    drawPaddle(paddle1X, paddle1Y);
    drawPaddle(paddle2X, paddle2Y);
}

void drawDivider()
{
    rectMode(CENTER);
    rect(width/2, height/2, 5, height);
}

void drawBall()
{
    ellipse(ballX, ballY, ballSize, ballSize);
}

void drawPaddle(int x, int y)
{
    rectMode(CENTER);
    rect(x, y, paddleWidth, paddleHeight);
}

void drawScore(int score, int x)
{   
    fill(255);
    text(score, x, scoreY);  
}

void keyPressed()
{
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