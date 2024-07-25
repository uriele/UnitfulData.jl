```@meta
CurrentModule = UnitfulData
DocTestSetup = quote
    using UnitfulData
end
DocTestFilters = [r"Stacktrace:[\s\S]+"]
```

# UnitfulData

Documentation for [UnitfulData](https://github.com/uriele/UnitfulData.jl).


UnitfulData.jl is an extension for [Unitful.jl](https://github.com/PainterQubits/Unitful.jl) that includes units of Information commonly encountered in Information Theory and Data Storage.

The extension also includes the exported macro [`@unit_custom_prefix`](@ref) that allows the generation of prefixed units for a general unit using a custom base and exponents and the constant [`prefixed_data`](@ref) containing the most common units in metric (base 10) and IEC (binary) format.

The [`Package Guide`] provides a tutorial explaining how to get started using `UnitfulData`.

## Defined Units and Dimensions

### Data
A dimension representing Information either as Storage, Memory, or Entropy. 


* [`bit`](@ref) : the most basic unit of information in computing repesented an a binary digit

* [`trit`](@ref) : a ternary unit that encode the information with three non-negative numbers

* [`Byte`](@ref) : number of bits used to encode a character of text in the computer.

* [`sh`](@ref) : the shannon is the unit of information content associated with and event occuring with probability 1/2. 

* [`Hast`](@ref) : the hartley is a unit of information and entropy on base 10

* [`nat`] : the natural unit of information is a unit of information and entropy based on the natural logarithms

A derived dimension that represate the unit of Information passing through a channel per unit of time.

* [`bps`](@ref) : the change of rate of information in bits/seconds

* [`Bps`](@ref) : the change of rate of information in Bytes/seconds

# Exported Macros and Functions

## From `Unitful`

- [`@u_str`](@extref `Unitful.@u_str`)
- [`@unit`](@extref `Unitful.@unit`)
- [`dimension`](@extref `Unitful.dimension`)
- [`uconvert`](@extref `Unitful.uconvert`)
- [`ustrip`](@extref `Unitful.ustrip`)
- [`upreferred`](@extref `Unitful.upreferred`)

## From `UnitfulData`

- [`@unit_custom_prefix`](@ref)
- [`@data_allocated`](@ref)
- [`data_summery`](@ref)


