# @Author: Siken M. Dongol
# @Purpose: this ps has been made to copy daily bing wallpaper
#   from Bing folder to folder of my choice and rename the file with the current date
#   this ps will be called via Windows task Scheduler daily to copy bing wp
# Note: Bing Wallpaper changes daily

$date = Get-Date -Format "MM-dd-yyyy"
$source = "C:\Users\YourName\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper"
$destination = "C:\Users\TargetFolder\Bing Daily\bing-wp-$date.jpg"
Copy-Item $source $destination
