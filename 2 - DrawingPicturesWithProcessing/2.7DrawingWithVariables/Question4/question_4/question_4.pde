size(500,500);
background(255,255,255);

int wheel = 0;
int window = 0; 
int wheelOffset = 0; 
int headlight = 0; 
int carLength = 2*width/3 ;
int carHeight = height/5; 
int carHood = carLength/2; 
int carTrunk = carLength/2;
int carPassengerBayWidth = carLength-carHood;
int carPassengerBayHeight = carHeight*2;

int carBodyX = width/2;
int carBodyY = 3*height/5;

//Set fill colour for car
fill(255,0,0);
noStroke();

//Build Passenger Bay
ellipseMode(CENTER);
ellipse(carBodyX,carBodyY - carHeight/2,carPassengerBayWidth,carPassengerBayHeight);

//Build body of car
rectMode(CENTER);
rect(carBodyX,carBodyY,carLength,carHeight);

//Build Headlight
fill(200,200,200);

int headlightX = carBodyX - 9*carHood/10; 
int headlightY= carBodyY - carHeight/2;
int headlightHeight = carHeight/4;
int headlightWidth = carHood/3;

ellipse(headlightX,headlightY, headlightWidth,headlightHeight);

//make windows
int windowWidth = carPassengerBayWidth/4;

triangle(carBodyX - carPassengerBayWidth/8, 
carBodyY - carPassengerBayHeight/8 -carHeight/4 ,
carBodyX - carPassengerBayWidth/8 - windowWidth, 
carBodyY - carPassengerBayHeight/8 -carHeight/4 ,
carBodyX - carPassengerBayWidth/8 , 
carBodyY - carPassengerBayHeight/4 - windowWidth -carHeight/4
);
triangle(carBodyX + carPassengerBayWidth/8, 
carBodyY - carPassengerBayHeight/8-carHeight/4,
carBodyX + carPassengerBayWidth/8 + windowWidth, 
carBodyY - carPassengerBayHeight/8 -carHeight/4,
carBodyX + carPassengerBayWidth/8 , 
carBodyY - carPassengerBayHeight/4 - windowWidth -carHeight/4
);

//Make wheels
fill(0);
int wheelSize = carLength/4;

ellipse(carBodyX + carLength/4,carBodyY + carHeight/2,wheelSize,wheelSize);
ellipse(carBodyX - carLength/4,carBodyY + carHeight/2,wheelSize,wheelSize);
