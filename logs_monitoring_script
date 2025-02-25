####A script was created to monitor log files being created or updated, then transferred to the desired GCS bucket. In this case, each environment has it’s own bucket, script running on each environment’s virtual machine running in GCP. 
###Prerequisites 
###Installing inotify-tools - The script utilizes inotify-tools installed on each VM which monitors changes in directories. 
###Installing it using: 
###sudo apt-get install inotify-tools
###Making sure Google Cloud SDK is installed on the VMs
###Authenticating the VMs by ensuring the VM has a service account attached to it with scope “Allow full access to all Cloud APIs"######

#!/bin/bash

#Directory to watch
WATCH_DIR="$DIR_PATH"

#GCS bucket path
GCS_BUCKET="$BUCKET URL"

#Monitor for new files,file modifications and upload to GCS
inotifywait -m -e create -e modify "$WATCH_DIR" --format '%w%f' | while read FILE

do
        echo " Detected change in file: $FILE"
        gsutil cp "$FILE" "$GCS_BUCKET"
        echo "Uploaded $FILE to $GCS_BUCKET"

done
