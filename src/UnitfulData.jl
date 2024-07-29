module UnitfulData
    import Unitful 
    using Unitful: showval, has_unit_spacing, isunitless
    using Unitful: @u_str, @unit, @dimension, @derived_dimension,𝐓,s,uconvert,Unitlike,ustrip,Time,𝐓,upreferred
    using Unitful: dimension,basefactor,unit,Unit,@refunit,@unit_symbols,basefactors_expr, FreeUnits,Dimensions
    using Base: @__doc__, gc_bytes, summarysize
    import Base.Experimental
    import Base.show
    # Exported from Unitful
    export @u_str, @unit
    export Unitlike, 𝐓
    export  s, uconvert, dimension, uconvert, ustrip, unit, upreferred
    # Exported from UnitfulData
    export Data, DataRate,prefixed_data,@unit_custom_prefix
    export bit,   Byte,  bps,  Bps, sh, Hart, nat,dibit,tribit,nybl,trit
    export kbit,  Mbit,  Gbit,  Tbit,  Pbit,  Ebit,  Zbit,  Ybit,  Kibit,  Mibit,  Gibit,  Tibit,  Pibit,  Eibit,  Zibit,  Yibit
    export kByte, MByte, GByte, TByte, PByte, EByte, ZByte, YByte, KiByte, MiByte, GiByte, TiByte, PiByte, EiByte, ZiByte, YiByte
    export kbps,  Mbps,  Gbps,  Tbps,  Pbps,  Ebps,  Zbps,  Ybps,  Kibps,  Mibps,  Gibps,  Tibps,  Pibps,  Eibps,  Zibps,  Yibps
    export kBps,  MBps,  GBps,  TBps,  PBps,  EBps,  ZBps,  YBps,  KiBps,  MiBps,  GiBps,  TiBps,  PiBps,  EiBps,  ZiBps,  YiBps
    export @data_allocated, data_summary
    # Constants
    const _log2_10 = log2(10);
    const _log2_3 = log2(3);
    const _log2_e = log2(ℯ);
    include("./utils.jl")
    include("./macro.jl")
    include("./units.jl")

    const localunits = copy(Unitful.basefactors)
    const localpromotion = copy(Unitful.promotion)
    function __init__()
        merge!(Unitful.basefactors, localunits)
        merge!(Unitful.promotion, localpromotion)  # only if you've used @dimension
        Unitful.register(UnitfulData)
    end

end
