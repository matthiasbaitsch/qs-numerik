
def is_prime(n):
    """Tests if the whole number `n` is prime.

    Warning: This function uses a very inefficient algorithm.

    Args:
        `n`: Number to be tested
    
    Returns:
        True if `n` is prime number, False otherwise
    """
    for i in range(2, n):
        if n % i == 0:
            return False
    return True


def prime_factors(n):
    """Compute prime factors of the number `n`.

    See https://de.wikibooks.org/wiki/Algorithmensammlung:_Zahlentheorie:_Primfaktorisierung

    Args:
        `n`: Number to be decomposed

    Returns:
        List of prime factors
    """
    t = 2
    factors = []

    while t**2 <= n:
        if n % t == 0:
            factors.append(t)
            n //= t
        else:
            t += 1
    factors.append(n)

    return factors
