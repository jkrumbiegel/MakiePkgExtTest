Trying to use Makie with the new Pkg extension feature in Julia 1.9

Observations:
- I made an extension dependent on `Makie`. It seemed not to load when I installed `CairoMakie` into the main env. Only when I explicitly installed `Makie` did the extension load. Could be a bit confusing for end users.
- You cannot export a function defined in an extension (or at least you're not supposed to as far as I know). So I defined two empty functions `someplot` and `someplot!` in `SomePackage` and then imported them in the extension. This caused `@recipe(SomePlot)...` to add its methods to those functions. A little tricky maybe, but could be workable.
- To guide unknowing users, I've implemented an error hint that only fires for `MethodError`s on the plotting functions if they don't yet have any methods, and tells users that `Makie` needs to be loaded.