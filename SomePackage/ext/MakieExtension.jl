module MakieExtension

if isdefined(Base, :get_extension)
    using Makie
else
    using ..Makie
end

using SomePackage
import SomePackage: someplot, someplot!

Makie.convert_single_argument(v::SomeVector) = v.v

@recipe(SomePlot) do scene
    Theme()
end

function Makie.plot!(p::SomePlot)
    lines!(p, p[1])
    scatter!(p, p[1])
    return p
end

end