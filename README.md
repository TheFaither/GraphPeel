# GraphPeel

## Current state of the manuscript
- Link to the manuscript: https://drive.google.com/open?id=1FpiwAzqpqrZJVURL-U86zUIr2W5Hc0Cx&authuser=daniele.liprandi%40unitn.it&usp=drive_fs
- In Chapter 2, the adhesive energy between two graphene layers is obtained by applying common peeling equations to different scenarios, which differ for the separation length between the graphene layers. 
- In chapter 3, a vertical displacement is applied to the edge of a graphite layer adherent to a graphene substrate.
    - Here, the first major hiccup of the manuscript is found. Currently, the depth of the substrate is insufficient. This is visible from Figure 10, Figure 11, and page 11. The depth of the substrate, and generally speaking the dimensions of the sample, need to be increased. According to the last meeting regarding this work, this is the first point that needs to be solved, and could potentially already lead to a publishable manuscript

## Current state of the code

- The code provided here is not the manuscript version, i.e. the one being used to obtain and analyze the data appearing in the manuscript. 
- The manuscript version is completely lost. Dr. Azzolini tried to recover it using a multitude of hard disk repair tools, but none of them worked.
- The last version which Dr. Azzolini was able to recover was at least 2-3 months older than the manuscript version.
- This last version was not working, i.e., critical errors were appearing.
- The major differences are:
    - The geometry description and analysis is here made using a matlab code, while in the manuscript version the code is python based
    - The forementioned python code was a much more generalized code, able to quickly change between different geometries and case studies
    - Region and atom groups definition are different

### Updates by me (Daniele Liprandi)
- I was able to apply some bug fixing and obtain a working code
- I was not able to update the code provided in this repository in such a way that the figures presented in the manuscript can be obtained. 
- Comments have been introduced in the code

## Folders description

### 0_GenerazioneStrutture
Matlab codes used to define the geometries 

### 1_Layer_termalizzazione
Graphene thermalizing, using as the main LAMMPS code "relax_AC_Young.input"

### 2_misura_en_adesione
Thermalization of the structure with layers at different heights, used to evaluate the adhesion energy. The analysis is conducted using a Matlab code
- :warning: According to Martina Azzolini, the code used here is completely different from the one used to write the manuscript. The final analysis was conducted using a python script

### 3_Codici_LAMMPS_percalcolatore
Input for the peeling simulation

## External folders
Both folders can be found at the following link, available to anyone with a Unitn account: https://drive.google.com/drive/folders/1j2ZlnaPo9AKaRv_ZeSE4YpiFatS2Xbzb?usp=sharing

### 4_Analisi_simulazionivelocità
Peeling simulation analysis

### manuscript
Draft of the manuscript originally written by Martina Azzolini
