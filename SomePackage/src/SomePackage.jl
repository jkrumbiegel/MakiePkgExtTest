module SomePackage

export SomeVector
export someplot, someplot!, someotherplot, someotherplot!

struct SomeVector
    v::Vector{Float32}
end

function someplot end
function someplot! end

function someotherplot end
function someotherplot! end

function __init__()
    Base.Experimental.register_error_hint(MethodError) do io, exc, argtypes, kwargs
        if exc.f in [someplot, someplot!, someotherplot, someotherplot!]
            if isempty(methods(exc.f))
                print(io, "\n$(exc.f) has no methods, yet. Makie has to be loaded for the plotting extension to be activated. Run `using Makie`, `using CairoMakie`, `using GLMakie` or any other package that also loads Makie.")
            end
        end
    end
end

end # module SomePackage
