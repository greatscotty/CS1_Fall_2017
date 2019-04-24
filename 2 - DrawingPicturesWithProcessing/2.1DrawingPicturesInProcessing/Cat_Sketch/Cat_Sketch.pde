/*
Drawing Pictures with Processing
by Scott Jensen

for COMP 1405: Introduction to Computer Science 1.
It illustrates how to draw basic shapes in
Processing as well as how to use variables to
eliminate repetition (and errors that might
result from repetition).

*/

//set the window size
size(500,500);

int horizon = height*2/3;

int catHeadX = 200;
int catHeadY = 300; 
int catHeadWidth = 90;
int catHeadHeight = 110;

int catBodyX = catHeadX + 50;
int catBodyY = catHeadY + 100;
int catBodyWidth = 150;
int catBodyHeight = 120;

//colour the background
noStroke();
fill(174, 211, 252);
rect(0,0,width,horizon);
fill(150,214,144);
rect(0,horizon,width,height-horizon);

//create the sun
stroke(0);
strokeWeight(2);

fill(241,238,114);
ellipse(80,80,100,100);

//create the cats body
fill(220,175,35);
ellipse(catBodyX, catBodyY,catBodyWidth,catBodyHeight);
//create the cat heard
ellipse(catHeadX,catHeadY,catHeadWidth,catHeadHeight);

//create the cats feet
ellipse(catBodyX - catBodyWidth/3, catBodyY + catBodyHeight/2 - 5, 20, 20);
ellipse(catBodyX - catBodyWidth/5, catBodyY + catBodyHeight/2 - 5,20,20);
ellipse(catBodyX + catBodyWidth/3, catBodyY + catBodyHeight/2 - 5, 20, 20);
ellipse(catBodyX + catBodyWidth/5, catBodyY + catBodyHeight/2 - 5,20,20);

//create cats tail
ellipse(catBodyX + catBodyWidth/2.5, catBodyY - catBodyHeight/2.5,10,40);

int catEarWidth = 15;
int catEarOffset = 10;

//create cats ears
triangle(catHeadX - catHeadWidth/4, 
catHeadY - catHeadHeight/2 +catEarOffset -catEarWidth,
 catHeadX - catHeadWidth/4 + catEarWidth/2, 
 catHeadY - catHeadHeight/2 +catEarOffset,
 catHeadX - catHeadWidth/4 - catEarWidth/2,
catHeadY - catHeadHeight/2 +catEarOffset);

triangle(catHeadX + catHeadWidth/4, 
catHeadY - catHeadHeight/2 +catEarOffset -catEarWidth,
 catHeadX + catHeadWidth/4 + catEarWidth/2, 
 catHeadY - catHeadHeight/2 +catEarOffset,
 catHeadX + catHeadWidth/4 - catEarWidth/2,
catHeadY - catHeadHeight/2 +catEarOffset);

//////
// Draw cat's eyes
fill(0);
ellipse(catHeadX - catHeadWidth/5,
        catHeadY - catHeadHeight/5,
        5, 10);
ellipse(catHeadX + catHeadWidth/5,
        catHeadY - catHeadHeight/5,
        5, 10);
        
//////
// Draw cat's mouth
fill(0);
ellipse(catHeadX,
        catHeadY + catHeadHeight/5,
        10,15);
