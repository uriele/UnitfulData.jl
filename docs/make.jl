using UnitfulData
using Documenter

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
)

deploydocs(;
    repo="github.com/uriele/UnitfulData.jl",
    devbranch="main",
)
