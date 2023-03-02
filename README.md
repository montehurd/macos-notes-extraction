background info: 
- https://ciofecaforensics.com/2017/10/13/theres-gold-in-them-there-blobs/
- https://github.com/threeplanetssoftware/apple_cloud_notes_parser/tree/master/lib
- https://stackoverflow.com/questions/34844156/exporting-all-blobs-from-sqlite-to-a-files

to run:
- grant MacOS terminal the ability to copy the NotesStore.sqlite file:
	- "System Settings > Privacy and Security > Full Disk Access > Terminal"
	- this can be turned back off after running the script
- from the terminal clone this repo:
	- git clone https://github.com/montehurd/macos-notes-extraction.git
- from terminal change to the directory of the cloned repo:
	- cd ~/macos-notes-extraction
- from terminal run this file:
	- ./extract-notes.sh

extracted notes should appear as files in ~/macos-notes-extration/notes

limitations:
- plain text in notes is readable, but attachments such as images aren't decoded 
	- the github link above looks like it might handle decoding attachments
