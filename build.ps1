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

pdflatex -draftmode -interaction=batchmode  -synctex=0 --aux-directory=.build $filename

biber --output-directory=.build $filename

pdflatex -draftmode -interaction=batchmode  -synctex=0 --aux-directory=.build $filename
pdflatex -draftmode -interaction=batchmode  -synctex=0 --aux-directory=.build $filename
pdflatex -interaction=batchmode  -synctex=0 --aux-directory=.build $filename
pdflatex -interaction=batchmode -synctex=0 --aux-directory=.build $filename

Write-Host $("--- Finished "+$filename+" ---")

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

Write-Host $("--- Finished "+$darkfilename+" ---")

#----------------------------------------------------------------------------------
# end timer
$endS = (Get-Date -UFormat %s)

# Calculate elapsed time
Write-Host $($endS-$startS)

# pause