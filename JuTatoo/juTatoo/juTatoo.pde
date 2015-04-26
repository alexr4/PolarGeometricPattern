//Sketch properties
int pWidth = 1280;
int pHeight = 720;
String appName = "Julya's tatoo";
String version = "Alpha";
String subVersion = "0.0.1";
String frameName;

//Tatoo parameters
PVector center;
float globalRadius;
int nbCircles;
int nbCirclesInGlobal;
int nbCircleInSecond;
ArrayList<Float> radiusList;
ArrayList<PVector> globalCircles;
ArrayList<PVector> secondCircles;

void setup()
{
  size(pWidth, pHeight, P3D);
  smooth(8);
  appParameter();
}

void draw()
{
  background(255);

  initTatoo();
  drawTatoo();
  showFpsOnFrameTitle();
}

//App Parameters
void appParameter()
{
  frameName = appName+"_"+version+"_"+subVersion;
  frame.setTitle(frameName);
}

void showFpsOnFrameTitle()
{
  frame.setTitle(frameName+"    FPS : "+int(frameRate));
}

