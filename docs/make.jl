using UnitfulData
using Documenter
using DocumenterInterLinks

DocMeta.setdocmeta!(UnitfulData, :DocTestSetup, :(using UnitfulData); recursive=true)

linka= InterLinks(
    "Unitful" => "https://painterqubits.github.io/Unitful.jl/stable/",
    "Julia" => (
        "https://docs.julialang.org/en/v1/",
        joinpath(@__DIR__, "inventories", "Julia.toml")
    )

)


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
)

deploydocs(;
    repo="github.com/uriele/UnitfulData.jl",
    devbranch="main",
)
