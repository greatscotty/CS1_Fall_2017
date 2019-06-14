
String[] countryOfCitizenship;
int[] numYear2006;
int[] numYear2007;
int[] numYear2008;
int[] numYear2009;
int[] numYear2010;
int[] numYear2011;
int[] numYear2012;
int[] numYear2013;
int[] numYear2014;
int[] numYear2015;
int[] numYearQ1_Q32016;

final String filename = "CleanedUpData.csv";

void setup() 
{
  String[] lines = loadStrings(filename);
  int numCountries =  lines.length -3 -(249-191); 

  countryOfCitizenship = new String[numCountries];
  numYear2006 = new int[numCountries]; 
  numYear2007 = new int[numCountries];
  numYear2008 = new int[numCountries];
  numYear2009 = new int[numCountries];
  numYear2010 = new int[numCountries];
  numYear2011 = new int[numCountries];
  numYear2012 = new int[numCountries];
  numYear2013 = new int[numCountries];
  numYear2014 = new int[numCountries];
  numYear2015 = new int[numCountries];
  numYearQ1_Q32016 = new int[numCountries];


  int lineIndex = 0;
  while (lineIndex < lines.length)
  {
    if (lineIndex < 4 || lineIndex >= lines.length - (249-191)) 
    {  
      lineIndex++;
      continue;
    }

    int countryNum = lineIndex -4;
    String[] splitLine = lines[lineIndex].split(",");

    countryOfCitizenship = splitLine[0];
    numYear2006 = Integer.parseInt(splitLine[1]); 
    numYear2007 = Integer.parseInt(splitLine[2]);
    numYear2008 = Integer.parseInt(splitLine[3]);
    numYear2009 = Integer.parseInt(splitLine[4]);
    numYear2010 = Integer.parseInt(splitLine[5]);
    numYear2011 = Integer.parseInt(splitLine[6]);
    numYear2012 = Integer.parseInt(splitLine[7]);
    numYear2013 = Integer.parseInt(splitLine[8]);
    numYear2014 = Integer.parseInt(splitLine[9]);
    numYear2015 = Integer.parseInt(splitLine[10]);
    numYearQ1_Q32016 = Integer.parseInt(splitLine[11]);
      
    lineIndex++;
  }

  int countryNum = 0;
  while (countryNum < numCountries)
  {
    println(countryOfCitizenship[countryNum]);
    countryNum++;
  }
  
  countryNum = 0;
  while (countryNum < numCountries)
  {
    println(numYear2006[countryNum]);
    countryNum++;
  }
}