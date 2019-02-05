#!/bin/bash
#SBATCH --job-name=small-test-cluster      # Job name
#SBATCH --mail-type=END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=tmorton@ufl.edu    # Where to send mail    
#SBATCH --ntasks=128                  # Number of MPI ranks
#SBATCH --cpus-per-task=1            # Number of cores per MPI rank 
#SBATCH --distribution=cyclic:cyclic # Distribute tasks cyclically on nodes and sockets
#SBATCH --mem-per-cpu=4gb          # Memory per processor
#SBATCH --time=24:00:00              # Time limit hrs:min:sec
#SBATCH --output=slurm/small-test-cluster_%j.log     # Standard output and error log

source activate isochrones

export OMPI_MCA_pml="ob1"

srun --mpi=pmix_v1 python /home/tmorton/repositories/isochrones/scripts/clusterfit.py small-test-cluster.h5 --props parallax --nlive 1280 --minq 0.5
