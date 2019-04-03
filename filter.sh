# (1) amtri_v1.0
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/amtri_v1.0
python ../../bin/gff2idmap.py Atrichopoda_291_v1.0.gene.gff3.gz --gene_field gene_id --transcript_field transcript_id \
--protein_field transcript_id --pse_field gene_name|uniq > id_mapping.txt
python ../../bin/LongestPep.py id_mapping.txt Atrichopoda_291_v1.0.cds.fa.gz 3 cds.fa
python ../../bin/LongestPep.py id_mapping.txt Atrichopoda_291_v1.0.protein.fa.gz 4 pep.faa

# (2) eucgr_v2.0
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/eucgr_v2.0
python ../../bin/gff2idmap.py Egrandis_297_v2.0.gene.gff3.gz --gff_type jgi --gene_field gene_id --transcript_field transcript_id \
--protein_field protein_id --pse_field gene_name|uniq > id_mapping.txt
python ../../bin/LongestPep.py id_mapping.txt Egrandis_297_v2.0.cds.fa.gz 3 cds.fa
python ../../bin/LongestPep.py id_mapping.txt Egrandis_297_v2.0.protein.fa.gz 4 pep.faa

# (3) orsaj_v7.0
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/orsaj_v7.0
python ../../bin/gff2idmap.py Osativa_323_v7.0.gene.gff3.gz --gene_field gene_id --transcript_field transcript_name \
--protein_field transcript_name --pse_field gene_name|uniq > id_mapping.txt
python ../../bin/LongestPep.py id_mapping.txt Osativa_323_v7.0.cds.fa.gz 3 cds.fa
python ../../bin/LongestPep.py id_mapping.txt Osativa_323_v7.0.protein.fa.gz 4 pep.faa

# (4) phpat_v3.3
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/phpat_v3.3
python ../../bin/gff2idmap.py Ppatens_318_v3.3.gene.gff3.gz --gff_type jgi --gene_field gene_id --transcript_field transcript_name \
--protein_field protein_id --pse_field gene_name|uniq > id_mapping.txt
python ../../bin/LongestPep.py id_mapping.txt Ppatens_318_v3.3.cds.fa.gz 3 cds.fa
python ../../bin/LongestPep.py id_mapping.txt Ppatens_318_v3.3.protein.fa.gz 4 pep.faa

# (5) piabi_congenie_v1
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/piabi_congenie_v1
cat GFF3/Gene_Prediction_Transcript_assemblies/Pabies1.0-HC.gff3.gz \
GFF3/Gene_Prediction_Transcript_assemblies/Pabies1.0-MC.gff3.gz \
GFF3/Gene_Prediction_Transcript_assemblies/Pabies1.0-LC.gff3.gz > Pabies_gene.gff3.gz

zcat Pabies_gene.gff3.gz| awk '$3=="gene"' | awk -F ";" '{print $1}' | sed 's/ID=//' | \
awk -v OFS="\t" '{print $9,$9,$9,$9,$1,$4,$5,$7,"None"}' | \
sed '1i#pse_id\tgene_id\ttranscript_id\tprotein_id\tchr\tstart\tend\tstrand\tdescription' > id_mapping.txt

zcat FASTA/GenePrediction/Pabies1.0-all-cds.fna.gz | awk '{print $1}' | \
awk '/^>/ {printf("\n%s\t",$0);next;} {printf("%s",$0);} END {printf("\n");}' | \
grep -v '^$' | tr "\t" "\n" > cds.fa
zcat FASTA/GenePrediction/Pabies1.0-all-pep.faa.gz | awk '{print $1}' | \
awk '/^>/ {printf("\n%s\t",$0);next;} {printf("%s",$0);} END {printf("\n");}' | \
grep -v '^$' | tr "\t" "\n" > pep.faa

# (6) potri_v3.1
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/potri_v3.1
python ../../bin/gff2idmap.py Ptrichocarpa_444_v3.1.gene.gff3.gz --gff_type jgi --gene_field gene_id --transcript_field transcript_name \
--protein_field protein_id --pse_field gene_name|uniq > id_mapping.txt
python ../../bin/LongestPep.py id_mapping.txt Ptrichocarpa_444_v3.1.cds.fa.gz 3 cds.fa
python ../../bin/LongestPep.py id_mapping.txt Ptrichocarpa_444_v3.1.protein.fa.gz 4 pep.faa

# (7) semoe_v1.0
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/semoe_v1.0
python ../../bin/gff2idmap.py Smoellendorffii_91_v1.0.gene.gff3.gz --gene_field gene_id --transcript_field transcript_name \
--protein_field transcript_name --pse_field gene_name|uniq > id_mapping.txt
python ../../bin/LongestPep.py id_mapping.txt Smoellendorffii_91_v1.0.cds.fa.gz 3 cds.fa
python ../../bin/LongestPep.py id_mapping.txt Smoellendorffii_91_v1.0.protein.fa.gz 4 pep.faa

# (8) vivin_genoscope12x
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/vivin_genoscope12x
python ../../bin/gff2idmap.py Vvinifera_145_Genoscope.12X.gene.gff3.gz --pse_field transcript_name --gene_field transcript_name --transcript_field transcript_name \
--protein_field transcript_name --pse_field transcript_name|uniq > id_mapping.txt
python ../../bin/LongestPep.py id_mapping.txt Vvinifera_145_Genoscope.12X.cds.fa.gz 3 cds.fa
python ../../bin/LongestPep.py id_mapping.txt Vvinifera_145_Genoscope.12X.protein.fa.gz 4 pep.faa

# (9) zemay_AGPv3.31
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/zemay_AGPv3.31

# artha_araport11
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/artha_araport11
python gff2idmap.py Athaliana_447_Araport11.gene.gff3.gz --gene_field gene_id --transcript_field transcript_id \
--protein_field cds_id --pse_field gene_name|uniq > id_mapping.txt
sed -i '/AT1G64633.1/d' id_mapping.txt
python ../../bin/LongestPep.py id_mapping.txt Athaliana_447_Araport11.cds.fa.gz 3 cds.fa
python ../../bin/LongestPep.py id_mapping.txt Athaliana_447_Araport11.protein.fa.gz 3 pep.faa


