using Changelog

Changelog.generate(
    Changelog.CommonMark(),
    joinpath(@__DIR__, "..", "CHANGELOG.md"),
    joinpath(@__DIR__, "src", "release-notes.md");
    repo = "uriele/UnitfulData.jl",
)