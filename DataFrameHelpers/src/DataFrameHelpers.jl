module DataFrameHelpers

export isin

"""Function for comparing if items in a vector appear in another vector"""
function isin(y::Vector, x::Vector)
    output = Vector{BitVector}() # generate a vector for the bitwise outputs
    for i in 1:length(x) # loop through each item in the second vector
        push!(output, y .== x[i]) # elementwise check if the item in the second vector matches the first vector
    end
    # fairly certain I can do this with count. but I haven't checked
    int_to_vec(x) = x > 0 ? true : false # define a function to turn integer to true/false
    return int_to_vec.(sum(hcat(output))) # returns a bitvector
end

end # module
