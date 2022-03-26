#!/bin/bash

echo "For windows -> http://www.nirsoft.net/utils/mac_address_lookup_find.html"
echo " "
# mkdir MACview-Windows && wget http://www.nirsoft.net/utils/macaddressview.zip && mv macaddressview.zip MACview-Windows/macaddressview.zip

echo "Download MAC database"
echo " "

locate oui.txt
echo " "

wget http://standards-oui.ieee.org/oui/oui.txt

sleep 3

echo " "
echo "Create -> oui.sh"
# -----------------------------------
echo '#!/bin/bash' > oui-script.txt
echo '   ' >> oui-script.txt
echo 'MAC="$(echo $1 | sed "s/ //g" | sed "s/-//g" | sed "s/://g" | cut -c1-6)";' | sed "s/\"/\'/2;s/\"/\'/2;s/\"/\'/2;s/\"/\'/2;s/\"/\'/2;s/\"/\'/2" >> oui-script.txt
echo '  ' >> oui-script.txt
echo 'result="$(grep -i -A 4 ^$MAC ./oui.txt)";' >> oui-script.txt
echo '  ' >> oui-script.txt
echo 'if [ "$result" ]; then' >> oui-script.txt
echo '    echo "For the MAC $1 the following information is found:"' >> oui-script.txt
echo '    echo "$result"' >> oui-script.txt
echo 'else' >> oui-script.txt
echo '    echo "MAC $1 is not found in the database."' >> oui-script.txt
echo 'fi' >> oui-script.txt
# -----------------------------------
sleep 3

mv oui-script.txt oui.sh

sleep 2

echo " "
echo "use -> bash oui.sh MAC"
echo " "
echo "example -> bash oui.sh 50:46:5D:6E:8C:20"
echo " "

bash oui.sh 50:46:5D:6E:8C:20
