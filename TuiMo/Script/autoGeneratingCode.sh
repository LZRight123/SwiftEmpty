#!/bin/sh

echo "**********************autoGeneratingCode开始**********************"
cd ../
echo `pwd`
Sourcery-0.15.0/bin/sourcery \--sources ./TuiMo \
--templates ./TuiMo/Global/Tools/Templates/AutoEquatable.stencil \
--templates ./TuiMo/Global/Tools/Templates/AutoModelToDictionary.stencil \
--templates ./TuiMo/Global/Tools/Templates/AutoDataToModel.stencil \
--output ./TuiMo/Global/Tools/Autogenerated
echo "**********************autoGeneratingCode结束**********************"
