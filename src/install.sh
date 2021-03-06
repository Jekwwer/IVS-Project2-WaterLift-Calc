#!/bin/sh

# Script that generates .deb package

# Backup original gui.py
cat gui.py > backup_gui.py

awk '{gsub("manual_for_help_window.pdf","/usr/share/waterlift-calc/manual_for_help_window.pdf")}1' gui.py > tmp_gui.py ; cat tmp_gui.py > gui.py ; rm -f tmp_gui.py
awk '{gsub("../images/waterlift_calc_logo.png","/usr/share/pixmaps/waterlift_calc_logo.png")}1' gui.py > tmp_gui.py ; cat tmp_gui.py > gui.py ; rm -f tmp_gui.py

mkdir -p '../install/usr/share/waterlift-calc' 2>/dev/null
cp gui.py '../install/usr/share/waterlift-calc/gui.py'
chmod +x '../install/usr/share/waterlift-calc/gui.py'
cp manual_for_help_window.pdf '../install/usr/share/waterlift-calc/manual_for_help_window.pdf'
cp math_lib.py '../install/usr/share/waterlift-calc/math_lib.py'
mkdir -p '../install/usr/share/pixmaps' 2>/dev/null
cp ../images/waterlift_calc_logo.png '../install/usr/share/pixmaps/waterlift_calc_logo.png'
mkdir -p '../install/usr/bin' 2>/dev/null
ln -sf /usr/share/waterlift-calc/gui.py '../install/usr/bin/waterlift-calc'
chmod 0775 '../install/DEBIAN/postinst'
chmod 0775 '../install/DEBIAN/control'
chmod +x '../install/usr/share/applications/waterlift_calc.desktop'
dpkg-deb --build '../install/' '../install/waterlift_calc-1.0-ubuntu20.04-x64.deb'
rm -r '../install/usr/bin'
rm -r '../install/usr/share/waterlift-calc'
rm -r '../install/usr/share/pixmaps'

cat backup_gui.py > gui.py
rm -r backup_gui.py

# END OF install.sh FILE
