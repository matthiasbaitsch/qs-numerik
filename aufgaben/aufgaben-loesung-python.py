# Summe Quadratzahlen

# Variante 1
print(sum((i**2 for i in range(3, 31))))

# Variante 2
s = 0
for i in range(3, 31):
    s += i**2
print(s)

# Fizz Buzz
# Variante 1
for i in range(1,101):
    if not i % 15:
        print("fizzbuzz")
    elif not i % 5:
        print("buzz")
    elif not i % 3:
        print("fizz")
    else:
        print(i)

# Variante 2
for i in range(1,101):
    fizzbuzzed = False
    if not i % 3:
        print("fizz", end="")
        fizzbuzzed = True
    if not i % 5:
        print("buzz", end="")
        fizzbuzzed = True
    if not fizzbuzzed:
        print(i)
    else:
        print()

# Fakultät
# Variante 1
def factorial(a):
    f = 1
    for i in range(1, a+1):
        f *= i
    return f

# Variante 2
from math import factorial

# Häufigkeit
# Variante 1
def count_occurrences(c, word):
    return sum((1 for i in word if i == c))

# Variante 2
def count_occurrences(c, word):
    s = 0
    for i in word:
        if i == c:
            s += 1
    return s

# Anagramm
# Variante 1
def is_anagram(wort1, wort2):
    A = wort1.lower()
    B = wort2.lower()
    if len(A) != len(B):
        return False
    for c in A:
        if A.count(c) != B.count(c):
            return False
    return True

# Variante 2
def is_Anagram(wort1, wort2):
    return sorted(wort1.lower()) == sorted(wort2.lower())

# Quadratische Function
def make_quadratic_function(a, b, c):
    return lambda x: a + b * x + c * x**2

