"""
   data_summary(ex; unit::Unitlike=Byte, exclude=Union{...}, chargeall=Union{...})

Wrapper around `Base.summarysize` that returns the size of the data in the specified unit.
If `unit` is not a `Data` unit, it defaults to `Byte`.

See also: [`@data_allocated`](@ref), [`Base.summarysize`](@extref)
"""
function data_summary(ex; unit::Unitlike=Byte, 
    exclude = Union{DataType, Core.TypeName, Core.MethodInstance},
    chargeall = Union{Core.TypeMapEntry, Method}) 
    
    data_unit = dimension(unit)
    if data_unit != Data 
        unit=Byte 
        @warn("unit $(unit) is not a Data, defaulting to Byte")
    end

    return uconvert(unit,Base.summarysize(ex; exclude=exclude, chargeall=chargeall)*Byte)
end   
