#!/bin/sh

awk '{gsub(/manual_for_help_window.pdf/,"/usr/share/waterlift_calc/manual_for_help_window.pdf")}1' gui.py > tmp_gui.py ; cat tmp_gui.py > gui.py ; rm -f tmp_gui.py

mkdir -p '../install/usr/share/waterlift_calc' 2>/dev/null
cp gui.py '../install/usr/share/waterlift_calc/gui.py'
cp manual_for_help_window.pdf '../install/usr/share/waterlift_calc/manual_for_help_window.pdf'
cp math_lib.py '../install/usr/share/waterlift_calc/math_lib.py'
mkdir -p '../install/usr/share/pixmaps' 2>/dev/null
cp ../images/WaterLift_Calculator_logo.png '../install/usr/share/pixmaps/waterlift_calc_logo.png'
mkdir -p '../install/usr/bin' 2>/dev/null
ln -sf /usr/share/waterlift_calc/gui.py '../install/usr/bin/waterlift_calc'
chmod 0775 '../install/DEBIAN/postinst'
chmod 0775 '../install/DEBIAN/control'
dpkg-deb --build '../install/' '../install/waterlift_calc-1.0-ubuntu20.04-x64.deb'