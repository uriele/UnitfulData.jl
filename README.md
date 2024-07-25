# UnitfulData

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://uriele.github.io/UnitfulData.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://uriele.github.io/UnitfulData.jl/dev/)
[![Build Status](https://github.com/uriele/UnitfulData.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/uriele/UnitfulData.jl/actions/workflows/CI.yml?query=branch%3Amaster)

UnitfulData.jl is an extension for [Unitful.jl](https://github.com/PainterQubits/Unitful.jl) that includes units of Information commonly encountered in Information Theory and Data Storage.

The extension also includes the exported macro `@unit_custom_prefix` that allows the generation of prefixed units for a general unit using a custom base and exponents and the constant `prefixed_data` containing the most common units in metric (base 10) and IEC (binary) format.

# Defined Units and Dimensions

## Data
A dimension representing Information either as Storage, Memory, or Entropy. 

- `bit` : the most basic unit of information in computing repesented an a binary digit

- `trit`: a ternary unit that encode the information with three non-negative numbers

- `Byte`: number of bits used to encode a character of text in the computer.

- `sh`: the shannon is the unit of information content associated with and event occuring with probability 1/2. 

- `Hart`: the hartley is a unit of information and entropy on base 10

- `nat`: the natural unit of information is a unit of information and entropy based on the natural logarithms

## DataRate
A derived dimension that represate the unit of Information passing through a channel per unit of time.

- `bps`: the change of rate of information in bits/seconds

- `Bps`: the change of rate of information in Bytes/seconds

# Exported Macros and Functions

## From `Unitful`

- `@u_str`
- `@unit`
- `dimension`
- `uconvert`
- `ustrip`
- `upreferred`

## From `UnitfulData`

- `@unit_custom_prefix`
- `@data_allocated`
- `data_summary`
