def cross_product(u, v):
    i = u[1] * v[2] - u[2] * v[1]
    j = u[2] * v[0] - u[0] * v[2]
    k = u[0] * v[1] - u[1] * v[0]
    return (i, j, k)

u = (2, 0, 1)
v = (1, -1, 3)

result = cross_product(u, v)
print(f"({result[0]},{result[1]},{result[2]})")