fractional=(
    fractional_covering_number,fractional_matching_number,fractional_coloring_number
)
for f in fractional
    suite[string(f)] = BenchmarkGroup(["fractional"])
    suite[string(f)]["graphs"] = BenchmarkGroup()
    suite[string(f)]["digraphs"] = BenchmarkGroup()
    for (name,g) in GRAPHS
        suite[string(f)]["graphs"][name] = @benchmarkable $(f)($g)
    end
    for (name,g) in DIGRAPHS
        suite[string(f)]["digraphs"][name] = @benchmarkable $(f)($g)
    end
end