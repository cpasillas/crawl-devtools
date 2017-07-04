#!/bin/bash
START_SECS=`date +%s` 
DEVDIR=/Users/cpasillas/cdev
OUTDIR=$DEVDIR/crawlout
DATADIR=$DEVDIR/local-crawl-data
CRAWLROOT=$DEVDIR/crawl
CRAWLSRC=$CRAWLROOT/crawl-ref/source
WEBROOT=$DEVDIR/crawl-web-config

# Crawl code for special versions

# Build Turkey
cd $CRAWLROOT
git checkout turkey-0.20
git submodule update --init
cd $CRAWLSRC
make clean

END_SECS=`date +%s` 
echo "*************** TOTAL CLEAN TIME IN SECONDS:"
echo `expr $END_SECS - $START_SECS`
