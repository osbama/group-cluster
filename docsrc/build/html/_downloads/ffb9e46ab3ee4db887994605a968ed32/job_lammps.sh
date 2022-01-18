#!/bin/bash -l

################### LAMMPS Job Batch Script Example ###################
# Section for defining queue-system variables:
#-------------------------------------
# This script asks for Triumphant Coal and 64 cores .  
# Runtime for this job is 59 minutes; syntax is hh:mm:ss.
#-------------------------------------
# SLURM-section
## Select triumphant-coal
#SBATCH --partition=triumphant-coal
## 64 Threads
#SBATCH --ntasks=64
##Name of the job
#SBATCH --job-name=vasp_runex
##Two ours
#SBATCH --time=02:00:00
## asks SLURM to send the USR1 signal 10 minutes before the end of the time limit
#SBATCH --signal=B:USR1@600
##Log
#SBATCH --output=vasp_runex.log

######################################
# Section for defining job variables and settings:

# We load all the default program system settings with module load:

module --quiet purge
module load nvhpc/21.3 triumphant-coal/lammps/pgi/git-110621
# You may check other available versions with "module avail VASP"


#Don't forget to set this to 1, if you do not setup your run for OMP parallelization! 
export OMP_NUM_THREADS=1

# A unique file tag for the created files
file_tag=$( date +"%d%m%y-%H%M" )

# Define and create a unique scratch directory for this job
SCRATCH_DIRECTORY=/scratch/${USER}/${SLURM_JOBID}.$file_tag
mkdir -p ${SCRATCH_DIRECTORY}
cd ${SCRATCH_DIRECTORY}

# You can copy everything you need to the scratch directory
# ${SLURM_SUBMIT_DIR} points to the path where this script was submitted from
cp ${SLURM_SUBMIT_DIR}/* ${SCRATCH_DIRECTORY}


######################################
# Running the job


# define the handler function
# note that this is not executed here, but rather
# when the associated signal is sent
cleanup_function()
{
        cd ${SCRATCH_DIRECTORY}
        echo "function your_cleanup_function called at $(date)"
        tar cvf ${SLURM_SUBMIT_DIR}/results-${SLURM_JOBID}-$file_tag.tar *
}

# call cleanup_function once we receive USR1 signal
trap 'cleanup_function' USR1



echo "starting calculation at $(date)"

# Running the program:
# the "&" after the compute step and "wait" are important
mpirun lmp -in _your_input_file_ &
wait

echo "Job finished at"
date
cleanup_function
################### Job Ended ###################
exit 0
