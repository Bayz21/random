#!/bin/bash
# Coded By Bayz21
function cektim() {
    target=$1;
    cekhttp=$(curl -s --write-out %{http_code} -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36" --output /dev/null "http://$target/lib/filemanager/dialog.php");
    if [[ $cekhttp =~ '200' ]] ; then
        cek1=$(curl -s "http://$target/lib/filemanager/dialog.php");
        if [[ $cek1 =~ 'Responsive' ]]; then
            echo "[VULN] => http://$target";
			echo "[VULN] => http://$target" >> vuln_rfm.txt;
        else
            echo "[GA VULN] http://$target";
        fi
	elif [[ $cekhttp =~ '301' ]] ; then
		cek2=$(curl -s "https://$target/lib/filemanager/dialog.php");
        if [[ $cek2 =~ 'Responsive' ]]; then
            echo "[VULN] => https://$target/lib/filemanager/dialog.php";
 			echo "[VULN] => https://$target/lib/filemanager/dialog.php" >> vuln_rfm.txt;
        else
            echo "[GA VULN] https://$target";
        fi
else
        echo "[NOT VULN]" $target;
fi

}
cat << "ZERO"

██████╗  █████╗ ██╗   ██╗███████╗██████╗  ██╗
██╔══██╗██╔══██╗╚██╗ ██╔╝╚══███╔╝╚════██╗███║
██████╔╝███████║ ╚████╔╝   ███╔╝  █████╔╝╚██║
██╔══██╗██╔══██║  ╚██╔╝   ███╔╝  ██╔═══╝  ██║
██████╔╝██║  ██║   ██║   ███████╗███████╗ ██║
╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝ ╚═╝
---------------------------------------------
------------ No Redirect Checker ------------
---------------------------------------------
 
ZERO
echo -n "Masukan Webnya : " ;
read list
echo "Starting...";
for target in $(cat $list); do
    cektim $target;
done
