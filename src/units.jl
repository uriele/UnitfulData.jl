
"""
    Data
    
    A dimension representing information.
    
"""
@dimension Data "Data" Information true

@derived_dimension DataRate Data*𝐓^-1 true


"""
 Databit

 The bit, the SI base unit of information. 

 Dimension: Data

 See also: 
    - [`Data`](@ref)
    - [`Datash`](@ref)
    - [`DataHart`](@ref)
    - [`Datanat`](@ref)
    - [`DataByte`](@ref)
"""
@refunit bit "bit" Bits Data false 
@unit_custom_prefix bit "bit" Bits prefixed_data true


"""
 DataByte

 The Byte, a SI  unit of information, defined as 2^3 bits.

 Dimension: Data

 See also: 
    - [`Data`](@ref)
    - [`Databit`](@ref)
"""
@unit Byte "Byte" Bytes 8*bit false 
@unit_custom_prefix Byte "Byte" Bytes prefixed_data true





"""
 Datash

 The shannon, the SI base unit of information entropy.
 The maximum entropy od n `bits` in n `shannon`.

 Dimension: Data

 See also: 
    - [`Data`](@ref)
    - [`Databit`](@ref)
    - [`DataHart`](@ref)
    - [`Datanat`](@ref)
"""
@unit sh "sh" Shannon 1*bit true true



"""
 Datash

 The hartley, a base 10 logaritmic unit of information entropy  
 defined as log2(10) sh.
 
 Dimension: Data

 See also: 
    - [`Data`](@ref)
    - [`Databit`](@ref)
    - [`DataHart`](@ref)
    - [`Datanat`](@ref)
"""
@unit Hart "Hart" Hartley log2(10)*sh true true

"""
 Datash

 The natural unit of information, a natural logaritmic unit of information entropy  
 defined as 1/log(2) sh.
 
 Dimension: Data

 See also: 
    - [`Data`](@ref)
    - [`Databit`](@ref)
    - [`DataHart`](@ref)
    - [`Datash`](@ref)
"""
@unit nat "nat" Nat (1/log(2))*sh true true



"""
 Databps

 The byte, a unit of data transfer rate, defined as 1 bit / s.
 
 Dimension: DataRate

 See also: 
    - [`DataRate`](@ref)
    - [`DataBps`](@ref)
"""
@unit bps "bps" Bits_Per_Seconds 1*bit/s false
@unit_custom_prefix bps "bps" Bits_Per_Seconds prefixed_data true


"""
 DataBps

 The byte per second, a unit of data transfer rate, defined as 1 byte / s.
 
 Dimension: DataRate

 See also: 
    - [`DataRate`](@ref)
    - [`Databps`](@ref)
"""
@unit Bps "Bps" Bytes_Per_Seconds 1*Byte/s false
@unit_custom_prefix Bps "Bps" Bytes_Per_Seconds prefixed_data true

#To Do: Add Quantum Information Units, need an @expscale and @expunit macro similar to @logscale and @logunit



# Arcaic and Unusual Units
"""
    Datatrit

    The trit, a unit of information, defined as log2(3) bits.

    Dimension: Data

    See also: 
        - [`Data`](@ref)
        - [`Datadit`](@ref)
        - [`Datanybl`](@ref)
"""
@unit trit "trit" Trits _log2_3*bit true true

"""
    Datatribit
    
    The tribit, a unit of information, defined as 3 bits.
    
    Dimension: Data
    
    See also: 
        - [`Data`](@ref)
        - [`Datadibit`](@ref)
        - [`Datanybl`](@ref)
    
"""
@unit tribit "tribit" Tribits 3*bit true true

"""
    Datadibit
    
    The dibit, a unit of information, defined as 2*bits.
    
    Dimension: Data
    
    See also: 
        - [`Data`](@ref)
        - [`Datatribit`](@ref)
        - [`Datanybl`](@ref)
    
"""
@unit dibit "dibit" Dibits 2*bit true true



"""
    Datanybl
    
    The nibble, a unit of information, defined as 1/2 Bytes or 4 bits.
    
    Dimension: Data
    
    See also: 
        - [`Data`](@ref)
        - [`Datadibit`](@ref)
        - [`Datatribit`](@ref)
    
"""
@unit nybl "nybl" Nibbles 4*bit true true