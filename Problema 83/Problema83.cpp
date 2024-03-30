#include <bits/stdc++.h>
using namespace std;

int n;
int counter = 0;

void dfs(int node, int array[]) {
    if (array[node] == -1)
        return;

    counter++;

    if (node * 2 + 1 < n)
        dfs(node * 2 + 1, array);

    if (node * 2 + 2 < n)
        dfs(node * 2 + 2, array);
};


int main() {
   
    cin >> n;

    int array[n];
    for (int i = 0; i < n; ++i)
        cin >> array[i];

    dfs(0, array);

    cout << counter << '\n';

}