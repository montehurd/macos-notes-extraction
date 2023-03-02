#!/bin/bash

# copy the NoteStore file into our folder
cp "$HOME/Library/Group Containers/group.com.apple.notes/NoteStore.sqlite" "./"
# make a folder to hold extracted notes
mkdir -p "notes" 
cd "notes"
# remove any previous extracted notes
rm *.gz
rm *.txt
# extract each note to a file in notes folder
sqlite3 ../NoteStore.sqlite "SELECT writefile('./note-' || Z_PK || '.txt.gz', ZDATA) FROM ZICNOTEDATA" 
# unzip each note - note blobs are stored in gz format
gunzip *.gz
# remove any dangling gz files
rm *.gz
# remove copy of NoteStore
cd -
rm NoteStore*