# PurpleStar
a project for PRL Pattern Recognition and Artificial Intelligence Techniques for Cultural Heritage special issue

Weight CSVs: relationship code in column 1, weight in column 2. DO NOT USE OTHER INFO IN NETWORK COMPUTING.

Folders:
data: Biographic features and relationships fetched from CBDB.
networkcentrality: calculation of centrality based on relationships.
prediction: prediction of official ranks using biographic feature and network centrality with ORCA, Mord and Random forest.

______15 Apr 2019______
1. Done by Chilly in PyCode Add index year into SQL data fetch - lemonci.
2.  Done Confirm graph tool can run - chilly. (Except Eig but Eig can be calculated via NetworkX)
3.  Done Change readSQL. Split positive and negative relationship -chlly. (currently have vanilla (all relaitionship), Exponential version (e^(weight)), and non-negative version (with all negative relationships removed)
4. Extract non-networking feature -lemonci.
5. Official class rank/other feature? - lemonci.

______11 May 2019______

Mord support added with default parameters. Need adjust parameters to achieve better result. 


Fast checking 
http://162.105.134.121:22222/basicinformation/[personalID]/assoc   
