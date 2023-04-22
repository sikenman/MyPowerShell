# @Author: Siken M. Dongol
# @Purpose: this ps has been made to rename all *.jpg or *.jpeg files 
#   in given folder to following format
#   pic-@[UniqueID]-[MMM-yyyy] (widthxheight).jpg
#   eg. pic-@DGAYuwhY-Apr-2023 (720x1280).jpg

function Get-UniqueID {
    [CmdletBinding()]
    param (
        [Parameter()]
        [int]
        $Len = 6
    )
    $id = ""
    $characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789abcdefghijklmnopqrstuvwxyz"
    $rand = New-Object System.Random

    for ($i = 0; $i -lt $Len; $i++) {
        $id += $characters[$rand.Next(0, $characters.Length)]
    }
    return $id
}

# Load the System.Drawing assembly
Add-Type -AssemblyName System.Drawing

# Set the folder path
$folder = "C:\Users\YourName\Desktop\Zzz Jpg\*"

# Get all the JPEG files in the folder
$files = Get-ChildItem $folder -Include *.jp*g

# Loop through each file
$counter = 1;
Write-Output ""
foreach ($file in $files) {
    # Write-Output $file.FullName
    # eg. C:\Users\YourName\Desktop\Zzz Jpg\Piano-6.jpeg

    # Load the image into a Bitmap object.
    $image = [System.Drawing.Image]::FromFile($file.FullName)

    # Get the dimensions of the image.
    $width = $image.Width
    $height = $image.Height
    
    # Get image file's created date in Month-Year format like Aug-2022
    $date = $file.CreationTime
    $monthYear = $date.ToString("MMM-yyyy")
    
    # Dispose the image object
    $image.Dispose()
    
    # calling PS function
    $uniqueID = Get-UniqueID -Len 8
        
    # rename all the files
    $source = $file.FullName
    $destination = "pic-@$uniqueID-$monthYear ($width" + "x$height).jpg"
    Write-Output "$counter. $file >> $destination"
    
    Rename-Item -Path $source -NewName $destination
    
    $counter++
}
