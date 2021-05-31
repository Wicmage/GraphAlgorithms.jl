function diversity(graph::AbstractGraph)
    D = Dict{Integer,Number}()
    k = degree(graph)
    w = Dict{AbstractEdge,Number}()

    for e = edges(graph)
        w[e] = typeof(graph)<:AbstractSimpleWeightedGraph ? weight(e) : 1
    end

    for v = vertices(graph)
        Ev = edges_of(graph,v)
        p = Dict{AbstractEdge,Number}()
        
        for e = Ev
            p[e] = w[e]/sum(w[e1] for e1 in Ev)
        end
        D[v] = k[v]>1 ? -sum(p[e]*log(p[e]) for e in Ev)/log(k[v]) : NaN
    end
    
    return D
end