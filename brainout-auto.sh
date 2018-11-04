#!/bin/bash
version=1.1

echo Welcome, you have initialized Steam/Brain_Out-Config.
echo Version $version
echo
echo [Options]
echo [1] Steam Installation
echo [2] Steam Forced Update
echo [3] Java Runtime Replacement
echo [4] Launch Application Brain_Out With Logging
echo [5] Launch Application Brain_Out Without Logging
echo [9] System Configuration Debugging
echo
echo Please select an option by entering the associated numerical value.
read select
echo You have selected option [$select].

if [[ ¨$select¨ = ¨1¨ ]]
	then 
		sudo apt-update && apt install steam

elif [[ ¨$select¨ = ¨2¨ ]]
	then
		LD_PRELOAD='/usr/$LIB/libstdc++.so.6 /usr/$LIB/libgcc_s.so.1 /usr/$LIB/libxcb.so.1 /usr/$LIB/libgpg-error.so' /usr/bin/steam

elif [[ ¨$select¨ = ¨3¨ ]]
	then
		sudo apt-add-repository ppa:openjdk-r/ppa
		sudo apt-get update
		sudo apt-get install openjdk-8-jdk
		sudo update-alternatives --config java

elif [[ ¨$select¨ = ¨4¨ ]]
	then
		# ~/.local/share/Steam/steamapps/common/BrainOut/
		echo Please provide path to application directory.
		echo Directory structure must follow: ¨/home/user/etc¨
		read path1
		echo Applying changes...
		cd ~/Desktop
		mkdir Diagnostic
		nohup bash //usr/bin/steam 2>&1 > ~/Desktop/Diagnostic/steam-diagnostic & disown
		sleep 20
		cd $path1
		java -jar brainout-steam.jar > brainout-diagnostic
		cp -l $path1/brainout-diagnostic ~/Desktop/Diagnostic/brainout-diagnostic

elif [[ ¨$select¨ = ¨5¨ ]]
	then
		#  ~/.local/share/Steam/steamapps/common/BrainOut/
		echo Please provide path to application directory.
		echo Directory structure must follow: ¨/home/user/etc¨
		read path1
		cd $path1
		java -jar brainout-steam.jar

elif [[ ¨$select¨ = ¨9¨ ]]
	then
		uname -a

else
	echo You have not selected a valid option.
	echo Session terminated.

fi
