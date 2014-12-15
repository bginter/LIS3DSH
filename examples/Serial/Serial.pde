#include <Wire.h>
#include <LIS3DSH.h>

LIS3DSH accel;

const int FS_RANGE = 2;
const int TEMP_OFFSET = 25;

void setup() 
{
  Serial.begin(9600);
  Wire.begin();
  accel.enableDefault();
}

void loop() 
{
  int16_t x, y, z;
  int8_t temperature;

  accel.readAccel(&x, &y, &z);
  accel.readTemperature(&temperature);

  Serial.print("Accel ");
  Serial.print("X: ");
  Serial.print(x/pow(2,15) * FS_RANGE, DEC);
  Serial.print(" Y: ");
  Serial.print(y/pow(2,15) * FS_RANGE, DEC);
  Serial.print(" Z: ");
  Serial.print(z/pow(2,15) * FS_RANGE, DEC);
  Serial.print(" T: ");
  Serial.print(temperature + TEMP_OFFSET );
  Serial.println("C");

  delay(100);
}
