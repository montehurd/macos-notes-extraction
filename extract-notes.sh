#!/bin/bash

# copy the notes sqlite file into our folder
cp "$HOME/Library/Group Containers/group.com.apple.notes/NoteStore.sqlite" "./"
# make a folder to hold extracted notes
mkdir -p "notes" 
# extract each note to a file in notes folder
sqlite3 NoteStore.sqlite "SELECT writefile('./notes/note-' || Z_PK || '.txt.gz', ZDATA) FROM ZICNOTEDATA" 
# unzip each note - note blobs are stored in gz format
cd "notes"
gunzip *.gz
# remove copy of NotesFile
cd -
rm NoteStore*