#/********************************************************************\
#*            Albany, Copyright (2010) Sandia Corporation             *
#*                                                                    *
#* Notice: This computer software was prepared by Sandia Corporation, *
#* hereinafter the Contractor, under Contract DE-AC04-94AL85000 with  *
#* the Department of Energy (DOE). All rights in the computer software*
#* are reserved by DOE on behalf of the United States Government and  *
#* the Contractor as provided in the Contract. You are authorized to  *
#* use this computer software for Governmental purposes but it is not *
#* to be released or distributed to the public. NEITHER THE GOVERNMENT*
#* NOR THE CONTRACTOR MAKES ANY WARRANTY, EXPRESS OR IMPLIED, OR      *
#* ASSUMES ANY LIABILITY FOR THE USE OF THIS SOFTWARE. This notice    *
#* including this sentence must appear on any copies of this software.*
#*    Questions to Andy Salinger, agsalin@sandia.gov                  *
#\********************************************************************/

# This is a sample Trilinos configuration script for Albany.
#
# Boost is required, but just needs to be unpacked,
# not compiled. Version _1_40 or newer.
#
# There are two optional build choices, commented below
#   these are for Dakota and Exodus I/O capabilites.
#
# Albany automatically queries the Trilinos build to 
# know if these capabilities are enabled or disabled.
#
#
# All paths must me changed for your build (search "agsalin")
#
rm -f CMakeCache.txt
rm -rf CMakeFiles
source ../envRhel7.sh

INSTALL_DIR='../install'
BUILD_DIR=`pwd`

cmake -D CMAKE_INSTALL_PREFIX:PATH=$INSTALL_DIR \
      -D CMAKE_BUILD_TYPE:STRING=RELEASE \
      -D Trilinos_VERBOSE_CONFIGURE:BOOL=ON \
      -D Trilinos_ENABLE_CONFIGURE_TIMING:BOOL=ON \
\
      -D TPL_ENABLE_MPI:BOOL=ON \
      -D MPI_BASE_DIR:PATH=${MPICH_ROOT} \
\
      -D TPL_ENABLE_Netcdf:BOOL=ON \
      -D TPL_Netcdf_INCLUDE_DIRS:PATH=${NETCDF_ROOT}/include \
      -D Netcdf_LIBRARY_DIRS:PATH=${NETCDF_ROOT}/lib \
\
      -D TPL_ENABLE_HDF5:BOOL=OFF \
\
      -D Amesos2_ENABLE_KLU2:BOOL=ON \
\
      -D TPL_ENABLE_Boost:BOOL=ON \
      -D Boost_INCLUDE_DIRS:FILEPATH="${BOOST_ROOT}/include" \
      -D Boost_LIBRARY_DIRS:FILEPATH="${BOOST_ROOT}/lib" \
      -D TPL_ENABLE_BoostLib:BOOL=ON \
      -D BoostLib_INCLUDE_DIRS:FILEPATH="${BOOST_ROOT}/include" \
      -D BoostLib_LIBRARY_DIRS:FILEPATH="${BOOST_ROOT}/lib" \
\
      -D LAPACK_LIBRARY_DIRS:PATH=${NETLIB_LAPACK_ROOT}/lib64 \
      -D LAPACK_LIBRARY_NAMES:STRING="lapack,tmglib" \
\
      -D TPL_ENABLE_BLAS=ON \
      -D BLAS_LIBRARY_NAMES:STRING="openblas" \
      -D BLAS_LIBRARY_DIRS:PATH=${OPENBLAS_ROOT} \
      -D BLAS_INCLUDE_DIRS:PATH=${OPENBLAS_ROOT} \
\
      -D HAVE_CXX_PRAGMA_WEAK:BOOL=OFF \
      -D Trilinos_ENABLE_TESTS:BOOL=OFF \
      -D Piro_ENABLE_TESTS:BOOL=OFF \
      -D Rythmos_ENABLE_TESTS:BOOL=OFF \
      -D ROL_ENABLE_TESTS:BOOL=OFF \
      -D Trilinos_ENABLE_EXAMPLES:BOOL=OFF \
      -D Trilinos_ENABLE_ALL_PACKAGES:BOOL=OFF \
      -D Trilinos_ENABLE_ALL_OPTIONAL_PACKAGES:BOOL=OFF \
      -D CMAKE_VERBOSE_MAKEFILE:BOOL=OFF \
      -D Trilinos_ENABLE_EXPLICIT_INSTANTIATION:BOOL=ON \
\
      -D Trilinos_ENABLE_Amesos:BOOL=ON \
      -D Trilinos_ENABLE_Amesos2:BOOL=ON \
      -D Trilinos_ENABLE_Anasazi:BOOL=ON \
      -D Trilinos_ENABLE_AztecOO:BOOL=ON \
      -D Trilinos_ENABLE_Belos:BOOL=ON \
      -D Trilinos_ENABLE_COMPLEX_DOUBLE:BOOL=ON \
      -D Trilinos_ENABLE_Epetra:BOOL=ON \
      -D Trilinos_ENABLE_EpetraExt:BOOL=ON \
      -D Trilinos_ENABLE_FEI:BOOL=OFF\
      -D Trilinos_ENABLE_Ifpack:BOOL=ON \
      -D Trilinos_ENABLE_Ifpack2:BOOL=ON \
      -D Trilinos_ENABLE_Intrepid:BOOL=ON \
      -D Trilinos_ENABLE_Intrepid2:BOOL=ON \
      -D Trilinos_ENABLE_Kokkos:BOOL=ON \
      -D Kokkos_ENABLE_Serial:BOOL=ON \
      -D Kokkos_ENABLE_OpenMP:BOOL=OFF \
      -D Kokkos_ENABLE_Pthread:BOOL=OFF \
      -D Trilinos_ENABLE_OpenMP:BOOL=OFF \
      -D Trilinos_ENABLE_MiniTensor:BOOL=ON \
      -D Trilinos_ENABLE_ML:BOOL=ON \
      -D Trilinos_ENABLE_MueLu:BOOL=ON \
      -D Trilinos_ENABLE_NOX:BOOL=ON \
      -D Trilinos_ENABLE_OptiPack:BOOL=ON \
      -D Trilinos_ENABLE_Pamgen:BOOL=ON \
      -D Trilinos_ENABLE_PanzerExprEval:BOOL=ON \
      -D Trilinos_ENABLE_Phalanx:BOOL=ON \
      -D Trilinos_ENABLE_Piro:BOOL=ON \
      -D Anasazi_ENABLE_RBGen:BOOL=OFF \
      -D Trilinos_ENABLE_ROL:BOOL=ON \
      -D Trilinos_ENABLE_Rythmos:BOOL=ON \
      -D Trilinos_ENABLE_Sacado:BOOL=ON \
      -D Trilinos_ENABLE_SEACASExodus:BOOL=ON \
      -D Trilinos_ENABLE_SEACASIoss:BOOL=ON \
      -D Trilinos_ENABLE_SEACASAprepro_lib:BOOL=ON \
      -D Trilinos_ENABLE_Shards:BOOL=ON \
      -D Trilinos_ENABLE_ShyLU_DDFROSch:BOOL=ON \
      -D Trilinos_ENABLE_STKUnit_tests:BOOL=ON \
      -D Trilinos_ENABLE_STKIO:BOOL=ON \
      -D Trilinos_ENABLE_STKMesh:BOOL=ON \
      -D Trilinos_ENABLE_Stokhos:BOOL=OFF \
      -D Trilinos_ENABLE_Stratimikos:BOOL=ON \
      -D Trilinos_ENABLE_Teko:BOOL=ON \
      -D Trilinos_ENABLE_Teuchos:BOOL=ON \
      -D Trilinos_ENABLE_Thyra:BOOL=ON \
      -D Trilinos_ENABLE_ThyraTpetraAdapters:BOOL=ON \
      -D Trilinos_ENABLE_ThyraEpetraAdapters:BOOL=ON \
      -D Trilinos_ENABLE_Tpetra:BOOL=ON \
      -D Trilinos_ENABLE_TrilinosCouplings:BOOL=ON \
      -D Trilinos_ENABLE_TriKota:BOOL=ON \
      -D Trilinos_ENABLE_Zoltan:BOOL=ON\
      -D Trilinos_ENABLE_Zoltan2:BOOL=ON\
      -D Zoltan_ENABLE_ULONG_IDS:BOOL=OFF \
      -D ZOLTAN_BUILD_ZFDRIVE:BOOL=OFF \
      -D Zoltan2_ENABLE_Experimental:BOOL=ON\
      -D Trilinos_ENABLE_DEBUG:BOOL=OFF \
\
      -D Phalanx_ENABLE_TEUCHOS_TIME_MONITOR:BOOL=ON \
      -D Stratimikos_ENABLE_TEUCHOS_TIME_MONITOR:BOOL=ON \
      -D Tempus_ENABLE_TEUCHOS_TIME_MONITOR:BOOL=ON \
      -D Phalanx_KOKKOS_DEVICE_TYPE:STRING="SERIAL" \
      -D Phalanx_INDEX_SIZE_TYPE:STRING="INT" \
      -D Phalanx_SHOW_DEPRECATED_WARNINGS:BOOL=OFF \
\
      -D Trilinos_ENABLE_SCOREC:BOOL=ON \
      -D TPL_ENABLE_ParMETIS:STRING=ON \
      -D ParMETIS_INCLUDE_DIRS:PATH=${PARMETISROOT}/include \
      -D ParMETIS_LIBRARY_DIRS:PATH=${PARMETISROOT}/lib \
      -D Tpetra_INST_INT_LONG_LONG:BOOL=ON \
      -D Tpetra_INST_INT_INT:BOOL=OFF \
      -D Tpetra_INST_INT_LONG:BOOL=OFF \
\
      -D Trilinos_ENABLE_Tempus:BOOL=ON \
      -D Tempus_ENABLE_TESTS:BOOL=OFF \
      -D Tempus_ENABLE_EXAMPLES:BOOL=OFF \
      -D Tempus_ENABLE_EXPLICIT_INSTANTIATION:BOOL=ON \
\
      -D TPL_ENABLE_MOAB:BOOL=OFF \
      -D TPL_ENABLE_Libmesh:BOOL=OFF \
      -D TPL_Netcdf_PARALLEL:BOOL=OFF \
\
      -D Trilinos_ENABLE_CXX11:BOOL=ON \
      -D TPL_FIND_SHARED_LIBS:BOOL=ON \
      -D BUILD_SHARED_LIBS:BOOL=ON \
      -D Trilinos_LINK_SEARCH_START_STATIC:BOOL=OFF \
      -D MPI_EXEC=mpiexec \
\
      -D Phalanx_ALLOW_MULTIPLE_EVALUATORS_FOR_SAME_FIELD:BOOL=ON \
       ..
#
#      -D Trios_ENABLE_XDMF:BOOL=OFF \
#
# Optional build capabilities:
# (1) TriKota is a Trilinos package that builds the
#     Dakota libraries, for optimization and UQ. See
#     TriKota web page for how to unpack Dakota.
#
#        -D Trilinos_ENABLE_TriKota:BOOL=ON \
#
# (2) These 6 lines regarding  SEACAS/netcdf  are needed
#     for reading exodus meshes, but require an
#     installed netcdf. Also used for Pamgen meshes.
#        -D Trilinos_ENABLE_SEACAS:BOOL=ON \
#        -D Trilinos_ENABLE_Pamgen:BOOL=ON \
#        -D TPL_ENABLE_Netcdf:BOOL=ON \
#        -D TPL_Netcdf_INCLUDE_DIRS:PATH=/home/agsalin/install/netcdf-4.0.1/include \
#        -D Netcdf_LIBRARY_DIRS:PATH=/home/agsalin/install/netcdf-4.0.1/lib \

#      -D Trilinos_EXTRA_REPOSITORIES="preCopyrightTrilinos" \
#      -D Trilinos_ENABLE_MueLu:BOOL=ON \
#      -D TPL_ENABLE_BLAS=ON \
#      -D BLAS_LIBRARY_NAMES:STRING="openblas" \
#      -D BLAS_LIBRARY_DIRS:PATH=${OPENBLAS_ROOT} \
#      -D BLAS_INCLUDE_DIRS:PATH=${OPENBLAS_ROOT} \
#      -D HAVE_CXX_PRAGMA_WEAK:BOOL=OFF \
#\
#      -D Trilinos_EXTRA_REPOSITORIES="DataTransferKit" \
#      -D Trilinos_ENABLE_DataTransferKit:BOOL=ON \
#      -D DataTransferKit_ENABLE_DBC:BOOL=ON \
#      -D DataTransferKit_ENABLE_TESTS:BOOL=OFF \
#      -D DataTransferKit_ENABLE_EXAMPLES:BOOL=OFF \

