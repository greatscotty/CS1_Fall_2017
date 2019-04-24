size(1000,500);

float rectX = width/2.0;
int rectY = 2*height/6;
float rectWidth = width/3.0;
int rectHeight = height/4;

background(65,116,30);

fill(246,231,75);
rectMode(CENTER);
rect(rectX,rectY, rectWidth - rectWidth/50,rectHeight);
rect(rectX + rectWidth ,rectY,rectWidth - rectWidth/50, rectHeight);
rect(rectX - rectWidth ,rectY,rectWidth - rectWidth/50, rectHeight);
