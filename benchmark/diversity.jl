suite["diversity"] = BenchmarkGroup()
suite["diversity"]["graphs"] = BenchmarkGroup()
suite["diversity"]["digraphs"] = BenchmarkGroup()
for (name,g) in GRAPHS
    suite["diversity"]["graphs"][name] = @benchmarkable diversity($g)
end
for (name,g) in DIGRAPHS
    suite["diversity"]["digraphs"][name] = @benchmarkable diversity($g)
end