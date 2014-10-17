#!/bin/sh

cd ~/$2/terminology-$2 && make distclean
./autogen.sh
cp -R ~/$2/terminology-$2 /media/sda5/Bodhi/e17_debs/$1/terminology-$1
cd /media/sda5/Bodhi/e17_debs/$1
tar czvf /media/sda5/Bodhi/e17_debs/$1/terminology-$1.tar.gz terminology-$1/


cd /media/sda5/Bodhi/e17_debs/$1/terminology-$1
make distclean
dh_make -e jeffhoogland@linux.com -f ../terminology-$1.tar.gz

cp /media/sda5/Bodhi/bodhibuildscripts/controlfiles/terminology/control debian/
dpkg-buildpackage -rfakeroot
sudo dpkg -i ../terminology*.deb
