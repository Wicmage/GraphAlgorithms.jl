module GraphAlgorithms

using LightGraphs
using SimpleWeightedGraphs
using GLPK
using JuMP

export

# Operators
edges_of,unweighted_complement,

# Fractional numbers
fractional_covering_number, fractional_coloring_number,
fractional_matching_number,

# Sets
largest_clique_number, largest_cliques_set,
largest_independence_number, largest_independents_set,

# Diversity
diversity

GraphAlgorithms
include("diversity.jl")
include("fractional_numbers.jl")
include("operators.jl")
include("sets.jl")

end # module