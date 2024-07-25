module UnitfulData
    import Unitful 
    using Unitful: @u_str, @unit, @dimension, @derived_dimension,𝐓,s,uconvert,Unitlike
    using Unitful: dimension,basefactor,unit,Unit,@refunit,@unit_symbols,abbr,Unit,basefactors_expr, FreeUnits
    using Base: @__doc__, gc_bytes, summarysize
    import Base.Experimental
    export @u_str, @unit, @unit_custom_prefix, prefixed_data,abbr,Unitlike
    export Unit,@unit_symbols,s,uconvert, absoluteunit, dimension, uconvert, ustrip, upreferred
    export Data, DataRate
    export bit, Byte, bps, Bps, sh, Hart, nat,dibit,tribit,nybl,trit
    export kbit, Mbit, Gbit, Tbit, Pbit, Ebit, Zbit, Ybit, Kibit, Mibit, Gibit, Tibit, Pibit, Eibit, Zibit, Yibit
    export KByte, MByte, GByte, TByte, PByte, EByte, ZByte, YByte, KiByte, MiByte, GiByte, TiByte, PiByte, EiByte, ZiByte, YiByte
    export kbps, Mbps, Gbps, Tbps, Pbps, Ebps, Zbps, Ybps, KiBps, MiBps, GiBps, TiBps, PiBps, EiBps, ZiBps, YiBps
    export KBps, MBps, GBps, TBps, PBps, EBps, ZBps, YBps, KIBps, MIBps, GIBps, TIBps, PIBps, EIBps, ZIBps, YIBps
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
