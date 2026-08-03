---
layout: default
title: Mobile Robotics, Monsoon 2026
---

<nav class="toc" markdown="1">
- [Overview](#overview)
- [Logistics](#logistics)
- [Schedule](#schedule)
- [Grading](#grading)
- [Important dates](#important-dates)
- [Project](#project)
- [Policies](#policies)
- [References](#references)
</nav>

## Overview

Mobile Robotics covers the geometry and estimation a robot needs to build a map and
localise itself in it. The course runs from rigid body transforms through LIDAR mapping,
point cloud registration, pose graph optimization, camera modelling, two view geometry,
bundle adjustment, and stereo. Assignments and the project are code, not derivation
write-ups: the derivations happen in class so that the code you write afterwards is
something you can debug.

Prerequisite: linear algebra and probability, plus enough Python to handle numpy and a
point cloud library. Some math revision is scheduled mid-course (least squares, SVD,
Levenberg-Marquardt) because everything after ICP depends on it.

### Instructor

K. Madhava Krishna.

### Teaching assistants

Tarun Ramakrishnan, Krish Pandya, Akash Kumbar.

## Logistics

Lectures: Mondays and Thursdays, 2:05 PM to 2:30 PM.

Slides, class notes and recordings are on Moodle. Resources in the schedule without a link
are the file names as they appear there. Links point to public material.

<div class="table-wrap" markdown="1">

| Channel | Use it for |
| --- | --- |
| Moodle announcements | Deadline changes, room changes, material uploads |
| TA office hours | Assignment debugging, project scoping. Slots announced on Moodle |
| Email | Anything personal: extensions, medical, grade queries |

</div>

## Schedule

Topics per lecture are a plan, not a contract. Rows shift when a derivation takes longer
than the slot allows, and the last lecture is the one that gets dropped when they do.

<div class="table-wrap schedule" markdown="1">

| # | Date | Unit | Topic | Resources |
| --- | --- | --- | --- | --- |
| 1 | Jul 30 | Introduction | Course outline, what a mobile robot has to estimate, sensor suite and how each sensor fails | Introduction Slides |
| 2 | Aug 3 | Coordinate transforms | Frames, rotation matrices, translation, homogeneous transforms | Coordinate Transforms; Craig, ch. 2 |
| 3 | Aug 6 | Coordinate transforms | Rotation matrix derivation in vector form, rotation about an arbitrary axis | Rotation Matrix Derivation Vector Form; RotationAribitraryAxis |
| 4 | Aug 10 | Coordinate transforms | Euler angle conventions, worked examples, gimbal lock | Euler Examples; Gimbal Lock PDF and video |
| 5 | Aug 13 | Coordinate transforms | Quaternions, axis-angle, conversion between representations | Quaternion And Euler Angles; RotationMatrixAxisAngleConversion; [Sola, quaternion kinematics](https://arxiv.org/abs/1711.02508) |
| 6 | Aug 17 | Coordinate transforms | Frame conventions in practice: gripper contact frames, ECEF and ENU | More On Coordinate Frames; Gripper Contact Frames; ECF-ENU Transform |
| 7 | Aug 20 | Mapping with point clouds | LIDAR measurement geometry, accumulating points from scans and poses | LIDAR Point Accumulation; LIDAR Point Mapping/Accumulation Lecture Slides |
| 8 | Aug 24 | Mapping with point clouds | Occupancy grids from range data, inverse sensor model, log-odds update | Occupancy Maps from LIDAR Data; Occupancy Mapping Class Notes |
| 9 | Aug 27 | Mapping with point clouds | Dynamic obstacles in occupancy maps, obstacle avoidance on the resulting grid | Occupancy Mapping Dynamic Obstacles; Occupancy Mapping Obstacle Avoidance Video; Dynamic Obstacle Occupancy Map Video |
| 10 | Aug 31 | Mapping with point clouds | 3D map representations: voxel grids, octrees, TSDF, meshes | Mapping Representations; 3D Mapping Lecture Video; [OctoMap](https://octomap.github.io/) |
| 11 | Sep 3 | Math revision | Linear least squares, normal equations, weighting and covariance | Linear And Non Linear Least Squares |
| 12 | Sep 7 | Math revision | Nonlinear least squares, Gauss-Newton, Levenberg-Marquardt | NLS Solved Example; The LM Algorithm |
| 13 | Sep 10 | Math revision | SVD, pseudo-inverse, homogeneous systems and constrained least squares | SVD-ClassNotes; SVD-ClassNotesContd |
| 14 | Sep 14 | ICP | Registration problem, correspondence search, the ICP loop and when it diverges | ICP-Intro; ICP Introduction NPTEL PPT |
| 15 | Sep 17 | ICP | Closed-form point-to-point solution by SVD, full derivation | ICP-SVD-Derivation; ICP Derivation Last Bits |
| 16 | Sep 21 | ICP | Variants, outlier rejection, LIDAR to camera calibration posed as registration | LIDAR-Camera Calibration; [Open3D ICP tutorial](https://www.open3d.org/docs/release/tutorial/pipelines/icp_registration.html) |
| | Sep 24 | | <span class="exam">Mid-semester exam</span> | |
| 17 | Sep 28 | Point cloud SLAM | ICP odometry, error accumulation, why open-loop trajectories drift | ICP SLAM |
| 18 | Oct 1 | Point cloud SLAM | Loop closure detection, building the pose graph, information matrices | Loop Closure and Pose Graph Optimization |
| 19 | Oct 5 | Point cloud SLAM | Solving the pose graph with Ceres, parameterizing rotations for the solver | Ceres Tutorial PPT; Ceres Tutorial Code; [Ceres pose graph example](http://ceres-solver.org/nnls_tutorial.html) |
| 20 | Oct 8 | Camera modelling | Image formation, the pinhole model, perspective projection | Image Formulation; Pin Hole Camera |
| 21 | Oct 12 | Camera modelling | Intrinsics, extrinsics, the 3x4 projection matrix | Camera Modelling Class Notes; CameraProjection |
| 22 | Oct 15 | Camera modelling | Lens distortion, alternative derivations of the projection model | Camera Modelling NPTEL Slides; Camera Modelling and Other NPTEL Stuff |
| 23 | Oct 19 | Camera modelling | Monocular reconstruction, scale ambiguity, drone based car reconstruction | Monocular Reconstruction; Drone Based Car Reconstruction |
| 24 | Oct 22 | Camera calibration | Homogeneous coordinates, homogenizing the pixel coordinate system | Homogenous Coordinate System; Homogenizing the pixel coordinate system |
| 25 | Oct 26 | Camera calibration | DLT, decomposing P into K, R and t, calibration in practice | Camera Calib NPTEL Slides; Camera Calib Stachniss Slides; [OpenCV calibration](https://docs.opencv.org/4.x/dc/dbb/tutorial_py_calibration.html) |
| 26 | Oct 29 | Two view geometry | Resection, the epipolar constraint, essential and fundamental matrices | Resection and Introduction to Epipolar Geometry; Hartley and Zisserman, ch. 9 |
| 27 | Nov 2 | Two view geometry | Eight point algorithm, normalization, recovering pose from E | 8 Point Algorithm and Reconstruction; Hartley and Zisserman, ch. 11 |
| 28 | Nov 5 | Two view geometry | Triangulation, detecting moving objects from epipolar violations | Moving Object Detection Paper |
| 29 | Nov 9 | Bundle adjustment | Reprojection error, Jacobian sparsity, the Schur complement, visual SLAM backends | BA or Backend for Visual SLAM; [Ceres bundle adjustment example](http://ceres-solver.org/nnls_tutorial.html#bundle-adjustment) |
| 30 | Nov 12 | Stereoscopy | Stereo geometry, disparity, depth from a calibrated pair | Stereo Geometry |
| 31 | Nov 16 | Stereoscopy | Rectification, correspondence along scanlines, dense stereo | Rectification for Stereo Class Notes; Stereo Rectification CMU Notes |
| 32 | Nov 19 | Learned reconstruction | Time permitting. Feed-forward pointmap and pose regression: DUSt3R and MASt3R, VGGT, VGGT-Omega, D4RT. Where the geometry from the rest of the course sits inside these models, and what they still get wrong | [MASt3R](https://github.com/naver/mast3r); [VGGT](https://github.com/facebookresearch/vggt) |

</div>

## Grading

<div class="table-wrap" markdown="1">

| Component | Weight |
| --- | --- |
| Assignments | 20% |
| Mid-semester exam | 15% |
| End-semester exam | 25% |
| Project | 40% |

</div>

Project weight splits as follows.

<div class="table-wrap" markdown="1">

| Project component | Weight |
| --- | --- |
| Timeline document | 5% |
| Mid submission | 15% |
| Final submission and demo | 20% |

</div>

## Important dates

<div class="table-wrap" markdown="1">

| Item | Date |
| --- | --- |
| Assignment 1 released | Aug 13 |
| Assignment 1 due | Aug 27 |
| Project timeline document due | Sep 3 |
| Mid-semester exam | Sep 24 |
| Project mid submission due | Sep 28 |
| Assignment 2 released | Oct 5 |
| Assignment 2 due | Oct 19 |
| Assignment 3 released | Oct 29 |
| Assignment 3 due | Nov 12 |
| Final project submission due | Nov 23 |
| Project demos | Nov 26 |
| End-semester exam | TBD |

</div>

## Project

Teams of three to four. The project runs the whole semester and is submitted in three
parts on Moodle: a timeline document, a mid submission, and a final submission with a
demo.

The timeline document fixes what you are building, the dataset or robot you are building
it on, and who does what by when. Pick a problem where you can show a metric, not a video
alone: trajectory error against ground truth, map consistency after loop closure,
reprojection error before and after bundle adjustment, disparity error on a stereo
benchmark.

Bring your own problem if you have one. A topic you found yourself, in a lab, in a paper
you liked, or on a robot you already work with, is preferred over anything on the list
below. The list exists so that nobody is stuck without a starting point.

Aim the final submission at a venue. A semester is enough to get a workshop paper or a
short paper out of a good project, and past projects have grown into ICRA, IROS, RA-L and
CVPR or ICCV workshop submissions. If that is the target, say so in the timeline document
and pick the evaluation protocol the venue expects (a public benchmark, a named metric,
ablations against a baseline) from day one rather than adding it in November. The TAs will
read drafts.

Starting points:

- LIDAR odometry and mapping on a public sequence, with loop closure and pose graph optimization.
- Occupancy mapping with dynamic obstacle handling, evaluated against a labelled sequence.
- LIDAR to camera calibration, including an error analysis of how the estimate degrades with fewer correspondences.
- Monocular visual odometry with scale recovery from a known constraint.
- Structure from motion on a small image set, ending in bundle adjustment.
- Dense stereo depth, comparing block matching against a learned baseline.
- Moving object detection from epipolar geometry in a driving sequence.

Anything else is fine if it uses the geometry taught here. Clear it with a TA before the
timeline document is due.

## Policies

Late submissions: each student has three late days for the semester, usable on
assignments in whole-day units. Once they run out, late work loses 20% per day and is not
accepted after three days. Project deadlines do not take late days.

Collaboration: discuss ideas with anyone. Write your own code and your own text.
Copying code from a classmate, a previous year's submission, or an unattributed online
source counts as plagiarism. Using a library is fine and using a model to write code is
fine, provided you cite it in the README and you can explain every line in a viva.

Grade queries: raise them within one week of the grade being published, to the TA who
graded the component.

## References

Books:

- J. J. Craig, Introduction to Robotics: Mechanics and Control. Frames and transforms.
- R. Hartley and A. Zisserman, [Multiple View Geometry in Computer Vision](https://www.robots.ox.ac.uk/~vgg/hzbook/). Camera models, two view geometry, bundle adjustment.
- S. Thrun, W. Burgard and D. Fox, [Probabilistic Robotics](https://mitpress.mit.edu/9780262303804/probabilistic-robotics/). Occupancy mapping and SLAM.
- R. Szeliski, [Computer Vision: Algorithms and Applications](https://szeliski.org/Book/). Image formation, stereo, structure from motion.

Lecture series:

- Cyrill Stachniss, [Mobile Sensing and Robotics, Photogrammetry and SLAM lectures](https://www.youtube.com/@CyrillStachniss). Occupancy mapping, ICP, pose graph optimization, camera calibration and bundle adjustment are all covered there with the same notation used in class.
- NPTEL lectures on camera modelling and ICP, linked per lecture in the schedule.

Software:

- [Ceres Solver](http://ceres-solver.org/) for nonlinear least squares, pose graphs and bundle adjustment.
- [g2o](https://github.com/RainerKuemmerle/g2o) as an alternative graph optimization backend.
- [Open3D](https://www.open3d.org/) for point cloud IO, registration and visualization.
- [OpenCV](https://opencv.org/) for calibration, feature matching and stereo.

Datasets:

- [KITTI](https://www.cvlibs.net/datasets/kitti/) for LIDAR, stereo and odometry ground truth.
