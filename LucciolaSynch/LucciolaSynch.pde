import controlP5.*;

ControlP5 cp5;
Slider slider_n;
Slider slider_k;


int n = 50;
float K =3 ;
LucciolaSystem luccioleSyst;
void setup(){
  size(1200,800);
  luccioleSyst = new LucciolaSystem(n,K);
  cp5 = new ControlP5(this);
  slider_n= cp5.addSlider("sliderValue_n").setRange(0, 100).setValue(50);
  slider_k= cp5.addSlider("sliderValue_k").setRange(0, 3).setValue(50);
  slider_k.setPosition(10,70);
  cp5.show();

}

void draw(){
  background(0);
  int value_n = (int) slider_n.getValue();
  int value_k = (int) slider_k.getValue();
  text("Slider number: " + value_n, 10, 20);
  text("Slider coupling: " + value_k, 10, 60);
  if(K!=value_k){
      luccioleSyst.change_coupling(value_k);
      K = value_k;
  }

  luccioleSyst.show();


  if(n-value_n>0){
      luccioleSyst.eliminate(n,value_n);
      n = value_n;
  }else if(n-value_n<0){
    luccioleSyst.add_firefly(n,value_n);
    n = value_n;
  }
  else{
  }

}

void mousePressed(){
  luccioleSyst.mousePressed();
}
