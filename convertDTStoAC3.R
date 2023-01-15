## Creates directory 'ac3' in p2vid, then converts all .mkv files
## from DTS to AC3 using system commands in ffmpeg
## WINDOWS ONLY!

rm(list=ls());gc()
graphics.off()

# path to files for conversion
p2vid = "[INSERT PATH TO DIRECTORY HERE]/"
# path to ffmpeg.exe (note the backslashes, which are important)
p2ff = "C:\\ffmpeg\\bin\\ffmpeg.exe"

# Create output directory
setwd(p2vid)
if(!dir.exists("ac3")){
  dir.create("./ac3/")
}

# Convert to backslash because windows is annoying as hell
lf = list.files(p2vid, pattern = "\\.mkv")
p2vid = gsub("/","\\", p2vid, fixed = TRUE)

# loop across every file
for(f in lf){
  print(f)
  print(Sys.time())
  # create full command
  comd = paste0(p2ff, " -i \"", p2vid, f, "\" -map 0 -vcodec copy -scodec copy -acodec ac3 -b:a 640k \"",p2vid,"ac3\\", f,"\"")
  # invoke command
  system(comd)
}
