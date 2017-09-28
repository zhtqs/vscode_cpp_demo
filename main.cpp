#include <iostream>

int main()
{
    std::cout<<"Hello World for Visual Studio Code C++ "<<std::endl;
    return 0;
}

extern "C" int __declspec(dllexport) get_age()
{
    return 21;
}