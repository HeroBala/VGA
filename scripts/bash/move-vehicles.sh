#!/bin/bash

# Absolute or relative from script's location
SRC="../frontend/assets/models/environment"
DST="../frontend/assets/models/vehicles"

# Move civilian vehicles
mv "$SRC/Car.glb" "$DST/civilian/"
mv "$SRC/Car (1).glb" "$DST/civilian/"
mv "$SRC/Convertible.glb" "$DST/civilian/"
mv "$SRC/Convertible (1).glb" "$DST/civilian/"
mv "$SRC/Mazda RX-7.glb" "$DST/civilian/"
mv "$SRC/Motorcycle.glb" "$DST/civilian/"
mv "$SRC/Motorcycle%2C Suzuki SV650.glb" "$DST/civilian/"
mv "$SRC/Pickup Truck.glb" "$DST/civilian/"
mv "$SRC/Scooter.glb" "$DST/civilian/"
mv "$SRC/Sportster.glb" "$DST/civilian/"
mv "$SRC/Van.glb" "$DST/civilian/"

# Move emergency vehicles
mv "$SRC/Ambulance.glb" "$DST/emergency/"
mv "$SRC/Police Car.glb" "$DST/emergency/"

# Move public transport vehicles
mv "$SRC/SCHOOL BUS.glb" "$DST/public/"
mv "$SRC/Taxi.glb" "$DST/public/"
mv "$SRC/Tram.glb" "$DST/public/"
mv "$SRC/Montreal Bus.glb" "$DST/public/"

# Move military vehicles
mv "$SRC/Tank.glb" "$DST/military/"
mv "$SRC/Jeep.glb" "$DST/military/"
mv "$SRC/Military Motorbike.glb" "$DST/military/"

# Move special vehicles
mv "$SRC/Dump truck.glb" "$DST/special/"
mv "$SRC/Truck Armored.glb" "$DST/special/"
mv "$SRC/Helicopter.glb" "$DST/special/"

