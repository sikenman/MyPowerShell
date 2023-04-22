# @Author: Siken M. Dongol
# @Purpose: this ps has been made to rename all *.jpg files 
#   in given folder to following format
#   pic-[Counter]-[MMM-yyyy] (widthxheight).jpg
#   eg. pic-10-Apr-2023 (720x1280).jpg

# Load the System.Drawing assembly
Add-Type -AssemblyName System.Drawing

# Set the folder path
$folder = "C:\Users\SikenD\Desktop\Zzz JpgPng"

# Get all the JPEG files in the folder
$files = Get-ChildItem $folder -Filter *.jpg

# Loop through each file
$counter = 10;
Write-Output ""
foreach ($file in $files) {
    # Load the image into a Bitmap object.
    $image = [System.Drawing.Image]::FromFile($file.FullName)

    # Get the dimensions of the image.
    $width = $image.Width
    $height = $image.Height

    # Get image file's created date in Month-Year format like Aug-2022
    $date = $file.CreationTime
    $monthYear = $date.ToString("MMM-yyyy")

    # Dispose the image object
    # The image file will remain locked until it is disposed
    # so can't rename unless Dispose is called
    $image.Dispose()

    # rename all the files
    $source = "$folder\$file"
    $destination = "pic-$counter-$monthYear ($width" + "x$height).jpg"
    # Write-Output "$file >> $destination"

    Rename-Item -Path $source -NewName $destination
    $counter++
}
