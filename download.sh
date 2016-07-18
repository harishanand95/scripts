page="$(curl http://notepad.cc/qwertyasdfgh)" #-f43-
dwlink="$(echo "$page" | grep "download http://" | cut -d " " -f2-)"
ddlink="$(echo "$page" | grep "downloaddir http://" | cut -d " " -f2-)"
type="$(echo "$page" | grep "unique_char " | cut -d " " -f2-)"
echo $dwlink
echo $ddlink
echo $type
if [ -n "$dwlink" ]
then
wget --header="Accept: text/html" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0" -c -mirror -r -nH --cut-dirs=2 --no-parent -A "$type" $dwlink
else
echo "no files having ${type} in filename were found in ${dwlink}"
fi
if [ -n "$ddlink" ]
then
wget --header="Accept: text/html" --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0" -c -mirror -r -nH --cut-dirs=2 --no-parent -A "$type" $ddlink
else
echo "no files having ${type} in filename were found in ${ddlink}"
fi
