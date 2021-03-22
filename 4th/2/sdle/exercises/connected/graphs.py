#!/usr/bin/env python3

import networkx as nx
import matplotlib.pyplot as plt
import random

def add_edges_until_connected(graph, iterations = 10):
    for i in range(iterations):
        graph.add_node(i)
    while not nx.is_connected(graph):
        [a, b] = random.sample(range(iterations), 2)
        graph.add_edge(a, b)
