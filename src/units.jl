
"""
    $(@__MODULE__).Data
    
    A dimension representing information.
    
"""
@dimension Data "Data" Information true


"""
 $(@__MODULE__).bit

 The bit, the SI base unit of information. 

 Dimension: $(@__MODULE__).Data

 See also: 
    - [`$(@__MODULE__).Data`](@ref)
    - [`$(@__MODULE__).sh`](@ref)
    - [`$(@__MODULE__).Hart`](@ref)
    - [`$(@__MODULE__).nat`](@ref)
    - [`$(@__MODULE__).Byte`](@ref)
"""
@refunit bit "bit" Bits Data false 
@unit_custom_prefix bit "bit" Bits prefixed_data true


"""
 $(@__MODULE__).Byte

 The Byte, a SI  unit of information, defined as 2^3 bits.

 Dimension: $(@__MODULE__).Data

 See also: 
    - [`$(@__MODULE__).Data`](@ref)
    - [`$(@__MODULE__).bit`](@ref)
"""
@unit Byte "Byte" Bytes 8*bit false 
@unit_custom_prefix Byte "Byte" Bytes prefixed_data true

@derived_dimension DataRate Data*𝐓^-1 true

"""
 $(@__MODULE__).sh

 The shannon, the SI base unit of information entropy.
 The maximum entropy od n `bits` in n `shannon`.

 Dimension: $(@__MODULE__).Data

 See also: 
    - [`$(@__MODULE__).Data`](@ref)
    - [`$(@__MODULE__).bit`](@ref)
    - [`$(@__MODULE__).Hart`](@ref)
    - [`$(@__MODULE__).nat`](@ref)
"""
@unit sh "sh" Shannon 1*bit true true



"""
 $(@__MODULE__).sh

 The hartley, a base 10 logaritmic unit of information entropy  
 defined as log2(10) sh.
 
 Dimension: $(@__MODULE__).Data

 See also: 
    - [`$(@__MODULE__).Data`](@ref)
    - [`$(@__MODULE__).bit`](@ref)
    - [`$(@__MODULE__).Hart`](@ref)
    - [`$(@__MODULE__).nat`](@ref)
"""
@unit Hart "Hart" Hartley log2(10)*sh true true

"""
 $(@__MODULE__).sh

 The natural unit of information, a natural logaritmic unit of information entropy  
 defined as 1/log(2) sh.
 
 Dimension: $(@__MODULE__).Data

 See also: 
    - [`$(@__MODULE__).Data`](@ref)
    - [`$(@__MODULE__).bit`](@ref)
    - [`$(@__MODULE__).Hart`](@ref)
    - [`$(@__MODULE__).sh`](@ref)
"""
@unit nat "nat" Nat (1/log(2))*sh true true



"""
 $(@__MODULE__).bps

 The byte, a unit of data transfer rate, defined as 1 bit / s.
 
 Dimension: $(@__MODULE__).DataRate

 See also: 
    - [`$(@__MODULE__).DataRate`](@ref)
    - [`$(@__MODULE__).Bps`](@ref)
"""
@unit bps "bps" Bits_Per_Seconds 1*bit/s false
@unit_custom_prefix bps "bps" Bits_Per_Seconds prefixed_data true


"""
 $(@__MODULE__).Bps

 The byte per second, a unit of data transfer rate, defined as 1 byte / s.
 
 Dimension: $(@__MODULE__).DataRate

 See also: 
    - [`$(@__MODULE__).DataRate`](@ref)
    - [`$(@__MODULE__).bps`](@ref)
"""
@unit Bps "Bps" Bytes_Per_Seconds 1*Byte/s false
@unit_custom_prefix Bps "Bps" Bytes_Per_Seconds prefixed_data true

#To Do: Add Quantum Information Units, need an @expscale and @expunit macro similar to @logscale and @logunit



# Arcaic and Unusual Units
"""
    $(@__MODULE__).trit

    The trit, a unit of information, defined as log2(3) bits.

    Dimension: $(@__MODULE__).Data

    See also: 
        - [`$(@__MODULE__).Data`](@ref)
        - [`$(@__MODULE__).dit`](@ref)
        - [`$(@__MODULE__).nybl`](@ref)
"""
@unit trit "trit" Trits _log2_3*bit true true
"""
    $(@__MODULE__).tribit
    
    The tribit, a unit of information, defined as 3 bits.
    
    Dimension: $(@__MODULE__).Data
    
    See also: 
        - [`$(@__MODULE__).Data`](@ref)
        - [`$(@__MODULE__).dibit`](@ref)
        - [`$(@__MODULE__).nybl`](@ref)
    
"""
@unit tribit "tribit" Tribits 3*bit true true

"""
    $(@__MODULE__).dibit
    
    The dibit, a unit of information, defined as 2*bits.
    
    Dimension: $(@__MODULE__).Data
    
    See also: 
        - [`$(@__MODULE__).Data`](@ref)
        - [`$(@__MODULE__).tribit`](@ref)
        - [`$(@__MODULE__).nybl`](@ref)
    
"""
@unit dibit "dibit" Dibits 2*bit true true



"""
    $(@__MODULE__).nybl
    
    The nibble, a unit of information, defined as 1/2 Bytes or 4 bits.
    
    Dimension: $(@__MODULE__).Data
    
    See also: 
        - [`$(@__MODULE__).Data`](@ref)
        - [`$(@__MODULE__).dibit`](@ref)
        - [`$(@__MODULE__).tribit`](@ref)
    
"""
@unit nybl "nybl" Nibbles 4*bit true true