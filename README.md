# MyPowerShell
Some of my helpful PowerShell Scripts
---
### CopyAndRename.ps1
- Copy a file from one folder to another and renames it.
- Can be used with Windows Task Scheduler to run it daily or for any other duration.

### Rename-Jpg01.ps1
- Loading **[System.Drawing]** assembly to read image properties
- Rename all *.jpg files in the given folder to the given format
  - pic-[Counter]-[MMM-yyyy] (widthxheight).jpg
  - e.g. pic-10-Apr-2023 (720x1280).jpg
- Counter starts at 10 and increases by 1
- **Get-ChildItem** was used with the **[-Filter]** parameter to get files having only the .jpg extension
  
```PowerShell
# Load the System.Drawing assembly
Add-Type -AssemblyName System.Drawing

# Set the folder path
$folder = "C:\Users\YourName\Desktop\Zzz Jpg"

# Get all the JPEG files in the folder
$files = Get-ChildItem $folder -Filter *.jpg
....
....
# rename all the files
$source = "$folder\$file"
$destination = "pic-$counter-$monthYear ($width" + "x$height).jpg"
Write-Output "$file >> $destination"
```

### Rename-Jpg02.ps1
- Loading **[System.Drawing]** assembly to read image properties
- Rename all *.jpg or *.jpeg files in the given folder to the given format
- Made PowerShell function to generate UniqueID with default min-length of 6
  - pic-@[UniqueID]-[MMM-yyyy] (widthxheight).jpg
  - e.g. pic-@DGAYuwhY-Apr-2023 (720x1280).jpg
- **Get-ChildItem** was used with the **[-Include]** parameter to get files having .jpg or .jpeg extensions

```PowerShell
# Load the System.Drawing assembly
Add-Type -AssemblyName System.Drawing

# Set the folder path
$folder = "C:\Users\YourName\Desktop\Zzz Jpg\*"

# Get all the JPEG files in the folder
$files = Get-ChildItem $folder -Include *.jp*g
```
