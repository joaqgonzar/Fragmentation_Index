# Fragmentation_Index
Matlab routines to assess the instabilities of sleep and wake states by means of a fragmentation index, as described in Mondino et al. (2020),"Glutamatergic neurons in the preoptic hypothalamus promote wakefulness, destabilize NREM sleep, suppress REM sleep, and regulate cortical dynamics | bioRxiv" available at https://www.jneurosci.org/content/41/15/3462.abstract

## Fragmentation_index_example.m
To start, run the Fragmentation_index_example.m. The first sub-routine loads the example (SleepScore_example.mat), containing the sleep scoring of a single mice in the control and CNO condition. The scorings were made employing a 5 sec epoch for a total of 6 hours. 3 states were classified: Wake, NREM and REM. After loading the example, the hypnograms are plotted and the fragmentation index is calculated calling the Fragmentation_index.m function. After the main analysis is performed, there is a plotting routine to compare the control to the CNO example.

## Fragmentation_index.m
The routine described above calls the core function Fragmentation_index.m, which receives as inputs the sleep scoring and the state whose instability or fragmentation is going to be calculated. For a definition of the Fragmentation_Index, see https://www.jneurosci.org/content/41/15/3462.abstract

### Author
Joaquin Gonzalez, 2020.
