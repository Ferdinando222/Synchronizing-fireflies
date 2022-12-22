import controlP5.*;

ControlP5 cp5;
Slider slider_n;
Slider slider_k;
Slider slider_dist;


int n = 50;
float K =3 ;
float dist_tresh = 100;
LucciolaSystem luccioleSyst;
void setup(){
  size(1200,800);
  luccioleSyst = new LucciolaSystem(n,K);
  cp5 = new ControlP5(this);
  slider_n= cp5.addSlider("sliderValue_n").setRange(0, 500).setValue(50);
  slider_k= cp5.addSlider("sliderValue_k").setRange(0, 10).setValue(5);
  slider_k.setPosition(10,70);
  slider_dist= cp5.addSlider("sliderValue_dist").setRange(0, 200).setValue(100);
  slider_dist.setPosition(10,110);
  cp5.show();

}

void draw(){
  background(0);
  int value_n = (int) slider_n.getValue();
  float value_k = slider_k.getValue();
  float value_dist = slider_dist.getValue();
  text("Slider number: " + value_n, 10, 20);
  text("Slider coupling: " + value_k, 10, 60);
  text("Slider distance: " + value_dist, 10, 100);
  if(K!=value_k){
      luccioleSyst.change_coupling(value_k);
      K = value_k;
  }
  
  if(dist_tresh!=value_dist){
    luccioleSyst.change_distance(value_dist);
    dist_tresh=value_dist;
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
