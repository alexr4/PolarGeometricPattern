import controlP5.*;
import processing.pdf.*;

ControlP5 cp5;

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
float rad;
int nbCircles;
int nbCirclesInGlobal;
int nbCircleInSecond;
ArrayList<Float> radiusList;
ArrayList<PVector> globalCircles;
ArrayList<PVector> secondCircles;

int Cercles = 6;
float Rayon = 250;
int CerclesRayonDivision = 4;

boolean saveOneFrame;
int nbSaved = 0;

void setup()
{
  size(pWidth, pHeight, P3D);
  smooth(8);
  appParameter();

  cp5 = new ControlP5(this);

  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  cp5.addSlider("Cercles")
    .setPosition(10, 10)
      .setColorCaptionLabel(color(0))
        .setRange(0, 20)
          ;

  cp5.addSlider("Rayon")
    .setPosition(10, 30)
      .setColorCaptionLabel(color(0))
        .setRange(0, 300)
          ;

  cp5.addSlider("CerclesRayonDivision")
    .setPosition(10, 50)
      .setColorCaptionLabel(color(0))
        .setRange(0, 10)
          ;

  cp5.addBang("bang")
    .setPosition(10, 80)
      .setSize(40, 40)
        .setTriggerEvent(Bang.RELEASE)
          .setLabel("Save .PDF")
            .setColorCaptionLabel(color(0))
              ;
}

void draw()
{
  background(255);
  initTatoo();

  if (saveOneFrame == true) {
    beginRecord(PDF, "julyaTatoo_"+nbSaved+".pdf");
  }

  drawTatoo();

  if (saveOneFrame == true) {
    endRecord();
    nbSaved ++;
    saveOneFrame = false;
  }
  showFpsOnFrameTitle();
}

public void bang() {
  saveOneFrame = true;
  println("### bang(). a bang event. setting background to ");
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

