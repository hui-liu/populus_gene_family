cd /media/40TB/Liuhui/populus_gene_family
bin/prepare_pep_data.sh Data PopulusGeneFamily/
cd PopulusGeneFamily
orthofinder -f PEPs -t 28 -a 28 -M msa -T fasttree -o ./OrthoFinder &> orthofinder.log
