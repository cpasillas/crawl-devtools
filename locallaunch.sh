#!/bin/bash
DEVDIR=/Users/cpasillas/cdev
OUTDIR=$DEVDIR/crawlout
DATADIR=$DEVDIR/local-crawl-data
#CRAWLROOT=$DEVDIR/cpass-crawl/crawl
#CRAWLSRC=$CRAWLROOT/crawl-ref/source
WEBROOT=$DEVDIR/crawl-web-config

cd $WEBROOT
# Copy personal config into webserver dir.
cp $WEBROOT/config.py $OUTDIR/webserver
# Point to correct needed directories
sed -i -E "s:{{root_data_dir}}:$DATADIR:" $OUTDIR/webserver/config.py
sed -i -E "s:{{root_binary_dir}}:$OUTDIR:" $OUTDIR/webserver/config.py
sed -i -E "s:{{root_webserver_dir}}:$OUTDIR/webserver:" $OUTDIR/webserver/config.py
sed -i -E "s:{{util_dir}}:$OUTDIR/webserver:" $OUTDIR/webserver/config.py

cp $WEBROOT/webtiles-init-player.sh $OUTDIR/webserver
chmod 755 $OUTDIR/webserver/webtiles-init-player.sh
sed -i -E "s:{{data_root}}:$DATADIR:" $OUTDIR/webserver/webtiles-init-player.sh

# URL you are serving on, changeable here for development purposes
#sed -i '/player_url/ s|None|"http://localhost"|' $CRAWLSRC/webserver/config.py

# Run webserver
cd $OUTDIR/webserver
python server.py
