#!/bin/bash

iverilog -otest.vvp -I src/ src/*.v test/test.v
vvp test.vvp -fst
gtkwave test.fst