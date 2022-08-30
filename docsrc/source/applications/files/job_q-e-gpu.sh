#!/bin/bash -l

################### Quantum Espresso Job Batch Script Example ###################
# Section for defining queue-system variables:
#-------------------------------------
# This script asks for Just Read The Instructions and 64 cores .
# Runtime for this job is 59 minutes; syntax is hh:mm:ss.
#-------------------------------------
# SLURM-section
## Select Just Read The Instructions
#SBATCH --partition=JRTI
## Reserve the node for the GPU
#SBATCH --ntasks=96
##Name of the job
#SBATCH --job-name=q-e_ex-gpu
##one hour
#SBATCH --time=01:00:00
## asks SLURM to send the USR1 signal 10 minutes before the end of the time limit
#SBATCH --signal=B:USR1@600
##The name of the log file (you can see the progress of your job here)
#SBATCH --output=q-e_ex-gpu.log

###########################################################
# This section is for defining job variables and settings
# that needs to be defined before running the job
###########################################################

#name of the input file
input_file="in.qe-example-pw"
#name of the output file
output_file="out.qe-example-pw"

# For the efficient use of GPU/CPU hybrid use a K point parallelization, and openMP threads
qe_executable="pw.x -npool 1 -ndiag 1 -ntg 1 -inp "
export OMP_NUM_THREADS=64

# We load all the default program system settings with module load:

module --quiet purge
module load nvhpc/22.7 JRTI/Q-E/nvhpc/git280822-nvhpc22.7-gpu
# You may check other available versions with "module avail q-e"


# A unique file tag for the created files
file_tag=$( date +"%d%m%y-%H%M" )

# Define and create a unique local scratch directory for this job. Remember, this will
# make your job run  much faster!
SCRATCH_DIRECTORY=/scratch/${USER}/${SLURM_JOBID}.$file_tag
mkdir -p ${SCRATCH_DIRECTORY}
cd ${SCRATCH_DIRECTORY}

# You can copy everything you need to the scratch directory
# ${SLURM_SUBMIT_DIR} points to the path where this script was submitted from
rsync -arp ${SLURM_SUBMIT_DIR}/ .


#############################################################################
# This section is about collecting the results from the local scratch back to
# where the job was run. Make sure that you have enough quota, if you want to
# collect the wave functions as well!
#############################################################################


# define the handler function
# note that this is not executed here, but rather
# when the associated signal is sent
cleanup_function()
{
        cd ${SCRATCH_DIRECTORY}
        echo "function cleanup_function called at $(date)"
        tar cvf results-${SLURM_JOBID}-$file_tag.tar *
        gzip  results-${SLURM_JOBID}-$file_tag.tar
        du -sh results-${SLURM_JOBID}-$file_tag.tar.gz
        mv results-${SLURM_JOBID}-$file_tag.tar.gz ${SLURM_SUBMIT_DIR}
}

# call cleanup_function once we receive USR1 signal
trap 'cleanup_function' USR1

###############################################################################
# This section actually runs the job. It needs to be after the previous two
# sections
#################################################################################

echo "starting calculation at $(date)"

# First, let's go to the local scratch directory
cd ${SCRATCH_DIRECTORY}

# Running the program:
# the "&" after the compute step and "wait" are important for the cleanup process
# the "tee" is used to mirror the output to the slurm output, so that you can follow
# the job progress more easily
run_line="mpirun -np 1 ${qe_executable} ${input_file} |tee ${output_file} &"
echo $run_line
eval $run_line
wait

echo "Job finished at"
date
cleanup_function
################### Job Ended ###################
exit 0
