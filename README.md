# Trajectory Planning in MATLAB

This is an application with Matlab GUI written for a Trajectory Planning in Operative Space. The application is developed as a Project in the Robotic course at University of Basilicata, School of Engineering.

## Problem

We have been assigned an application capable of starting the trajectory on the assigned route within the Operational Space. For each point of the route, as input data we have:

- Location;
- Orientation;
- Sequence of travel times for each section.

For the representation of the orientation we had to use Rotation Matrix. Finally, as a geometric path primitive for the position, we had to use a Segment.

## Application Overwiew

The developed project includes two applications in the MATLAB environment for planning trajectories, assigned position and rotation iof the path points in the operational space. First of all, a Command Line Interface (CLI) version was designed to test the code and ball the algorithms developed by us. Subsequently, a Graphical User Interface (GUI) was designed to allow the user to enter the necessary data quickly and intuitively. Furthermore, it was easier to check and visually inspect the data.

### How to use

To use the Command Line version, go to the CLI folder and start the trajectoryPlanning.m script. To use the Graphical Interface, you need to start the trajectoryPlanning.mlapp file in the GUI folder. The functions for calculating the trajectory and for plotting the data are exactly the same for both versions.

### Graphical User Interface

The approach used is to have the user enter files with the .mat extension containing the variables and data on positions, travel times and rotation matrices. We chose this approach as the simplest, and it is the one that fully exploits the potential of the MATLAB environment. These files with the .mat extension can be opened and modified in the environment itself, as in figure below. 

![alt text](https://github.com/xN1ckuz/Trajectory-Planning/blob/main/Results/data.png)

In this way, we avoided the user to enter data in an inconvenient way within the GUI. The user will only have to prepare the data before inserting into our application. The graphical interface of the application is shown in figure below.

![alt text](https://github.com/xN1ckuz/Trajectory-Planning/blob/main/Results/gui.png)

In the top left square it is possible to insert the .mat files concerning the position data and travel times. Instead, the file for the rotation matrices is inserted in the lower left square. In the upper box, there is a label that updates based on the progress of the operations. Once the data has been entered, it appears in the two respective boxes on the right, in the form of a table. If the entered data is correct, the "Generate Trajectory" button is activated, with which the user can plan the trajectory. Post-calculation, in addition to updating the label, the key "Generate Graphs" is activated; by pressing the button, two windows are opened; in the first there is an animated simulation of the trajectory, in the second the trend over time of the variables of interest. The final result is shown in figure below.

![alt text](https://github.com/xN1ckuz/Trajectory-Planning/blob/main/Results/simulation.png)
