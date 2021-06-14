function largest_independence_number(graph::AbstractGraph)
    return largest_clique_number(complement(graph))
end

function largest_independents_set(graph::AbstractGraph)
    return largest_cliques_set(complement(graph))
end

function largest_clique_number(graph::AbstractGraph)
    return length(largest_cliques_set(graph)[1])
end

function largest_cliques_set(graph::AbstractGraph)
    max_cliques = maximal_cliques(graph)
    largest_cliques = Vector{Vector{Integer}}()
    number = 0
    for clique = max_cliques
        lc=length(clique)
        number = lc>number ? lc : number
    end
    for clique = max_cliques
        if length(clique)==number; push!(largest_cliques, clique) end
    end

    return largest_cliques
end