
function isprime(n)
    """Tests if the whole number `n` is prime.

    Warning: This function uses a very inefficient algorithm.

    Args:
        `n`: Number to be tested
    
    Returns:
        true if `n` is prime number, False otherwise
    """
    for i in 2:n - 1
        if n % i == 0
            return false
        end
    end
    return true
end


function primefactors(n)
    """Compute prime factors of the number `n`.

    See https://de.wikibooks.org/wiki/Algorithmensammlung:_Zahlentheorie:_Primfaktorisierung

    Args:
        `n`: Number to be decomposed

    Returns:
        List of prime factors
    """
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
    append!(factors, n)

    return factors
end
