#include <bits/stdc++.h>
using namespace std;

int main() {

    int na;
    cin >> na;

    int array[na];
    for(int i = 0; i < na; ++i)
        cin >> array[i];

    int n;
    cin >> n;

    for(int i = 0; i < na; ++i)
        if(n % array[i] == 0)
            cout << array[i] << '\n';

    cout << '\n';

    for(int i = 0; i < na; ++i)
        if(n % array[i] != 0)
            cout << array[i] << '\n';
}