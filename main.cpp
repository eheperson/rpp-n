#include <cmath>
#include <iostream>
#include <string>

#include "rppnConfig.h"

#ifdef USE_MODULE_1
    #include "TestLib.h"
#endif


int main(int argc, char** argv){


    const std::string inputName = "Mr. Anderson";

    #ifdef USE_MODULE_1
        greetings(inputName);
    #else
        std::cout << " 'ellooooo from main.cpp" << std::endl;
    #endif  

    return 0;
}




