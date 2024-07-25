$filename = 'slides'

$startS = (Get-Date -UFormat %s)

#----------------------------------------------------------------------------------
# Light Version
$FolderName = ".build"
if (Test-Path $FolderName) {
    Remove-Item $FolderName -Recurse -Force
}
else
{

}

pdflatex -draftmode -interaction=batchmode -synctex=0 --aux-directory=.build $filename

biber --output-directory=.build $filename

pdflatex -draftmode -interaction=batchmode -synctex=0 --aux-directory=.build $filename
pdflatex -draftmode -interaction=batchmode -synctex=0 --aux-directory=.build $filename
pdflatex -interaction=batchmode -synctex=0 --aux-directory=.build $filename
pdflatex -interaction=batchmode -synctex=0 --aux-directory=.build $filename

$filenamepdf = $filename+".pdf"

# requires pdfsizeopt (https://github.com/pts/pdfsizeopt)
./../../../.config-specific/pdfsizeopt/pdfsizeopt --do-optimize-images=no $filenamepdf $filenamepdf

Write-Host $(" ")
Write-Host $("--- Finished "+$filename+" ---")
Write-Host $(" ")

#----------------------------------------------------------------------------------
# Dark Version
$darkfilename = $filename+" - Dark"

$FolderName = ".build"
if (Test-Path $FolderName) {
    Remove-Item $FolderName -Recurse -Force
}
else
{

}

pdflatex -draftmode -interaction=batchmode -synctex=0 --aux-directory=.build $darkfilename

biber --output-directory=.build $darkfilename

pdflatex -draftmode -interaction=batchmode -synctex=0 --aux-directory=.build $darkfilename
pdflatex -draftmode -interaction=batchmode -synctex=0 --aux-directory=.build $darkfilename
pdflatex -interaction=batchmode -synctex=0 --aux-directory=.build $darkfilename
pdflatex -interaction=batchmode -synctex=0 --aux-directory=.build $darkfilename

$darkfilenamepdf = $darkfilename+".pdf"

# requires pdfsizeopt (https://github.com/pts/pdfsizeopt)
./../../../.config-specific/pdfsizeopt/pdfsizeopt --do-optimize-images=no $darkfilenamepdf $darkfilenamepdf

Write-Host $(" ")
Write-Host $("--- Finished "+$darkfilename+" ---")
Write-Host $(" ")

#----------------------------------------------------------------------------------
# Animated Version
$animatedfilename = $filename+" - Animated"

$FolderName = ".build"
if (Test-Path $FolderName) {
    Remove-Item $FolderName -Recurse -Force
}
else
{

}

pdflatex -draftmode -interaction=batchmode -synctex=0 --aux-directory=.build $animatedfilename

biber --output-directory=.build $animatedfilename

pdflatex -draftmode -interaction=batchmode -synctex=0 --aux-directory=.build $animatedfilename
pdflatex -draftmode -interaction=batchmode -synctex=0 --aux-directory=.build $animatedfilename
pdflatex -interaction=batchmode -synctex=0 --aux-directory=.build $animatedfilename
pdflatex -interaction=batchmode -synctex=0 --aux-directory=.build $animatedfilename

$animatedfilenamepdf = $animatedfilename+".pdf"

# requires pdfsizeopt (https://github.com/pts/pdfsizeopt)
./../../../.config-specific/pdfsizeopt/pdfsizeopt --do-optimize-images=no $animatedfilenamepdf $animatedfilenamepdf

Write-Host $(" ")
Write-Host $("--- Finished "+$animatedfilename+" ---")
Write-Host $(" ")

#----------------------------------------------------------------------------------
# end timer
$endS = (Get-Date -UFormat %s)

# Calculate elapsed time
Write-Host $($endS-$startS)

# pause