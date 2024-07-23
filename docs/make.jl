using DataUnitful
using Documenter

DocMeta.setdocmeta!(DataUnitful, :DocTestSetup, :(using DataUnitful); recursive=true)

makedocs(;
    modules=[DataUnitful],
    authors="Marco Menarini",
    sitename="DataUnitful.jl",
    format=Documenter.HTML(;
        canonical="https://uriele.github.io/DataUnitful.jl",
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/uriele/DataUnitful.jl",
    devbranch="master",
)
