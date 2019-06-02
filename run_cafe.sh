# Orthogroups
cd /media/40TB/Liuhui/populus_gene_family/PopulusGeneFamily
python bin/cafe_ogcount.py OrthoFinder/Results_May31/Orthogroups/Orthogroups.GeneCount.tsv > species.ogcount.txt
python bin/cafe_size_filter.py species.ogcount.txt species.ogcount.filtered.txt species.ogcount.non.info.txt


# cafe
cd /media/40TB/Liuhui/populus_gene_family/PopulusGeneFamily/cafe
echo "
#!cafe
load -i ../species.ogcount.filtered.txt -t 4 -l log_run.txt
tree $(cat ../r8s/r8s_ultrametric.tre)
lambda -s -t $(cat ../r8s/r8s_ultrametric.struct)
report report_run
"  > run_cafe.cafe

/media/40TB/Liuhui/bin/CAFE/release/cafe run_cafe.cafe

# cafe summary
python /share/home/app/bin/cafe_tutorial/python_scripts/cafetutorial_report_analysis.py -i report_run.cafe -o summary_run -r 0 > cafe_report.tab
tree=$(cat r8s_ultrametric.tre)
node=$(cat report_run.cafe | grep "# IDs of nodes" | cut -f 2 -d ":" | sed 's/_/\\_/g')
python /share/home/app/bin/cafe_tutorial/python_scripts/cafetutorial_draw_tree2.py -i summary_run_node.txt -t "$tree" -d "$node" -o summary_run.pdf

