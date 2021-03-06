# use gene name because sometimes the protein names are different from the cds name
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
python gff2idmap.py Vvinifera_145_Genoscope.12X.gene.gff3.gz --gene_field gene_id --transcript_field transcript_name \
--protein_field transcript_name --pse_field gene_id|uniq > id_mapping.txt
python ../../bin/LongestPep.py id_mapping.txt Vvinifera_145_Genoscope.12X.cds.fa.gz 3 cds.fa
python ../../bin/LongestPep.py id_mapping.txt Vvinifera_145_Genoscope.12X.protein.fa.gz 4 pep.faa

# (9) zemay_AGPv3.31
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/zemay_AGPv3.31
python gff2idmap.py Zea_mays.AGPv3.31.gff3 --gene_field gene_id --transcript_field transcript_name \
--protein_field cds_id --pse_field gene_name|uniq > id_mapping.txt
python LongestPep.py id_mapping.txt Zea_mays.AGPv3.31.cds.all.fa 3 cds.fa
python LongestPep.py id_mapping.txt Zea_mays.AGPv3.31.pep.all.fa 4 pep.faa

# (10) potra_v1.1
# why do the protein sequences contain tRNA
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/potra_v1.1
python gff2idmap.py gff3/Potra01-gene.gff3.gz --gene_field gene_id --transcript_field transcript_id \
--protein_field transcript_id --pse_field gene_name|uniq > id_mapping.txt
python ../../bin/LongestPep.py id_mapping.txt fasta/Potra01-CDS.fa.gz 3 cds.fa
python ../../bin/LongestPep.py id_mapping.txt fasta/Potra01-protein.fa.gz 4 pep.faa

# (11) potrs_v1.1
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/potrs_v1.1
python ../potra_v1.1/gff2idmap.py GFF3/Potrs01b-gene.gff3.gz --gene_field gene_id --transcript_field transcript_id \
--protein_field transcript_id --pse_field gene_name|uniq > id_mapping.txt
python ../../bin/LongestPep.py id_mapping.txt FASTA/Potrs01b-CDS.fa.gz 3 cds.fa
python ../../bin/LongestPep.py id_mapping.txt FASTA/Potrs01b-protein.fa.gz 4 pep.faa

# (12) potrx_v0.1
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/potrx_v0.1
python ../potra_v1.1/gff2idmap.py GFF3/Potrx01-genome.gff3.gz --gene_field gene_id --transcript_field transcript_id \
--protein_field transcript_id --pse_field gene_name|uniq > id_mapping.txt
python ../../bin/LongestPep.py id_mapping.txt FASTA/Potrx01_mRNA.fa.gz 3 cds.fa
python ../../bin/LongestPep.py id_mapping.txt FASTA/Potrx01_protein.fa.gz 4 pep.faa

# (13) traes_tgac_v1
cd /mnt/crick/data/yellow_horn/temp/populus_gene_family/Data/traes_tgac_v1
python gff2idmap.py Triticum_aestivum.TGACv1.36.gff3 --gene_field gene_id --transcript_field transcript_name \
--protein_field transcript_name --pse_field gene_name|uniq > id_mapping.txt
python ../zemay_AGPv3.31/LongestPep.py id_mapping.txt Triticum_aestivum.TGACv1.cds.all.fa 3 cds.fa
python ../zemay_AGPv3.31/LongestPep.py id_mapping.txt Triticum_aestivum.TGACv1.pep.all.fa 4 pep.faa

# (14) artha_araport11
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/artha_araport11
python gff2idmap.py Athaliana_447_Araport11.gene.gff3.gz --gene_field gene_id --transcript_field transcript_id \
--protein_field cds_id --pse_field gene_id|uniq > id_mapping.txt
sed -i '/AT1G64633.1/d' id_mapping.txt
python ../../bin/LongestPep.py id_mapping.txt Athaliana_447_Araport11.cds.fa.gz 3 cds.fa
python ../../bin/LongestPep.py id_mapping.txt Athaliana_447_Araport11.protein.fa.gz 3 pep.faa

# (15) pitae_v2.01
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/pitae_v2.01
zcat annotation/Pita.2_01.gff.gz |grep "gene" |sed 's/ID=//;s/;Name=/\t/' | \
awk '{if(NF==10){print $0}else{print $0"\t"$9}}'| \
awk -v OFS="\t" '{print $9,$9,$10,$10,$1,$4,$5,$7,"None"}' | \
sed '1i#pse_id\tgene_id\ttranscript_id\tprotein_id\tchr\tstart\tend\tstrand\tdescription' > id_mapping.txt

python ../../bin/LongestPep.py id_mapping.txt annotation/Pita.2_01.cds.fa.gz 3 cds.fa
python ../../bin/LongestPep.py id_mapping.txt annotation/Pita.2_01.peptides.fa.gz 4 pep.faa


# (16) pigla_WS77111

# (17) chrei_v5.5
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/chrei_v5.5
python ../../bin/gff2idmap.py Creinhardtii_281_v5.5.gene.gff3.gz --gene_field gene_id --transcript_field transcript_id \
--protein_field transcript_id --pse_field gene_name|uniq > id_mapping.txt
python ../../bin/LongestPep.py id_mapping.txt Creinhardtii_281_v5.5.cds.fa.gz 3 cds.fa
python ../../bin/LongestPep.py id_mapping.txt Creinhardtii_281_v5.5.protein.fa.gz 4 pep.faa

# (18) micom_v3.0
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/micom_v3.0
python gff2idmap.py MspRCC299_229_v3.0.gene.gff3 --gene_field gene_name --transcript_field transcript_name \
--protein_field transcript_name --pse_field gene_name|uniq > id_mapping.txt
python LongestPep.py id_mapping.txt MspRCC299_229_v3.0.cds.fa 3 cds.fa
python LongestPep.py id_mapping.txt MspRCC299_229_v3.0.protein.fa 4 pep.faa


# (19) psmen_v1.0
cd /pfs/nobackup/home/c/chanaka/Populus/populus_gene_family/Data/psmen_v1.0
awk '$3=="gene"' annotation/annotation2.0/Psme.1_0.gtf | \
awk -v OFS="\t" '{print $9,$9,$9,$9,$1,$4,$5,$7,"None"}' | \
sed '1i#pse_id\tgene_id\ttranscript_id\tprotein_id\tchr\tstart\tend\tstrand\tdescription' > id_mapping.txt

cp annotation/annotation2.0/Psme.1_0.cds.fa cds.fa
cp annotation/annotation2.0/Psme.1_0.peptides.fa > pep.faa

# (20) piamb
cat pila.HQgenes.complete.gff3.gz pila.HQgenes.partial.gff3.gz pila.LQgenes.gff3.gz > pila.genes.gff3.gz
cat pila.HQgenes.complete.transcripts.fasta.gz pila.HQgenes.partial.transcripts.fasta.gz pila.LQgenes.transcripts.fasta.gz > pila.transcripts.fasta.gz
cat pila.HQgenes.complete.proteins.fasta.gz pila.HQgenes.partial.proteins.fasta.gz pila.LQgenes.proteins.fasta.gz > pila.proteins.fasta.gz

python ../../bin/gff2idmap.py pila.genes.gff3.gz --gene_field gene_id --transcript_field transcript_id \
--protein_field transcript_id --pse_field gene_name|uniq > id_mapping.txt
python ../../bin/LongestPep.py id_mapping.txt pila.transcripts.fasta.gz 3 cds.fa
python ../../bin/LongestPep.py id_mapping.txt pila.proteins.fasta.gz 4 pep.faa
