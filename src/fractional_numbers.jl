function fractional_covering_number(graph::AbstractGraph)

    model = Model(GLPK.Optimizer)
    V = vertices(graph)
    @variable(model, x[V]>=0)
    for e = edges(graph)
        @constraint(model, x[src(e)]+x[dst(e)] >=1)
    end
    @objective(model, Min, sum(x))

    optimize!(model)

    return (value.(x),objective_value(model))
end

function fractional_matching_number(graph::AbstractGraph)

    model = Model(GLPK.Optimizer)
    E = edges(graph)
    @variable(model, x[E]>=0)
    for v = vertices(graph)
        Ev = edges_of(graph, v)
        @constraint(model, sum(x[i] for i in Ev) <= 1)
    end

    @objective(model, Max, sum(x))

    optimize!(model)

    return (value.(x),objective_value(model))
end

function fractional_coloring_number(graph::AbstractGraph)

    model = Model(GLPK.Optimizer)
    independent_sets = maximal_cliques(unweighted_complement(graph))

    @variable(model, x[independent_sets] >= 0)

    for v = vertices(graph)
        independent_v = [i for i in independent_sets if v in i]
        @constraint(model, sum(x[i] for i in independent_v) >= 1)
    end

    @objective(model, Min, sum(x))

    optimize!(model)

    return (value.(x),objective_value(model))
end