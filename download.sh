# piamb
wget https://treegenesdb.org/FTP/Genomes/Pila/v1.0/

sed 's/href=/\n/g' index.html |grep "Pila"| sed 's/">/\t/;s/"//' | cut -f 1 | \
awk '{print "wget https://treegenesdb.org"$1}'| grep -v "/$" | sh

sed 's/href=/\n/g' index.html |grep "Pila"| sed 's/">/\t/;s/"//' | cut -f 1 | grep "/$" | grep -E "annotation|genome" | \
awk '{print "wget -e robots=off -r -p -np -k https://treegenesdb.org"$1,"--no-check-certificate --wait 1"}' | sh

mv treegenesdb.org/FTP/Genomes/Pila/v1.0/* .
rm -r treegenesdb.org/
rm index.html

# psmen
wget https://treegenesdb.org/FTP/Genomes/Psme/v1.0/

sed 's/href=/\n/g' index.html |grep "Psme"| sed 's/">/\t/;s/"//' | cut -f 1 | \
awk '{print "wget -e robots=off -r -p -np -k https://treegenesdb.org"$1,"--no-check-certificate --wait 1"}'| grep -v "index" | sh

mv treegenesdb.org/FTP/Genomes/Psme/v1.0/* .
rm -r treegenesdb.org/
rm index.html

# pitae
wget https://treegenesdb.org/FTP/Genomes/Pita/v2.01/
sed 's/href=/\n/g' index.html |grep "Pita"| sed 's/">/\t/;s/"//' | cut -f 1 | \
awk '{print "wget -e robots=off -r -p -np -k https://treegenesdb.org"$1,"--no-check-certificate --wait 1"}'| grep -v "index" | sh

mv treegenesdb.org/FTP/Genomes/Pita/v2.01/* .
rm -r treegenesdb.org/
rm index.html

#piabi
wget ftp://plantgenie.org/Data/ConGenIE/Picea_abies/v1.0/
sed 's/href=/\n/g' index.html |grep -E "FASTA|GFF3|BED|Annotation|gtf"| sed 's/">/\t/;s/"//' | cut -f 1 | \
awk '{print "wget -e robots=off -r -p -np -k", $1, "--no-check-certificate --wait 1"}'| sh

mv plantgenie.org/Data/ConGenIE/Picea_abies/v1.0/* .
rm -r plantgenie.org/
rm index.html

# potra
wget ftp://plantgenie.org/Data/PopGenIE/Populus_tremula/v1.1/
sed 's/href=/\n/g' index.html |grep -E "fasta|gff3|annotation" | sed 's/">/\t/;s/"//' | cut -f 1 | \
awk '{print "wget -e robots=off -r -p -np -k", $1, "--no-check-certificate --wait 1"}'| sh

mv plantgenie.org/Data/PopGenIE/Populus_tremula/v1.1/* .
rm -r plantgenie.org/
rm index.html

# potrs
wget ftp://plantgenie.org/Data/PopGenIE/Populus_tremuloides/v1.1/
sed 's/href=/\n/g' index.html |grep -E "FASTA|GFF3|Annotation"| sed 's/">/\t/;s/"//' | cut -f 1 | \
awk '{print "wget -e robots=off -r -p -np -k", $1, "--no-check-certificate --wait 1"}'| sh

mv plantgenie.org/Data/PopGenIE/Populus_tremuloides/v1.1/* .
rm -r plantgenie.org/
rm index.html

# potrx
wget ftp://plantgenie.org/Data/PopGenIE/Populus_tremula_X_Populus_tremuloides/v0.1
sed 's/href=/\n/g' index.html |grep -E "FASTA|GFF3|BED|Annotation"| sed 's/">/\t/;s/"//' | cut -f 1 | \
awk '{print "wget -e robots=off -r -p -np -k", $1, "--no-check-certificate --wait 1"}'| sh

mv plantgenie.org/Data/PopGenIE/Populus_tremula_X_Populus_tremuloides/v0.1/* .
rm -r plantgenie.org/
rm index.html

# pigla
wget ftp://plantgenie.org/Data/ConGenIE/Picea_glauca/WS77111/v1.0/
sed 's/href=/\n/g' index.html |grep -E "FASTA|GFF3|BED|Annotation"| sed 's/">/\t/;s/"//' | cut -f 1 | \
awk '{print "wget -e robots=off -r -p -np -k", $1, "--no-check-certificate --wait 1"}'| sh

mv plantgenie.org/Data/ConGenIE/Picea_glauca/WS77111/v1.0/* .
rm -r plantgenie.org/
rm index.html








