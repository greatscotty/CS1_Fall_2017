int goldilocksHeadX;
int goldilocksHeadY;
int golidlocksHeadHeight;
int goldilockBodyOffset;
int bearBodyWidth;
int bearBodyHeight;
int bearX;
int bearY;

void setup()
{
  size(1000,900);
  background(220,234,212);
  
  goldilocksHeadX = width/2;
  goldilocksHeadY = height/6;
  goldilockBodyOffset = width/7;
  golidlocksHeadHeight = height/8;
  
  
  bearX = width/2 ;
  bearY = 8*height/10 ;
  bearBodyWidth = width/5;
  bearBodyHeight =  height/5;
 
}

void draw()
{  
    //Draw Goldilocks
    goldilocks(goldilocksHeadX,goldilocksHeadY,goldilockBodyOffset);
    
    //Draw Bears
    bear(bearX,bearY,bearBodyWidth,bearBodyHeight);
    bear(bearX + bearBodyWidth + (bearBodyWidth/2),bearY,bearBodyWidth,bearBodyHeight);
    bear(bearX - bearBodyWidth - (bearBodyWidth/2),bearY,bearBodyWidth,bearBodyHeight);
}

//Bear is perfect!!

void bear(int bearX,int bearY, int bearBodyWidth,int bearBodyHeight)
{
   //Build Bear Body
   fill(171,99,25);
   ellipse(bearX,bearY,bearBodyWidth,bearBodyHeight);
   
   //Build Bear Head
   ellipse(bearX, bearY - (3*bearBodyHeight/4), bearBodyWidth/2, 3*bearBodyHeight/4); //<>//
   
   //build Bear Ear
   ellipse(bearX+(bearBodyWidth/2)/3, bearY- (3*bearBodyHeight/4) - ((3*bearBodyHeight/4)/2),(bearBodyWidth/2)/3,(bearBodyWidth/2)/3 );
   ellipse(bearX-(bearBodyWidth/2)/3, bearY- (3*bearBodyHeight/4) - ((3*bearBodyHeight/4)/2),(bearBodyWidth/2)/3,(bearBodyWidth/2)/3 );
}

void goldilocks(int goldilocksHeadX, int goldilocksHeadY, int goldilockBodyOffset)
{ //<>//
  
    fill(225,156,154);
  triangle(
    goldilocksHeadX,
    goldilocksHeadY + goldilocksHeadY/4,
    goldilocksHeadX + (goldilockBodyOffset/2),
    golidlocksHeadHeight*2 + goldilocksHeadY,
    goldilocksHeadX - (goldilockBodyOffset/2),
    golidlocksHeadHeight*2 + goldilocksHeadY
  );
  
  ellipseMode(CENTER);
  fill(249,230,207);
  ellipse(goldilocksHeadX,goldilocksHeadY,goldilockBodyOffset/2,golidlocksHeadHeight);
  

}
