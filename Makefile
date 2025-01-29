SC=swiftc

BIN=bin
LOG=log
SRC=src
INIT=launcher

FILE=main.swift
OUT=main
INITSH=init.sh


all: compile

init:
	./$(INIT)/$(INITSH)

compile:
	$(SC) $(SRC)/$(FILE) -o $(BIN)/$(OUT)

run:
	./$(BIN)/$(OUT)

clean:
	rm -rf $(BIN)/* $(LOG)/*

