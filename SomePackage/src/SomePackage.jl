module SomePackage

export SomeVector
export someplot, someplot!

struct SomeVector
    v::Vector{Float32}
end

function someplot end
function someplot! end

end # module SomePackage
