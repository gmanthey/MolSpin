# --------------------------------------------------------------------------
# Molecular Spin Dynamics Software - developed by Claus Nielsen and Luca Gerhards.
# (c) 2019 Quantum Biology and Computational Physics Group.
# See LICENSE.txt for license information.
# ----
# Molspin requires the Armadillo C++ library version 8.5 or newer to be
# installed. You should install OpenBLAS, Intel MKL, or other math libraries
# before installing Armadillo, please see documentation for Armadillo.
# 
# Note: If you use Intel MKL instead of OpenBLAS, you may need to remove two
# lines from main.cpp, i.e. the lines using the function
# "openblas_set_num_threads".
# 
# MolSpin was developed using gcc 5.4.0.
# --------------------------------------------------------------------------
# Using MKL with dynamic linking can be done like this:
#LMKL = -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lm -ldl -fopenmp
# Be sure to check the Intel MKL Link Line Advisor to get the correct link
# line for your specific system.
# Note that this line should be added to LFLAGS only.
# --------------------------------------------------------------------------
# Compile using Armadillo, here assuming OpenBLAS and Lapack is used
ARMADILLO = -larmadillo -lopenblas64 -llapack -fopenmp -DARMA_NO_DEBUG
# For an installation in a non-standard location, use:
# ARMADILLO = -I/path/to/armadillo/installdir/include/ -DARMA_DONT_USE_WRAPPER -fopenmp
# --------------------------------------------------------------------------
# If you have different versions of gcc or the C++ stdlib installed,
# adding the following to LFLAGS may help:
#LSTATICLIBS = -static-libstdc++ -static-libgcc
# --------------------------------------------------------------------------
# SpinAPI module
PATH_SPINAPI_BUILD = ./build/SpinAPI
PATH_SPINAPI = ./SpinAPI
OBJS_SPINAPI = $(PATH_SPINAPI_BUILD)/SpinSystem.o $(PATH_SPINAPI_BUILD)/Spin.o $(PATH_SPINAPI_BUILD)/Interaction.o $(PATH_SPINAPI_BUILD)/Transition.o $(PATH_SPINAPI_BUILD)/Operator.o $(PATH_SPINAPI_BUILD)/Pulse.o $(PATH_SPINAPI_BUILD)/State.o $(PATH_SPINAPI_BUILD)/SpinSpace.o $(PATH_SPINAPI_BUILD)/StandardOutput.o $(PATH_SPINAPI_BUILD)/Tensor.o $(PATH_SPINAPI_BUILD)/Trajectory.o $(PATH_SPINAPI_BUILD)/SubSystem.o $(PATH_SPINAPI_BUILD)/Function.o
DEP_SPINAPI = 
# --------------------------------------------------------------------------
# MSD-Parser module
PATH_MSDPARSER_BUILD = ./build/MSDParser
PATH_MSDPARSER = ./MSDParser
OBJS_MSDPARSER = $(PATH_MSDPARSER_BUILD)/MSDParser.o $(PATH_MSDPARSER_BUILD)/FileReader.o $(PATH_MSDPARSER_BUILD)/ObjectParser.o
DEP_MSDPARSER = $(PATH_MSDPARSER)/MSDParser.h
# --------------------------------------------------------------------------
# RunSection module
PATH_RUNSECTION_BUILD = ./build/RunSection
PATH_RUNSECTION = ./RunSection
OBJS_RUNSECTION = $(PATH_RUNSECTION_BUILD)/RunSection.o $(PATH_RUNSECTION_BUILD)/BasicTask.o $(PATH_RUNSECTION_BUILD)/Action.o $(PATH_RUNSECTION_BUILD)/Settings.o $(PATH_RUNSECTION_BUILD)/OutputHandler.o $(PATH_RUNSECTION_BUILD)/Utility.o
DEP_RUNSECTION = $(PATH_RUNSECTION)/RunSection.h
# ---
# RunSection custom tasks
PATH_RUNSECTION_CUSTOMTASKS = ./RunSection/Tasks/Custom
OBJS_RUNSECTION_CUSTOMTASKS = 
DEP_RUNSECTION_CUSTOMTASKS = 
# ---
# RunSection tasks
PATH_RUNSECTION_TASKS_BUILD = ./build/RunSection/Tasks
PATH_RUNSECTION_TASKS = ./RunSection/Tasks
OBJS_RUNSECTION_TASKS = $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticSS.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticHSSymmetricDecay.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskHamiltonianEigenvalues.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticRPOnlyHSSymDec.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticSSTimeEvo.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskDynamicHSTimeEvo.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskPeriodicSSTimeEvo.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskPeriodicHSTimeEvo.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskGammaCompute.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskMultiStaticSSTimeEvo.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskMultiDynamicHSTimeEvo.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticSSRedfield.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticSSRedfieldSparse.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticSSRedfieldTimeEvo.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticSSRedfieldTimeEvoSparse.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskMultiStaticSSRedfieldTimeEvo.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticSSSpectra.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticSSCIDNP.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticRPOnlyHSSymDecRedfield.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticHSStochYields.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticHSStochTimeEvo.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticHSDirectYields.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticHSDirectTimeEvo.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskDynamicHSDirectYields.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskDynamicHSDirectTimeEvo.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskDynamicHSStochYields.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskDynamicHSStochTimeEvo.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticHSDirectYieldsSymmUncoupled.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticHSDirectTimeEvoSymmUncoupled.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticHSStochYieldsSymmUncoupled.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticHSStochTimeEvoSymmUncoupled.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskActionSpectrumHistogram.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskActionSpectrumHistogramRPOnlyDec.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticSSPump.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticSSNakajimaZwanzigTimeEvo.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticSSNakajimaZwanzig.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskMultiStaticSSTimeEvoSpectra.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskMultiStaticSSNakajimaZwanzigTimeEvo.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskMultiRadicalPairSSTimeEvo.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticSSSpectraNakajimaZwanzig.o $(PATH_RUNSECTION_TASKS_BUILD)/TaskStaticHSDirectSpectra.o $(OBJS_RUNSECTION_CUSTOMTASKS)  
DEP_RUNSECTION_TASKS = $(DEP_RUNSECTION_CUSTOMTASKS)
# ---
# RunSection actions
PATH_RUNSECTION_ACTIONS_BUILD = ./build/RunSection/Actions
PATH_RUNSECTION_ACTIONS = ./RunSection/Actions
OBJS_RUNSECTION_ACTIONS = $(PATH_RUNSECTION_ACTIONS_BUILD)/ActionRotateVector.o $(PATH_RUNSECTION_ACTIONS_BUILD)/ActionScaleVector.o $(PATH_RUNSECTION_ACTIONS_BUILD)/ActionAddVector.o $(PATH_RUNSECTION_ACTIONS_BUILD)/ActionAddScalar.o $(PATH_RUNSECTION_ACTIONS_BUILD)/ActionMultiplyScalar.o $(PATH_RUNSECTION_ACTIONS_BUILD)/ActionFibonacciSphere.o $(PATH_RUNSECTION_ACTIONS_BUILD)/ActionLogSpace.o
DEP_RUNSECTION_ACTIONS = 
# --------------------------------------------------------------------------
# Unit testing module
PATH_TESTS_BUILD = ./build/Tests
PATH_TESTS = ./Tests
OBJS_TESTS = $(PATH_TESTS_BUILD)/testmain.o $(OBJS_SPINAPI) $(OBJS_MSDPARSER) $(OBJS_RUNSECTION) $(OBJS_RUNSECTION_TASKS) $(OBJS_RUNSECTION_ACTIONS)
DEP_TESTS = 
# --------------------------------------------------------------------------
#LinearAlgebra Vendor code
PATH_LINALG_VENDOR = ./Vendor/
#---------------------------------------------------------------------------
# General Compilation Options
OBJECTS = ./build/main.o $(OBJS_SPINAPI) $(OBJS_MSDPARSER) $(OBJS_RUNSECTION) $(OBJS_RUNSECTION_TASKS) $(OBJS_RUNSECTION_ACTIONS)
CC = g++ -std=c++17		# Compiler to use
DEBUG = -g				# Add this to LFLAGS/CFLAGS to be able to debug
LFLAGS = -Wall -g -DARMA_DONT_PRINT_FAST_MATH_WARNING -O3	# Linker Flags
CFLAGS = -Wall -c -march=native -funroll-loops -fconcepts -g -fopenmp -DARMA_DONT_PRINT_FAST_MATH_WARNING -O3 # Compile flags to .o
# --------------------------------------------------------------------------
# Compilation of the main program
# --------------------------------------------------------------------------
SEARCHDIR_MOLSPIN = -I$(PATH_SPINAPI) -I$(PATH_MSDPARSER) -I$(PATH_RUNSECTION) -I$(PATH_RUNSECTION_TASKS) -I$(PATH_RUNSECTION_CUSTOMTASKS) -I$(PATH_RUNSECTION_ACTIONS) -I$(PATH_LINALG_VENDOR) $(ARMADILLO)
molspin: $(OBJECTS)
	$(CC) $(LFLAGS) $^ $(SEARCHDIR_MOLSPIN) -o $@

SEARCHDIR_MAIN = -I$(PATH_SPINAPI) -I$(PATH_MSDPARSER) -I$(PATH_RUNSECTION) -I$(PATH_RUNSECTION_TASKS) -I$(PATH_RUNSECTION_CUSTOMTASKS) -I$(PATH_RUNSECTION_ACTIONS) -I$(PATH_LINALG_VENDOR) $(ARMADILLO)
./build/main.o: main.cpp $(DEP_MSDPARSER) $(DEP_SPINAPI)
	$(CC) $(CFLAGS) $(SEARCHDIR_MAIN) main.cpp -o ./build/main.o
# --------------------------------------------------------------------------
# Specific compilation rules
# --------------------------------------------------------------------------
# Make sure that changes to RunSection_CreateTask.cpp triggers recompilation of the RunSection class
$(PATH_RUNSECTION_BUILD)/RunSection.o: $(PATH_RUNSECTION)/RunSection.cpp $(PATH_RUNSECTION)/RunSection_CreateTask.cpp $(PATH_RUNSECTION)/RunSection.h
	$(CC) $(CFLAGS) $(SEARCHDIR_MOLSPIN) $(PATH_RUNSECTION)/RunSection.cpp -o $(PATH_RUNSECTION_BUILD)/RunSection.o

# The SpinSpace class has been split into multiple source files due to its complexity
$(PATH_SPINAPI_BUILD)/SpinSpace.o: $(PATH_SPINAPI)/SpinSpace.cpp $(PATH_SPINAPI)/SpinSpace/SpinSpace_management.cpp $(PATH_SPINAPI)/SpinSpace/SpinSpace_states.cpp $(PATH_SPINAPI)/SpinSpace/SpinSpace_operators.cpp $(PATH_SPINAPI)/SpinSpace/SpinSpace_hamiltonians.cpp $(PATH_SPINAPI)/SpinSpace/SpinSpace_pulses.cpp $(PATH_SPINAPI)/SpinSpace/SpinSpace_transitions.cpp $(PATH_SPINAPI)/SpinSpace/SpinSpace_relaxation.cpp $(PATH_SPINAPI)/SpinSpace.h
	$(CC) $(CFLAGS) $(SEARCHDIR_MOLSPIN) $(PATH_SPINAPI)/SpinSpace.cpp -o $(PATH_SPINAPI_BUILD)/SpinSpace.o
# --------------------------------------------------------------------------
# General compilation rule
# --------------------------------------------------------------------------
./build/%.o: %.cpp %.h
	echo $@
	mkdir -p `dirname $@`
	$(CC) $(CFLAGS) $(SEARCHDIR_MOLSPIN) $< -o $@
# --------------------------------------------------------------------------
# Unit testing module
# --------------------------------------------------------------------------
SEARCHDIR_TESTS = $(SEARCHDIR_MAIN) -I$(PATH_TESTS)
# Compile test job
test: $(OBJS_TESTS)
	$(CC) $(LFLAGS) $(OBJS_TESTS) $(SEARCHDIR_TESTS) -o $(PATH_TESTS_BUILD)/molspintest
	$(PATH_TESTS_BUILD)/molspintest
	
$(PATH_TESTS_BUILD)/testmain.o: $(PATH_TESTS)/testmain.cpp $(PATH_TESTS)/tests_spinapi.cpp $(PATH_TESTS)/tests_msdparser.cpp $(PATH_TESTS)/tests_actions.cpp $(PATH_TESTS)/tests_TaskStaticHSSymmetricDecay.cpp $(PATH_TESTS)/tests_TaskStaticSS.cpp $(PATH_TESTS)/tests_TaskStaticSSSpectra.cpp $(PATH_TESTS)/tests_TaskStaticRPOnlyHSSymDec.cpp $(PATH_TESTS)/assertfunctions.cpp
	$(CC) $(CFLAGS) $(SEARCHDIR_TESTS) $(PATH_TESTS)/testmain.cpp -o $(PATH_TESTS_BUILD)/testmain.o
# --------------------------------------------------------------------------
# Misc tasks
# --------------------------------------------------------------------------
# Clean-up binaries for clean recompilation
.PHONY: clean
clean:
	rm *.o $(PATH_MSDPARSER_BUILD)/*.o $(PATH_SPINAPI_BUILD)/*.o $(PATH_RUNSECTION_BUILD)/*.o $(PATH_RUNSECTION_ACTIONS_BUILD)/*.o $(PATH_RUNSECTION_TASKS_BUILD)/*.o molspin $(PATH_TESTS_BUILD)/*.o $(PATH_TESTS_BUILD)/molspintest

# Clean-up testing binaries and run the test again
.PHONY: cleantest
cleantest:
	rm $(PATH_TESTS_BUILD)/*.o $(PATH_TESTS_BUILD)/molspintest
	make test

