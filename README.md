![image] (https://i.imgur.com/lgUW7YD.png)

Copyright (c) 2018, The TurtleCoin Developers
Copyright (c) 2018, The Nibble Developers
Please see the included LICENSE file for more information.

How To Compile
Linux
Prerequisites

You will need the following packages: boost, cmake (3.8 or higher), make, and git.

You will also need either GCC/G++, or Clang.

If you are using GCC, you will need GCC-7.0 or higher.

If you are using Clang, you will need Clang 6.0 or higher. You will also need libstdc++-6.0 or higher.

Ubuntu, using GCC

    sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
    sudo apt-get update
    sudo apt-get install aptitude -y
    sudo aptitude install -y build-essential g++-8 gcc-8 git libboost-all-dev python-pip
    sudo pip install cmake
    export CC=gcc-8
    export CXX=g++-8
    git clone -b master --single-branch https://github.com/NibbleClassic/NibbleClassic-Linux-CLI
    cd NibbleClassic-Linux-CLI
    mkdir build
    cd build
    cmake ..
    make

The binaries will be in the src folder when you are complete.

    cd src
    ./Nibbled --version
    
You need to modify the below command for your version of ubuntu


    Ubuntu 14.04 (Trusty)

    sudo add-apt-repository "deb https://apt.llvm.org/trusty/ llvm-toolchain-trusty 6.0 main"

    Ubuntu 16.04 (Xenial)

    sudo add-apt-repository "deb https://apt.llvm.org/xenial/ llvm-toolchain-xenial 6.0 main"

OSX/Apple, using GCC
Prerequisites

    Install XCode and Developer Tools.

Building

    which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install --force cmake boost llvm gcc@8
    export CC=gcc-8
    export CXX=g++-8
    git clone -b master --single-branch https://github.com/NibbleClassic/NibbleClassic-Linux-CLI
    cd NibbleClassic-Linux-CLI
    mkdir build
    cd build
    cmake ..
    make

The binaries will be in the src folder when you are complete.

    cd src
    ./Nibbled --version

OSX/Apple, using Clang
Prerequisites

    Install XCode and Developer Tools.

Building

    which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install --force cmake boost llvm
    export CC=/usr/local/opt/llvm/bin/clang
    export CXX=/usr/local/opt/llvm/bin/clang++
    git clone -b master --single-branch https://github.com/NibbleClassic/NibbleClassic-Linux-CLI
    cd NibbleClassic-Linux-CLI
    mkdir build
    cd build
    cmake ..
    make
The binaries will be in the src folder when you are complete.

    cd src
    ./Nibbled --version

How To Compile

Windows
Prerequisites

    Install Visual Studio 2017 Community Edition
    When installing Visual Studio, it is required that you install Desktop development with C++
    Install the latest version of Boost - Currently Boost 1.68.

Building

    From the start menu, open 'x64 Native Tools Command Prompt for vs2017'.
    cd <your_nibbleclassic_directory>
    mkdir build
    cd build
    set PATH="C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin";%PATH%
    cmake -G "Visual Studio 15 2017 Win64" .. -DBOOST_ROOT=C:/local/boost_1_68_0

If you have errors on this step about not being able to find the following static libraries, you may need to update your cmake. Open 'Visual Studio Installer' and click 'Update'.

    MSBuild NibbleClassic.sln /p:Configuration=Release /m

The binaries will be in the src/Release folder when you are complete.

    cd src
    cd Release
    Nibbled.exe --version


