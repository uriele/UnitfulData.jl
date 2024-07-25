
"""
    Data
    
    A dimension representing information.
    
"""
@dimension Data "Data" Information true

@derived_dimension DataRate Data*𝐓^-1 true


"""
 bit

 The bit, the SI base unit of information. 

 Dimension: Data

 See also: [`Data`]((@ref) , [`sh`]((@ref) , [`Hart`]((@ref) , [`nat`]((@ref) , [`Byte`](@ref)
"""
@refunit bit "bit" Bits Data false 
@unit_custom_prefix bit "bit" Bits prefixed_data true


"""
 Byte

 The Byte, a SI  unit of information, defined as 2^3 bits.

 Dimension: Data

 See also: [`Data`]((@ref) , [`bit`](@ref)
"""
@unit Byte "Byte" Bytes 8*bit false 
@unit_custom_prefix Byte "Byte" Bytes prefixed_data true





"""
 sh

 The shannon, the SI base unit of information entropy.
 The maximum entropy od n `bits` in n `shannon`.

 Dimension: Data

 See also: [`Data`]((@ref) , [`bit`]((@ref) , [`Hart`]((@ref) , [`nat`](@ref)
"""
@unit sh "sh" Shannon 1*bit true true



"""
 sh

 The hartley, a base 10 logaritmic unit of information entropy  
 defined as log2(10) sh.
 
 Dimension: Data

 See also: [`Data`]((@ref) , [`bit`]((@ref) , [`Hart`]((@ref) , [`nat`](@ref)
"""
@unit Hart "Hart" Hartley log2(10)*sh true true

"""
 sh

 The natural unit of information, a natural logaritmic unit of information entropy  
 defined as 1/log(2) sh.
 
 Dimension: Data

 See also: [`Data`]((@ref) , [`bit`]((@ref) , [`Hart`]((@ref) , [`sh`](@ref)
"""
@unit nat "nat" Nat (1/log(2))*sh true true



"""
 bps

 The byte, a unit of data transfer rate, defined as 1 bit / s.
 
 Dimension: DataRate

 See also: [`DataRate`]((@ref) , [`Bps`](@ref)
"""
@unit bps "bps" Bits_Per_Seconds 1*bit/s false
@unit_custom_prefix bps "bps" Bits_Per_Seconds prefixed_data true


"""
 Bps

 The byte per second, a unit of data transfer rate, defined as 1 byte / s.
 
 Dimension: DataRate

 See also: [`DataRate`]((@ref) , [`bps`](@ref)
"""
@unit Bps "Bps" Bytes_Per_Seconds 1*Byte/s false
@unit_custom_prefix Bps "Bps" Bytes_Per_Seconds prefixed_data true

#To Do: Add Quantum Information Units, need an @expscale and @expunit macro similar to @logscale and @logunit



# Arcaic and Unusual Units
"""
    trit

    The trit, a unit of information, defined as log2(3) bits.

    Dimension: Data

    See also: [`Data`]((@ref) , [`dit`]((@ref) , [`nybl`](@ref)
"""
@unit trit "trit" Trits _log2_3*bit true true

"""
    tribit
    
    The tribit, a unit of information, defined as 3 bits.
    
    Dimension: Data
    
    See also: [`Data`]((@ref) , [`dibit`]((@ref) , [`nybl`](@ref)
    
"""
@unit tribit "tribit" Tribits 3*bit true true

"""
    dibit
    
    The dibit, a unit of information, defined as 2*bits.
    
    Dimension: Data
    
    See also: [`Data`]((@ref) , [`tribit`]((@ref) , [`nybl`](@ref)
    
"""
@unit dibit "dibit" Dibits 2*bit true true



"""
    nybl
    
    The nibble, a unit of information, defined as 1/2 Bytes or 4 bits.
    
    Dimension: Data
    
    See also: [`Data`]((@ref) , [`dibit`]((@ref) , [`tribit`](@ref)
    
"""
@unit nybl "nybl" Nibbles 4*bit true true