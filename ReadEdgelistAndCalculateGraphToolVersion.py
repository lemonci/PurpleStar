
# coding: utf-8

# In[ ]:


import pandas as pd
from graph_tool.all import *

# read data from a hdf5 file
df = pd.read_hdf('assodata.h5', key='asso', mode='r')
# first [0] and second [1] columns are nodes, the third [2] column is weight

# get first two columns to build network
testsamples = df.iloc[:,0:2].values

# declare the graph
g = Graph(directed=False)

# using the pair of nodes to build a network (without weight yet)
# Since we used hash, the returning object is a map storing the name of each vertex
namemap = g.add_edge_list(testsamples, hashed=True, string_vals=False)

# incorporate the map into the graph as a property
g.vertex_properties['name'] = namemap

# save the unweighted graph with a map of name
g.save("networkwithname.xml.gz")


# declare a property map of edges to store weight
wtmp = g.new_edge_property("double")

# assign the third [2] column to the weight map
wtmp.a = df.iloc[:,2]
# incorporate the weight map into the graph as a property
g.edge_properties['weight'] = wtmp

# save weight along with the network
g.save("networkwithweight.xml.gz")


# In[ ]:


#Eigenvector
g = Graph(directed=False)

# load the network
g.load("networkwithweighteig.xml.gz")

# declare property map of vertex to store eigenvector of vertex
eig_vert = g.new_vertex_property("double")

graph_tool.centrality.eigenvector(g, weight=g.edge_properties['weight'], vprop=eig_vert, epsilon=1e-06, max_iter=None)

g.vertex_properties['VertesEigenvector'] = eig_vert

# save the final graph
g.save("networkwitheig.xml.gz")


# In[ ]:


#Closeness
from graph_tool.all import *

g = Graph(directed=False)

# load the network
g.load("networkwithweightclo.xml.gz")

# declare property map of vertex to store closeness of vertex
clo_vert = g.new_vertex_property("double")

graph_tool.centrality.closeness(g, weight=g.edge_properties['weight'], source=None, vprop=clo_vert, norm=True, harmonic=False)

g.vertex_properties['VertexCloseness'] = clo_vert

# save the final graph
g.save("networkwithclo.xml.gz")


# In[ ]:


#Betweeness
from graph_tool.all import *

g = Graph(directed=False)

# load the network
g.load("networkwithweightbet.xml.gz")

# declare property map of vertex to store betweenness of vertex
bet_vert = g.new_vertex_property("double")
# declare property map of edge to store betweenness of edge
bet_edge = g.new_edge_property("double")

# Calculate the betweenness; Using wtmp as weight, 
# return the betweenness of vertex to bet_vert, 
# return the betweenness of edge to bet_edge,
graph_tool.centrality.betweenness(g, pivots=None, vprop=bet_vert, eprop=bet_edge, weight=g.edge_properties['weight'], norm=False)

# incorprate the betweeness map (both edge and vertex) into the graph
g.edge_properties['EdgeBetweenness'] = bet_edge
g.vertex_properties['VertesBetweenness'] = bet_vert

# save the final graph
g.save("networkwithbet.xml.gz")

