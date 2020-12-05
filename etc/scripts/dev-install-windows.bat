cd %~dp0
cd ..
cd ..

:: This will be needed for all users on Windows to have all local python dependencies available
mkdir "c:\Users\%USERNAME%\AppData\Roaming\Blender Foundation\Blender\2.83\scripts\vendor\skybrush\"
mklink /D "c:\Users\%USERNAME%\AppData\Roaming\Blender Foundation\Blender\2.83\scripts\vendor\skybrush\sbstudio" "d:\%USERNAME%\git\skybrush-plugin-blender\src\modules\sbstudio"

:: These are the external dependencies that are copied to the vendor folder
call poetry export -f requirements.txt -o "requirements.txt" --without-hashes
call pip install -r "requirements.txt" -t "c:\\Users\\%USERNAME%\\AppData\\Roaming\\Blender Foundation\\Blender\\2.83\\scripts\\vendor\\skybrush\\"

:: This will be needed for all users on Windows to have all Skybrush add-ons available
mkdir "c:\Users\%USERNAME%\AppData\Roaming\Blender Foundation\Blender\2.83\scripts\addons\"
copy "src\addons\io_export_skybrush.py" "c:\Users\%USERNAME%\AppData\Roaming\Blender Foundation\Blender\2.83\scripts\addons\"
copy "src\addons\io_import_skybrush.py" "c:\Users\%USERNAME%\AppData\Roaming\Blender Foundation\Blender\2.83\scripts\addons\"

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: This part is needed only for developers with local skybrush and pyledctrl
mklink /D "c:\Users\%USERNAME%\AppData\Roaming\Blender Foundation\Blender\2.83\scripts\vendor\skybrush\skybrush" "d:\%USERNAME%\git\skybrush\skybrush"
mklink /D "c:\Users\%USERNAME%\AppData\Roaming\Blender Foundation\Blender\2.83\scripts\vendor\skybrush\pyledctrl" "d:\%USERNAME%\git\pyledctrl\src\pyledctrl"

