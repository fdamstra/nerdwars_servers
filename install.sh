#! /bin/bash
cd apps
for a in *
do
	echo \*\*\* Installing ${a} >> ~/app_install.log
	cp ${a}/${a}_start* ~/ 2>&1 >> ~/app_install.log
	bash ${a}/${a}_install.sh 2>&1 >> ~/app_install.log
	echo \*\*\* Install of ${a} complete. >> ~/app_install.log
done

