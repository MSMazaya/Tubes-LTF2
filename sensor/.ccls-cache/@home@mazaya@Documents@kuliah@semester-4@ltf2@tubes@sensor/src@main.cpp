#include<Arduino.h>
#include<esp_now.h>
#define DI0 32
#define DI1 35
#define DI2 34
#define DI3 39
#define window 500

int values0[window+1];
int values1[window+1];
int values2[window+1];
int values3[window+1];

void setup() {
  // put your setup code here, to run once:
//  pinMode(audio, INPUT_PULLUP);
  Serial.begin(9600);
  for(int i =0;i<window;i++){
    values0[i]=0;
    values1[i]=0;
    values2[i]=0;
    values3[i]=0;
  }
}

int counter = 0;
void loop() {
  if(counter > 50) {
    counter = 0;
  }
  // put your main code here, to run repeatedly:
  int di0 = analogRead(DI0);
  int di1 = analogRead(DI1);
  int di2 = analogRead(DI2);
  int di3 = analogRead(DI3);
  
  values0[counter]=di0;
  values1[counter]=di1;
  values2[counter]=di2;
  values3[counter]=di3;

  float average0 = 0;
  float average1 = 0;
  float average2 = 0;
  float average3 = 0;
  for(int i = 0; i<window; i++){
    average0+=values0[i];
    average1+=values1[i];
    average2+=values2[i];
    average3+=values3[i];
  }
  average0=average0/window;
  average1=average1/window;
  average2=average2/window;
  average3=average3/window;



  counter++;
}
