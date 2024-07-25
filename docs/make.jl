using UnitfulData
using Documenter
using DocumenterInterLinks

links= InterLinks(
    "Unitful" => "https://painterqubits.github.io/Unitful.jl/stable/",
    "Julia" =>     "https://docs.julialang.org/en/v1/"
)

DocMeta.setdocmeta!(UnitfulData, :DocTestSetup, :(using UnitfulData); recursive=true)


makedocs(;
    modules=[UnitfulData],
    authors="Marco Menarini",
    sitename="UnitfulData.jl",
    format=Documenter.HTML(;
        canonical="https://uriele.github.io/UnitfulData.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
    plugins=[links],
)

deploydocs(;
    repo="github.com/uriele/UnitfulData.jl",
    devbranch="main",
)
