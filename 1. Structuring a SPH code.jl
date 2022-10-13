## StaticArrays for better performance
using StaticArrays

# LinearAlgebra for easy linear algebra
using LinearAlgebra

## dimensions
const D = 1

## number of particles 
const N = 100

## Creat a data structure to store the important quantities, i.e. mass, positions, velocities and accelerations.
struct quantities
    mass::SVector{N,Float32}
    positions::SMatrix{N,D,Float32}
    velocities::SMatrix{N,D,Float32}
    accelerations::SMatrix{N,D,Float32}
end

## A methode to initialise the problem
function init()
    # fill mass quantity with some distribution (that is not defined yet)
    mass = massDistribution()

    #fill positions quantity with some distribution (that is not defined yet)
    positions = positionDistribution()

    #fill velocities quantity with some distribution (that is not defined yet)
    velocities = velocityDistribution()
    
    #fill accelerations quantity with some distribution (that is not defined yet)
    accelerations = accelerationDistribution()

    # return the initialised quantities
    return quantities(mass,positions,velocities,accelerations)
end

## Compute the smoothing length
function calcSmoothingLength(quant,η)
    # calculates the distance btween every particle and its neighbours
    rij = calcDistance(quant.positions)

    # calculate and return the smoothing lenght
    return η * mean(minimum(rij))
end
