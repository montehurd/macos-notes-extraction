#!/bin/bash

# background info: 
#   https://ciofecaforensics.com/2017/10/13/theres-gold-in-them-there-blobs/
#   https://github.com/threeplanetssoftware/apple_cloud_notes_parser/tree/master/lib
#   https://stackoverflow.com/questions/34844156/exporting-all-blobs-from-sqlite-to-a-files

# to run:
# - place this file in a folder
# - grant MacOS terminal the ability to copy the NotesStore.sqlite file: "System Settings > Privacy and Security > Full Disk Access > Terminal"
#   ( this can be turned back off after running the script )
# - from terminal cd to the folder containing this file
# - run ./extract-notes.sh
# notes should appear as files in a new "notes" folder in the directory

# limitations:
# - plain text in notes is readable, but attachements such as images aren't decoded
#   the github link above looks like it handles decoding attachments

# copy the notes sqlite file into our folder
cp "$HOME/Library/Group Containers/group.com.apple.notes/NoteStore.sqlite" "./"
# make a folder to hold extracted notes
mkdir -p "notes" 
# extract each note to a file in notes folder
sqlite3 NoteStore.sqlite "SELECT writefile('./notes/note-' || Z_PK || '.txt.gz', ZDATA) FROM ZICNOTEDATA" 
# unzip each note - note blobs are stored in gz format
