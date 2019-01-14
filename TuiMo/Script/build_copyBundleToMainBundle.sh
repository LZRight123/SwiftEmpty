#!/bin/sh
#获取app目录

 if [[ "${CONFIGURATION}" = "Debug" ]];then
   export ENABLE_APP_THINNING="NO"
   echo "RunScript 模式为：${CONFIGURATION},关闭 app thinning"
 else
   export ENABLE_APP_THINNING="NO"
 fi

productDir=${BUILT_PRODUCTS_DIR}

BundleVersionPath=`echo /tmp/BundleVersion.json`

function generateImageSets() {
	dir_suffix='.imageset';
	for file in `ls`;
	do
		if [[ ($file == *png*) || ($file == *jpg*) ]]; then
			if [ -f "$file" ]; then
				fName=${file%@*};
				fName=${fName%.png};
				fName=${fName%.jpg};
				imageset_dir=${fName}${dir_suffix}
				# echo "${imageset_dir}/"
				mkdir -p ${imageset_dir}
				mv $file "${imageset_dir}/"
			fi;
		fi

	done
}

function generateContentsJsonFile() {
	author='"qiym"';
	for imageset_dir in `find . -type d -iname '*.imageset'`
		do
			cd ${imageset_dir}
			paramStr1x='';
			paramStr2x='';
			paramStr3x='';
			InitialJsonStr='{"info": { "version": 1, "author": '${author}'}, "images": ['
			# declare -a imagesStrArr

			idx=0
			for img in `ls`
				do
				if [[ 1 -eq `echo ${img} | grep "@2x." | wc -l` ]]
					then
						paramStr2x='{ "idiom": "universal", "scale": "2x", "filename": "'${img}'"}'
						if [ ${idx} -eq 0 ]
							then
								InitialJsonStr=${InitialJsonStr}' '${paramStr2x}
							else
								InitialJsonStr=${InitialJsonStr}','${paramStr2x}
						fi
						((idx++))
				elif [[ 1 -eq `echo ${img} | grep "@3x." | wc -l` ]]
					then
						paramStr3x='{ "idiom": "universal", "scale": "3x", "filename": "'${img}'"}'
						if [ ${idx} -eq 0 ]
							then
								InitialJsonStr=${InitialJsonStr}' '${paramStr3x}
							else
								InitialJsonStr=${InitialJsonStr}','${paramStr3x}
						fi
						((idx++))
				elif echo ${img} | grep -v "@" | grep -v "Contents.json"
					then
						paramStr1x='{ "idiom": "universal", "scale": "1x", "filename": "'${img}'"}';
						# paramStr2x='{ "idiom": "universal", "scale": "2x", "filename": "'${img}'"}';
						# paramStr3x='{ "idiom": "universal", "scale": "3x", "filename": "'${img}'"}';

						# InitialJsonStr=${InitialJsonStr}' '${paramStr1x}','${paramStr2x}','${paramStr3x}

						if [ ${idx} -eq 0 ]
							then
								InitialJsonStr=${InitialJsonStr}' '${paramStr1x}
							else
								InitialJsonStr=${InitialJsonStr}','${paramStr1x}
						fi
						((idx++))
				fi
			done
			InitialJsonStr=${InitialJsonStr}' ]}'
			echo ${InitialJsonStr} > Contents.json
			# printf '{"info:" { "version": 1, "author": "%s" }, "images": [{ "idiom": "universal", "scale": "1x"}, %s, %s]}' "${author}" "${paramStr2x}" "${paramStr3x}" > Contents.json
			cd ..
		done
}

function delete1XImages() {
	tmpFileName="tmp_xx.tmp";
	cwd=`pwd`;
	for file in `ls`;
	do
		if [[ $file == *png* ]] && [[ $file != *@* ]]; then
			if [ -f "$file" ]; then
				mv "$file" "$tmpFileName";
				fName=${file%.*};
#				 echo "check 文件：$file, fName:$fName, safe_file=$safe_file,pattern==$pattern";
				csa=`find . -name ${fName}@2x.png`
				csb=`find . -name ${fName}@3x.png`
				if [  -n "$csa" ] || [  -n "$csb" ]; then
					echo "需要删除1倍图片:""$file";
					rm "$tmpFileName";
				else
				 	mv "$tmpFileName" "$file";
				fi
			fi;
		fi

	done
}

function zhutcEcho() {
	personalPre=""
	echo  ${personalPre}$1
}

zhutcEcho productDir


function copyBundleVersionToAPP() {
	cd ${productDir};
	if [ -f ${BundleVersionPath} ];then
	    cp ${BundleVersionPath} ${productDir}"/${CONTENTS_FOLDER_PATH}/"
	fi
}


function copyOutlineBundleToMainBundle() {

	cd ${productDir};
	IgnoreFileList="Info.plist"
	CodeSignature="_CodeSignature"
	for file1 in `ls`
	do
		#zhutcEcho ${file1}
		if echo "$file1" | grep -q "bundle"
		then
			bundleSourcePath=${productDir}"/${file1}"
			exfile=${file1}
			if [ -d ${bundleSourcePath} ]; then
				mainBundlePath=${productDir}"/${CONTENTS_FOLDER_PATH}/"
				#zhutcEcho "拷贝外部bundle到MainBundle ${bundleSourcePath} ${mainBundlePath}"
				#remove bundle 里面的info.plis 文件 和 excue 文件 。（打包审核bundle里面有这些文件很麻烦）
						ls ${bundleSourcePath} | while read item_name
						do
						file_path="${bundleSourcePath}/${item_name}";
						excue_path="${bundleSourcePath}/${exfile}";
						CodeSignature_path="${bundleSourcePath}/${CodeSignature}";

						if [ "${item_name}" == "${IgnoreFileList}" ]; then
							rm -rf ${file_path}
						fi
						if [ "${item_name}" == "${exfile}" ]; then
							rm -rf ${excue_path}
						fi
						if [ "${item_name}" == "${CodeSignature}" ]; then
							rm -rf ${CodeSignature_path}
						fi
					done

				cp -rf ${bundleSourcePath} ${mainBundlePath}
				rm -rf ${bundleSourcePath}
			fi
		fi
	done

	for file1 in `ls`
	do
		#zhutcEcho ${file1}
		if echo "$file1" | grep -q "framework"
		then
			bundleSourcePath=${productDir}"/${file1}"
			exfile=${file1}
			if [ -d ${bundleSourcePath} ]; then
				mainBundlePath=${productDir}"/${CONTENTS_FOLDER_PATH}/"
				#zhutcEcho "拷贝外部bundle到MainBundle ${bundleSourcePath} ${mainBundlePath}"
				#remove bundle 里面的info.plis 文件 和 excue 文件 。（打包审核bundle里面有这些文件很麻烦）
						ls ${bundleSourcePath} | while read item_name
						do
						file_path="${bundleSourcePath}/${item_name}";
						excue_path="${bundleSourcePath}/${exfile}";
						CodeSignature_path="${bundleSourcePath}/${CodeSignature}";

						if [ "${item_name}" == "${IgnoreFileList}" ]; then
							rm -rf ${file_path}
						fi
						if [ "${item_name}" == "${exfile}" ]; then
							rm -rf ${excue_path}
						fi
						if [ "${item_name}" == "${CodeSignature}" ]; then
							rm -rf ${CodeSignature_path}
						fi
					done

				cp -rf ${bundleSourcePath} ${mainBundlePath}
				rm -rf ${bundleSourcePath}
			fi
		fi
	done
}


#进入.app内部，拷贝bundle到主工程
function copyinlineBundleToMainBundle() {

	cd ${productDir}
		buBundleNames=( "JZTUIKitSource" )
		#忽略plist文件
		buBundleNamesForAppThinning=( "JZTUIKitSource" )

		IgnoreFileList="Info.plist"
	if [[ ${ENABLE_APP_THINNING} = "YES" ]]
		then
		SAVEIFS="$IFS"
		IFS=$'\n'
		wdir=${PWD}
		for file1 in ${buBundleNamesForAppThinning[@]}; do
			buBundleName="${CONTENTS_FOLDER_PATH}/${file1}.bundle"
			zhutcEcho "begin mv ${file1} source"
			if [ -d ${buBundleName} ];then
				cd ${buBundleName};
				delete1XImages;
				generateImageSets;
				generateContentsJsonFile;
			fi
			cd ${wdir}
		done
		IFS="$SAVEIFS"
	fi

	for file1 in ${buBundleNames[@]}; do
		buBundleName="${CONTENTS_FOLDER_PATH}/${file1}.bundle"
		zhutcEcho "begin mv ${file1} source"

		if [ -d ${buBundleName} ];then
		    wdir=${PWD}

		    cd ${buBundleName}
		    delete1XImages
		    cd ${wdir}
			ls ${buBundleName} | while read item_name #解决有空格的情况
			do
			item_dest_path="${CONTENTS_FOLDER_PATH}/${item_name}";
			file_path="${buBundleName}/${item_name}";

			if [ "${item_name}" == "${IgnoreFileList}" ]; then
				:
			elif [ -f "${file_path}" ] || [ -d "${file_path}" ]; then
				rm -rf "${item_dest_path}";
				mv -f "${file_path}" "${item_dest_path}";
			fi
		done
		fi
		zhutcEcho "end mv ${file1} source"
	done

}

function removeinlineBundle(){
	cd ${productDir}

		buBundleNames=( "JZTUIKitSource" )

		#忽略plist文件
		IgnoreFileList="Info.plist"

		for file1 in ${buBundleNames[@]}; do
			buBundleName="${CONTENTS_FOLDER_PATH}/${file1}.bundle"
			if [ -d ${buBundleName} ];then
				echo "rmove ${buBundleName}"
				rm -rf ${buBundleName}
			fi
		done

}



copyBundleVersionToAPP

copyOutlineBundleToMainBundle

copyinlineBundleToMainBundle

removeinlineBundle
