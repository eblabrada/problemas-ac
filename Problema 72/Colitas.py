def factorial(n):
    result = 1
    for i in range(n, 0, -1):
        result *= i
    return result

n = 5
print(factorial(n))