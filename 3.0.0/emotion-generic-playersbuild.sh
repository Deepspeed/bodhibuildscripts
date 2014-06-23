#!/bin/sh

cd /home/jeff/$2/emotion_generic_players-$2 && make distclean
#./autogen.sh
cp -R /home/jeff/$2/emotion_generic_players-$2 /media/sda5/Bodhi/e17_debs/$1/emotion-generic-players_$1
cd /media/sda5/Bodhi/e17_debs/$1
tar czvf /media/sda5/Bodhi/e17_debs/$1/emotion-generic-players_$1.tar.gz emotion-generic-players_$1/

cd /media/sda5/Bodhi/e17_debs/$1/emotion-generic-players_$1
dh_make -p emotion-generic-players_$1 -e jeffhoogland@linux.com -f ../emotion-generic-players_$1.tar.gz

cp /media/sda5/Bodhi/bodhibuildscripts/controlfiles/emotion-generic-players/* debian/
dpkg-buildpackage -rfakeroot
dpkg -i ../emotion-generic-players*.deb