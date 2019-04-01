# piamb
wget https://treegenesdb.org/FTP/Genomes/Pila/v1.0/
sed 's/href=/\n/g' index.html |grep "Pila"| sed 's/">/\t/;s/"//' | cut -f 1 | \
awk '{print "wget https://treegenesdb.org"$1}'| grep -v "/$" | sh

sed 's/href=/\n/g' index.html |grep "Pila"| sed 's/">/\t/;s/"//' | cut -f 1 | grep "/$" | grep -E "annotation|genome" | \
awk '{print "wget -e robots=off -r -p -np -k https://treegenesdb.org"$1,"--no-check-certificate --wait 1"}' | sh

