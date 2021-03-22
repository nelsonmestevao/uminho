# Note the python import here
import reuse, sys
import networkx as nx
import matplotlib.pyplot as plt
import random

from graphs import add_edges_until_connected

# This is the Ipython hook
sys.meta_path.append(reuse.NotebookFinder())

G = nx.Graph()

add_edges_until_connected(G)

