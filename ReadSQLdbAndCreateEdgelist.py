
# coding: utf-8

# In[ ]:


import sqlite3
from sqlite3 import Error


# In[ ]:


import pandas as pd


# In[ ]:


databasename = "CBDB_aw_20180831_sqlite.db"
 
# create a database connection
conn = create_connection(databasename)


# # Preprosess association among people

# In[ ]:


cur = conn.cursor()

# Use SQL to get association table
cur.execute("SELECT c_personid AS personA, c_assoc_id AS personB, c_assoc_code from assoc_data     WHERE personA IN (        SELECT c_personid FROM biog_main WHERE c_index_year <= 1912 AND c_index_year >= 618);")
rows = cur.fetchall() 


# In[ ]:


# convert to panda dataframe
asso = pd.DataFrame(rows, columns=['initiator', 'object', 'category'])


# In[ ]:


# read weight definition file

asso_weight = pd.read_csv("assoc_codes_w1.csv")

# drop all columns except association category and weight. 
asso_weight.drop(["c_assoc_pair", "c_assoc_desc", "c_assoc_desc_chn","c_assoc_role_type", "c_sortorder"], axis=1, inplace = True)


# In[ ]:



# Join weight into the association table
asso_weighted = asso.join(
    asso_weight.set_index("c_assoc_code"),
    on = "category"
)
# remove relationships with "nil" or "0" weight. 
asso_weighted = asso_weighted [asso_weighted["Weight"]!="Nil"]
asso_weighted = asso_weighted [asso_weighted["Weight"]!=0]

# dropassociation category
asso_weighted.drop("category", axis = 1, inplace = True)


# In[ ]:


asso_weighted


# # Preprocess kin table

# In[ ]:


# Use SQL to get association table
cur.execute("SELECT c_personid AS personA, c_kin_id AS personB, c_kin_code from kin_data     WHERE    personA IN (        SELECT c_personid FROM biog_main WHERE c_index_year <= 1912 AND c_index_year >= 618)    AND    c_kin_code IN (75, 82, 107, 111, 135, 138, 163, 168, 176, 180, 182, 183, 184, 185, 186, 188, 191, 193, 194, 195, 196, 198, 199, 202, 204, 205, 206, 207, 211, 212, 213, 220, 221, 222, 226, 227, 229, 230, 231, 234, 235, 307, 326, 327, 329, 334, 335, 339, 343, 344, 363, 373, 377, 378, 420, 436, 437, 439, 440, 450, 451, 452, 453, 454, 455, 456, 457, 458, 467, 468, 559, 560, 575);")
rows = cur.fetchall() 


# In[ ]:


# convert to panda dataframe
dkin = pd.DataFrame(rows, columns=['initiator', 'object', 'category'])


# In[ ]:


# read weight definition file

dkin_weight = pd.read_csv("kincode_direct_w1.csv")

# drop all columns except association category and weight. 
dkin_weight.drop(["Name"], axis=1, inplace = True)


# In[ ]:


dkin_weight


# In[ ]:



# Join weight into the association table
dkin_weighted = dkin.join(
    dkin_weight.set_index("kin_code"),
    on = "category"
)


# In[ ]:


dkin_weighted["Weight"]!="Nil"


# In[ ]:



# remove relationships with "nil" or "0" weight. 

dkin_weighted = dkin_weighted [dkin_weighted["Weight"]!=0]

# dropassociation category
dkin_weighted.drop("category", axis = 1, inplace = True)


# In[ ]:


dkin_weighted


# # Combine non-kin and kin tables

# In[ ]:


# concatenate two tables
allasso = pd.concat([asso_weighted,dkin_weighted], axis = 0)

# create "weight" columns as float type based on "Weight" column and then drop "Weight" column
allasso['weight'] = allasso.Weight.astype('float')
allasso.drop('Weight', axis = 1, inplace = True)


# In[ ]:


# add all weight from the same initiator to the same obeject together
asso_grouped = allasso.groupby(["initiator","object"]).agg('sum').reset_index()


# In[ ]:


# Check whether there is still duplicates
dup = asso_grouped.duplicated()
dup [dup == True] # should be an empty "series"


# In[ ]:


# recheck the columns names. 
asso_grouped.columns = ['initiator','object','weight']


# In[ ]:


# save to a hdf 
asso_grouped.to_hdf('assodata.h5', key='asso', mode='w')

