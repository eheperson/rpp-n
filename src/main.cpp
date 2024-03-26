#include <cmath>
#include <iostream>
#include <string>

#include <rppnConfig.h>

#ifdef USE_TESTLIB
    #include "TestLib.h"
#endif


int main(int argc, char** argv){
    const std::string inputName = "Mr. Anderson";

    #ifdef USE_TESTLIB
        greetings(inputName);
    #else
        std::cout << " 'ellooooo from main.cpp" << std::endl;
    #endif  

    return 0;
}




