# singlecopy gene alignment
python bin/singlecopy_align.py OrthoFinder/Results_May31/Single_Copy_Orthologue_Sequences/ singlecopy_aligned.faa

# removal of spurious sequences or poorly aligned regions
trimal -gt 0.8 -st 0.001 -cons 60 -in singlecopy_aligned.faa -out singlecopy_aligned.trimal.faa

# convert fasta format to phylip format
python bin/convert_fasta2phylip.py  singlecopy_aligned.trimal.faa singlecopy_aligned.trimal.phy

# build phylogenetic tree using iqtree
/home/zshanshan/bin/iqtree-1.6.7-Linux/bin/iqtree -s singlecopy_aligned.trimal.phy -m MF -nt 20
# bootstrap
/home/zshanshan/bin/iqtree-1.6.7-Linux/bin/iqtree -s singlecopy_aligned.trimal.phy -m JTT+F+I+G4 -bb 1000 -alrt 1000 -nt 20 -redo
