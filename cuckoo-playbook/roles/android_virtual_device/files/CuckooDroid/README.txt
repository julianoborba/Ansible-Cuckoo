## Instructions

Just run create_guest_avd.sh with "cuckoo" user and AVD fully booted:

    sudo su - cuckoo
    cd /home/cuckoo/android-sdk-linux/CuckooDroid/utils/android_emulator_creator
    
    export PATH=$PATH:/home/cuckoo/android-sdk-linux/platform-tools:/home/cuckoo/android-sdk-linux/tools:/home/cuckoo/android-sdk-linux/build-tools/27.0.3
    source /home/cuckoo/.bashrc
    
    emulator -avd cuckoo-bird -gpu host -no-audio -no-window
    
    (wait about half minute)
    
    sh create_guest_avd.sh
    
    adb -s emulator-5554 emu kill

## Troubleshooting

* Network interface not defined, network capture aborted
    - You should disable the sniffer auxiliary module for now

* The memory dump functionality is not available for the current machine manager
    - Successfully run the emulator once before starting Cuckoo

* Failure in AnalysisManager.run
    - Maybe re-run:
        ./utils/community.py -waf

* Everything else
    - http://cuckoo-droid.readthedocs.io/en/latest/installation/guest_android_avd/