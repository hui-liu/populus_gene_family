# r8s
# N0: time tree
cd /media/40TB/Liuhui/populus_gene_family/PopulusGeneFamily/r8s
echo "#NEXUS
begin trees;
	tree tree_1 = [&R] (((phpat:0.35188952250000005,semoe:0.38449518669999994):0.07673862509999996,(((((((potrx:0.0011225519999999989,potra:0.012817961299999903):0.0042971281999999444,potrs:0.002631471800000007):0.0023738679000000484,potri:0.006368908800000073):0.08586404180000007,artha:0.16970777520000002)N3:0.07436933639999976,(orsaj:0.06387849850000005,zemay:0.059002713799999995):0.16506086229999983)N2:0.043199093500000174,amtri:0.16239453850000007):0.10204859489999984,(psmen:0.030179561500000007,(piabi:0.04143048439999997,(pitae:0.0712180817000001,piamb:0.04819835649999993):0.06355427820000004):0.033823446300000004):0.18012111860000002)N1:0.15025914219999992):0.19093422235,(micom:0.9392333393000001,chrei:0.6755951102):0.19093422235000004)N0;
	end;
begin r8s;
blformat lengths=persite nsites=1919 ulrametric=no;
fixage taxon=N0 age=1160;
fixage taxon=N1 age=325.1;
constrain taxon=N2 minage=130 maxage=135;
constrain taxon=N3 minage=121 maxage=126;
set smoothing=10000;
divtime method=PL algorithm=TN ;
showage;
describe plot=cladogram;
describe plot=chrono_description;
end;" > r8s_ctl_file.txt
r8s -b -f r8s_ctl_file.txt > r8s_tmp.txt
tail -n 1 r8s_tmp.txt | awk '{print $NF}' > r8s_ultrametric.txt
python ~/src/tree2stuct.py r8s_ultrametric.txt > r8s_ultrametric.struct 2> r8s_ultrametric.tre
