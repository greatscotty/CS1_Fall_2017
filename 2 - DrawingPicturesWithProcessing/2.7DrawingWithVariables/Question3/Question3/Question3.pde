
size (500,500);
background(255,255,0);

int rugX = width/2;
int rugY = height/2 + height/3;
int rugWidth = 250;
int rugHeight = 100;

int fireplaceX = width/2;
int fireplaceY = height/2 ;
int fireplaceWidth = width/2 ;
int fireplaceHeight = height/3;

int chimneyWidth = width/3;
int chimneyHeight = height/2;

//make walls
noStroke();
fill(100,200,300);
rect(0,0,width, fireplaceY + fireplaceHeight/2 );

stroke(1);
//createRug
ellipse(rugX, rugY ,rugWidth,rugHeight);

//create colour rings in the rug
fill(0,255,0);
ellipse(rugX, rugY ,2*rugWidth/3,2*rugHeight/3);
fill(255,0,0);
ellipse(rugX, rugY ,rugWidth/3,rugHeight/3);

//creat Fireplace
rectMode(CENTER);
rect(fireplaceX, fireplaceY, fireplaceWidth, fireplaceHeight);

//create Chimney
rect(fireplaceX, fireplaceY -fireplaceHeight/2 - chimneyHeight/2  , chimneyWidth, chimneyHeight);

//create Fireplace hole
fill(0);
rect(fireplaceX, fireplaceY +fireplaceHeight/4, fireplaceWidth/2, fireplaceHeight/2);

// Toy1 
int toy1X = width/3;
int toy1Y = 3*height/4;
int windowOffset = 5;
int carCabWidth = 80;
int carCabHeight = 80;
int toy1WindowWidth = carCabWidth/4;
int wheelSize = 30;

ellipse(toy1X, toy1Y, carCabWidth, carCabHeight);
rect(toy1X, toy1Y+carCabWidth/4, 120, 50 );
fill(150);
ellipse(toy1X+(120/4), toy1Y+45, wheelSize, wheelSize );
ellipse(toy1X-(120/4), toy1Y+45, wheelSize, wheelSize );
triangle(toy1X - carCabWidth/8, 
toy1Y - carCabHeight/8,
toy1X - carCabWidth/8 - toy1WindowWidth, 
toy1Y - carCabHeight/8,
toy1X - carCabWidth/8 , 
toy1Y - carCabHeight/8 - toy1WindowWidth
);
triangle(toy1X + carCabWidth/8, 
toy1Y - carCabHeight/8,
toy1X + carCabWidth/8 + toy1WindowWidth, 
toy1Y - carCabHeight/8,
toy1X + carCabWidth/8 , 
toy1Y - carCabHeight/8 - toy1WindowWidth
);



// Toy2
int toy2X = 2*width/3;
int toy2Y = 3*height/4;
ellipse(toy2X, toy2Y, 100, 100);
