
"""
    isprime(n)

Tests if the whole number `n` is prime.

Warning: This function uses a very inefficient algorithm.

Args:
    `n`: Number to be tested

Returns:
    true if `n` is prime number, false otherwise
"""
function isprime(n)
    if n < 2
        return false
    end
    for i in 2:n - 1
        if n % i == 0
            return false
        end
    end
    return true
end


"""
    primefactors(n)

Compute prime factors of the number `n`.

See https://de.wikibooks.org/wiki/Algorithmensammlung:_Zahlentheorie:_Primfaktorisierung

Args:
    `n`: Number to be decomposed

Returns:
    List of prime factors
"""
function primefactors(n)
    t = 2
    factors = []

    while t^2 <= n
        if n % t == 0
            append!(factors, t)
            n ÷= t
        else
            t += 1
        end
    end
    if n > 1
        append!(factors, n)
    end

    return factors
end
