using Base.Docs: Binding, defined, getdoc, resolve, meta, modules, aliasof
"""
    _hasdoc(mod::Module, sym::Symbol)::Bool

Return `true` if `sym` in `mod` has a docstring and `false` otherwise.

!!! note
    This function is based on the `Base.Docs.doc` method implemented in `REPL/src/docview.jl`
    that is not present in $(VERSION) of Julia. In the future, this function will be removed and
    replaced by `Base.Docs.doc` when it is available.
"""
_hasdoc(mod::Module, sym::Symbol) = _hasdoc(Docs.Binding(mod, sym))
function _hasdoc(binding::Docs.Binding, sig::Type = Union{})
    # this function is based on the Base.Docs.doc method implemented
    # in REPL/src/docview.jl.  TODO: refactor and unify these methods.
    defined(binding) && !isnothing(getdoc(resolve(binding), sig)) && return true
    for mod in modules
        dict = meta(mod; autoinit=false)
        !isnothing(dict) && haskey(dict, binding) && return true
    end
    alias = aliasof(binding)
    return alias == binding ? false : hasdoc(alias, sig)
end


"""
    _undocumented_names(mod::Module; private=false)

Return a sorted vector of undocumented symbols in `module` (that is, lacking docstrings).
`private=false` (the default) returns only identifiers declared with `public` and/or
`export`, whereas `private=true` returns all symbols in the module (excluding
compiler-generated hidden symbols starting with `#`).

!!! note
    This function is based on the `Base.Docs.undocumented` method implemented in `REPL/src/docview.jl`
    that is not present in $(VERSION) of Julia. In the future, this function will be removed and
    replaced by `Base.Docs.undocumented` when it is available.  

"""
function _undocumented_names(mod::Module; private::Bool=false)
    filter!(names(mod; all=true)) do sym
        !_hasdoc(mod, sym) && !startswith(string(sym), '#') &&
            (private || Base.ispublic(mod, sym))
    end
end

  