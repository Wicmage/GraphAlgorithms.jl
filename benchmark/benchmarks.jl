using BenchmarkTools
using GraphAlgorithms
using LightGraphs,SimpleWeightedGraphs

DIGRAPHS = Dict{String,DiGraph}(
    "complete20" => complete_digraph(20),
    "path40" => path_digraph(40)
)
GRAPHS = Dict{String,Graph}(
    "petersen" => smallgraph(:petersen),
    "tutte" => smallgraph(:tutte),
    "complete20" => complete_graph(20)
)

suite = BenchmarkGroup()
include("operators.jl")
include("sets.jl")
include("diversity.jl")
include("fractional_numbers.jl")

tune!(suite);
results = run(suite, verbose=true, seconds=60, samples=10000)