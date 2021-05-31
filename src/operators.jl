# Returns all of the edges that are source or destination of a vertex
function edges_of(graph::AbstractGraph, vertex::Integer)
    Ev = Vector{AbstractEdge}()
    E = edges(graph)
    for e = E
        if vertex in (src(e),dst(e)); push!(Ev,e) end
    end
    return Ev
end

function unweighted_complement(graph::AbstractGraph)
    return complement(SimpleGraph(graph))
end
