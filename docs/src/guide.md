# Package Guide

UnitfulData is designed to expand the package Unitful to the most common units of Information and Information rate. It can also be used to easily identify the size of objects and files in the correct unit for development and profiling purposes.

## Quick start

UnitfulData can be installed using the Julia package manager. From Julia REPL, type `]` to enter the Pkg REPL mode and run

```
pkg> add UnitfulData
```

To load the package in your enviroment you can run in the Julia REPL:

```
julia> using UnitfulData
```

## Adding More Units and Custom Prefixes

To add more units, the current package export the base [`@unit`](@extref `Unitful.@unit`) macro for the [`Unitful.jl`](https://github.com/keno/Unitful.jl) package. To create a new unit and extend them using a custom prefix -- different from the default power-of-ten prefix provided by the package or to just using a subset of it -- you can use the macro [`@unit_custom_prefix`]@(ref).
```@meta
DocTestSetup = quote
    using Unitful
    using UnitfulData

    @unit u_test "u_test" UTest 1*bit false
    @unit_custom_prefix u_test "u_test" UTest _prefix=Dict((1,10)=>"A",(2,2)=>"B",(3,3)=>"C")
end
```

```jldoctest
julia> 10u_test==1Au_test
true

julia> 4u_test==1Bu_test
true

julia> 27u_test==1Cu_test
true
```

!!! note 
    If the macro `@unit_custom_prefix is provided without a prefix, it will use the default `prefix_data` constant provided by the package, that includes the positive power-of-tens up to `Yotta` (10^24) and the power-of-twos up to 80 `Yi` (2^80).


To add new units to a precompiled package, you will need to add at the end of your package and **after** all the new units and dimention have been created an initialization function to register the new units with unitful

```julia
    const localunits = copy(Unitful.basefactors)
    const localpromotion = copy(Unitful.promotion) # only if you have used @dimension
    function __init__()
        merge!(Unitful.basefactors, localunits)
        merge!(Unitful.promotion, localpromotion)  # only if you've used @dimension
        Unitful.register(UnitfulData) #register newly created units
    end
```

## Memory and Allocation

You can check the memory used by an object using [`data_summary`](@ref). 


```julia-repl
julia> julia>  data_summary(a; unit=MByte) # total size of the object in MBytes (base 10)
8.000055999999999 MByte

julia> data_summary(aa; unit=MiByte) # total size of the object in MiBytes (base 2)
7.629447937011719 MiByte

julia> data_summary(aa; unit=bit, exclude=Array) # size of the object itself in bits
128 bit
```

Similarly, to check the memory allocated during the execution of an expression you can use [`@data_allocated](@ref)

```julia-repl
julia> @data_allocated tests(1,b) bit # memory allocated in bits
256 bit

julia> @data_allocated tests(1,c) nat # memory allocated in natural units
177.445678223346 nat
```

!!! note
    If no second term is provided to the macro, the result will be showed in Bytes
