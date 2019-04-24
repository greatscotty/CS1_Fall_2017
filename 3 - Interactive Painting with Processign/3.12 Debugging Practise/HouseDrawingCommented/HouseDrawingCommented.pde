size(500,500);
background(255);

int houseWidth = 200;
int houseHeight = 150;
int houseX = width/2;
int houseY = height*2/3;

fill(70, 162, 31);
rect(0, height*2/3, width, height/3);

fill(234,210,121);

rectMode(CENTER);

//variables are swapped for houseHeight and width
rect(houseX, houseY, houseHeight, houseWidth);

fill(234, 121, 125);
triangle(houseX + houseHeight/2, //x1
         houseY - houseWidth/2, //x2
         houseX - houseHeight/2, //x2
         houseY - houseWidth/2, //y2
       
       //House Y is applied here and would need to be House X as this is the X coordinate. 
         houseX, //x3
         houseY - houseWidth/2 - 100);//y3
