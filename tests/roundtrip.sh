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

test3() {
    $BZIP2 -3  < $SOURCE_DIR/sample3.ref > $TMPDIR/sample3.rb2
    cmp $SOURCE_DIR/sample3.bz2 $TMPDIR/sample3.rb2
    echo "test 3: pass"
}

test4() {
    $BZIP2 -d  < $SOURCE_DIR/sample1.bz2 > $TMPDIR/sample1.tst
    cmp $TMPDIR/sample1.tst $SOURCE_DIR/sample1.ref
    echo "test 4: pass"
}

test5() {
    $BZIP2 -d  < $SOURCE_DIR/sample2.bz2 > $TMPDIR/sample2.tst
    cmp $TMPDIR/sample2.tst $SOURCE_DIR/sample2.ref
    echo "test 5: pass"
}

test6() {
    $BZIP2 -ds < $SOURCE_DIR/sample3.bz2 > $TMPDIR/sample3.tst
    cmp $TMPDIR/sample3.tst $SOURCE_DIR/sample3.ref
    echo "test 6: pass"
}

tearDown() {
    head -n 4 $SOURCE_DIR/words3
    rm -rf /tmp/sut
}

setUp
test1
test2
test3
test4
test5
test6
tearDown
