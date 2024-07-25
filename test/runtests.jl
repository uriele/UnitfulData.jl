using UnitfulData
using Test
using Logging
using Base.Docs
using UnitfulData: _log2_10, _log2_3, _log2_e
using Unitful: 𝐓
using Mmap: mmap

include("./test_util.jl")
test_values = Dict(
    :bit => 1,
    :Byte => 8,
    :bps => 1,
    :Bps => 8,
    :sh => 1,
    :Hart => _log2_10,
    :nat => _log2_e,
    :trit => _log2_3,
    :dibit => 2,
    :tribit => 3,
    :nybl => 4,
)

test_units= Dict(
    :k => 1e3,
    :M => 1e6,
    :G => 1e9,
    :T => 1e12,
    :P => 1e15,
    :E => 1e18,
    :Z => 1e21,
    :Y => 1e24,
    :Ki => 1024,
    :Mi => 1024.0^2,
    :Gi => 1024.0^3,
    :Ti => 1024.0^4,
    :Pi => 1024.0^5,
    :Ei => 1024.0^6,
    :Zi => 1024.0^7,
    :Yi => 1024.0^8,
)

test_prefix=Dict((3,10) => "k10", (3,5) => "k5",(3,4) => "k4",(3,3) => "k3", (3,2)  => "k2")

val= 1234.2
@unit utest "utest" uTest 1*bit false # create a test unit
@unit_custom_prefix utest "utest" uTest _prefix=Dict((3,10) => "k10", (3,5) => "k5", (3,4) => "k4",(3,3) => "k3",(3,2) => "k2") true # create the custom prefixes test
        

@testset "UnitfulData.jl" begin

    # Test Unit Dimension
    @testset "Unit Dimension" begin
        @test dimension(bit) == dimension(Byte) == Data
        @test dimension(sh) == dimension(Hart) == dimension(nat) == Data
        @test dimension(trit) == dimension(dibit) ==  dimension(tribit) == dimension(nybl) == Data
        
        @test dimension(bps) == dimension(Bps) == Data*𝐓 ^-1

        @test dimension(1Hart/1bps) == dimension(1Hart/1Bps) == 𝐓
        @test dimension(1nat/1bps) ==  dimension(1nat/1Bps) ==  𝐓
        @test dimension(1sh/1bps) ==  dimension(1sh/1Bps) ==    𝐓
        @test dimension(1bit/1bps) == dimension(1bit/1Bps) ==   𝐓
        @test dimension(1Byte/1bps) == dimension(1Byte/1Bps) ==  𝐓
    end
    # Test Value Correctness
    @testset "Unit Values" begin
        @test val*bit  == val*test_values[:bit]*bit == val*test_values[:sh]*bit
        @test val*Byte == val*test_values[:Byte]*bit == val*2*test_values[:nybl]*bit
        @test val*bps  == val*test_values[:bps]*bps
        @test val*Bps  == val*test_values[:Bps]*bps
        @test val*nat  == val*test_values[:nat]*bit
        @test val*tribit   == 3*val*test_values[:bit]*bit
        @test val*dibit    == 2*val*test_values[:bit]*bit
        @test val*trit     == _log2_3*val*test_values[:bit]*bit
        @test val*nybl     == 4*val*test_values[:bit]*bit
        @test val*Hart     == _log2_10*val*test_values[:bit]*bit
        @test val*nat    == _log2_e*val*test_values[:bit]*bit
    end
    
    # Test Unit Correctness
    @testset "Unit Correctness" begin
        for (unit, value) in test_units
            @test value*bit == 1eval(Symbol(unit,"bit"))
        end
    end

    
    io=open("./testfile.bin","r")
    readed=readlines(io);
    close(io)
    test_arr=rand(10^6)
    
    size_chunk=Base.summarysize(readed)
    size_arr = @allocated test_arr
    # Test util functions and macros
    @testset "Test utilities" begin
        @test size_arr* Byte == @data_allocated(test_arr) 
        @test size_chunk * Byte == data_summary(readed)
        @test_logs (:warn,"unit Byte is not a Data, defaulting to Byte") data_summary(rand(100), unit=s)
    end

    # Test creation macro with custom prefixes
    @testset "Test custom prefixes" begin
        for ((k,kbase), value) in test_prefix
            @test 1*float(kbase)^k*utest == 1eval(Symbol(value,"utest"))
            @test _hasdoc(@__MODULE__,Symbol(value,"utest"))
        end

    end
end
