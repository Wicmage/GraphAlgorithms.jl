using LightGraphs
using SimpleWeightedGraphs
using Test

## TODO tests

DIGRAPHS = Dict{String,DiGraph}(
    "complete20" => complete_digraph(20),
    "path40" => path_digraph(40)
)
GRAPHS = Dict{String,Graph}(
    "petersen" => smallgraph(:petersen),
    "tutte" => smallgraph(:tutte),
    "complete20" => complete_graph(20)
)
WEIGHTED_GRAPHS = Dict{String,SimpleWeightedGraph}(
    ""
)


tests = [
    "operators.jl",
    "diversity.jl",
    "sets.jl",
    "fractional_numbers.jl"
]

@testset GraphAlgorithms begin
    for t in tests
        include(t)
    end
end