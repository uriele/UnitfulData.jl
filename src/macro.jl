const prefixed_data = Dict(
    (3,10) => "k",
    (6,10) => "M",
    (9,10) => "G",
    (12,10) => "T",
    (15,10) => "P",
    (18,10) => "E",
    (21,10) => "Z",
    (24,10) => "Y",
    (10,2) => "Ki",
    (20,2) => "Mi",
    (30,2) => "Gi",
    (40,2) => "Ti",
    (50,2) => "Pi",
    (60,2) => "Ei",
    (70,2) => "Zi",
    (80,2) => "Yi"
)

"""
    @unit_custom_prefix(symb,abbr,name, _prefix,autodocs=false)

A macro to create prefixed units. The macro creates a unit with the specified symbol, abbreviation, and name.
The unit is prefixed by the values in `_prefix`. If `autodocs` is true, the macro will generate a docstring for the unit.

```julia-repl
julia> @unit utest "utest" uTests 1bit false
utest
julia> @unit_custom_prefix utest "utest" uTest _prefix=Dict((2,10)=>"hecto")

See also: [`@unit`](@ref), [`@unit_symbols`](@ref)
"""
macro unit_custom_prefix(symb,abbr,name, _prefix,autodocs=false)
    expr = Expr(:block)
    basefactor = (1.0, 1)
    n=Meta.quot(Symbol(name))
    user_dimension = :($Unitful.dimension($symb))

    for ((k,kbase), value) in eval(_prefix)
        symb_i= Symbol(string(value, symb))
        name_i= Meta.quot(Symbol(value, name))
        
        abbr_i = string(value, abbr)
        scale_i = eval(:($float($kbase)^($k)))
        scalefactor_i = :($scale_i * $symb)
       

        
        @debug symb_i  name_i
        u = :($Unit{$name_i, $user_dimension}($k,1//1))
        @debug u
        if k == 0
            ea = quote
                Base.@__doc__  $symb_i 
            end
        else
            push!(expr.args,quote
                $Unitful.@unit $symb_i $abbr_i $name_i $scalefactor_i false false
            end)
            docstring1 = """
                            $__module__.$symb_i

                        A prefixed unit, equal to $kbase^$k $symb.

                        Dimension: """
            docstring2 = "\n\nSee also: [`$__module__.$symb`](@ref)."
            ea = quote
                if $autodocs
                    @doc $docstring1*string($user_dimension)*$docstring2 $symb_i
                end
            end
        end
        push!(expr.args, ea)
    end

    esc(expr)
end


"""
    @data_allocated(ex,unit=Byte)

A macro to evaluate an expression, discarding the resulting value, instead returning the
total size of the allocated memory in a unit of `UnitfulData.Byte`. If `unit` is specified, 
the result is converted to that unit. By default, the result is in Bytes.

See also [`@allocations`](@ref), [`data_summary`](@ref)

```julia-repl
julia> @data_allocated rand(10^6) MByte
8.000080 MBytes
```
"""
macro data_allocated(ex,unit=Byte)
    quote
        Experimental.@force_compile
        local b0 = Ref{Int64}(0)
        local b1 = Ref{Int64}(0)
        gc_bytes(b0)
        $(esc(ex)) 
        gc_bytes(b1)
        local memory_object = (b1[] - b0[])*Byte
        eval(uconvert($unit,memory_object))
    end
end