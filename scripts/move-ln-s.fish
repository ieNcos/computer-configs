#! /usr/bin/fish
mv ~/.config/$argv ~/Documents/configs/
ln -s ~/Documents/configs/$argv ~/.config/$argv
