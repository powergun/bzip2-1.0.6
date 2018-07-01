#!/usr/bin/env sh

BZIP2=$1
DIR=`dirname $0`
SOURCE_DIR=$DIR/..
TMPDIR=

setUp() {
    set -e
    test ! "$BZIP2" && echo "can not find bzip2 program" && exit 1
    rm -rf /tmp/sut
    mkdir /tmp/sut
    TMPDIR=/tmp/sut
    cat $SOURCE_DIR/words1
}

test1() {
    $BZIP2 -1  < $SOURCE_DIR/sample1.ref > $TMPDIR/sample1.rb2
    cmp $SOURCE_DIR/sample1.bz2 $TMPDIR/sample1.rb2
    echo "test 1: pass"
}

test2() {
    $BZIP2 -2  < $SOURCE_DIR/sample2.ref > $TMPDIR/sample2.rb2
    cmp $SOURCE_DIR/sample2.bz2 $TMPDIR/sample2.rb2
    echo "test 2: pass"
}


#./bzip2 -3  < sample3.ref > sample3.rb2
#./bzip2 -d  < sample1.bz2 > sample1.tst
#./bzip2 -d  < sample2.bz2 > sample2.tst
#./bzip2 -ds < sample3.bz2 > sample3.tst


#cmp sample3.bz2 sample3.rb2
#cmp sample1.tst sample1.ref
#cmp sample2.tst sample2.ref
#cmp sample3.tst sample3.ref

tearDown() {
    head -n 4 $SOURCE_DIR/words3
    rm -rf /tmp/sut
}

setUp
test1
test2
tearDown
