#suite["edges_of"] = BenchmarkGroup(["operator"])
#suite["edges_of"]["graphs"] = BenchmarkGroup()
#suite["edges_of"]["digraphs"] = BenchmarkGroup()
#for (name,g) in GRAPHS
#    suite["edges_of"]["graphs"][name] = @benchmarkable edges_of($g,$1)
#end
#for (name,g) in DIGRAPHS
#    suite["edges_of"]["digraphs"][name] = @benchmarkable edges_of($g,$1)
#end