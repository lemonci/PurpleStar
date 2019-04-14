
# coding: utf-8

# In[ ]:


import pandas as pd
import networkx as nx

    


# In[ ]:



inputdf = pd.read_hdf('assodata.h5', key='asso', mode='r')


# In[ ]:


G = nx.from_pandas_edgelist(inputdf, 'initiator', 'object', ['weight'])


# In[ ]:


centrality = nx.eigenvector_centrality(G ,max_iter=500, weight = 'weight' )


# In[ ]:


result = pd.DataFrame(data = centrality,index=[0]).T


# In[ ]:


result.to_csv('eigenvector.csv',header = None)

