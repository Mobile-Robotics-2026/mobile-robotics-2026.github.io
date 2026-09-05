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
Levenberg-Marquardt).

### Instructor

<div class="person" markdown="1">

<div class="person-text" markdown="1">
[K. Madhava Krishna](https://robotics.iiit.ac.in/faculty_mkrishna/), Robotics Research
Center, IIIT Hyderabad. Office hours by appointment.
</div>

<img class="person-photo" src="/assets/img/madhava-krishna.jpg" alt="K. Madhava Krishna">

</div>

### Teaching assistants

[Tarun Ramakrishnan](https://scholar.google.com/citations?user=wqTCR1sAAAAJ&hl=en),
[Krish Pandya](https://mostlykiguess.github.io/),
[Akash Kumbar](https://akash-kumbar.github.io/).

## Logistics

Lectures: Mondays and Thursdays, 2:05 PM to 2:30 PM.

Slides, class notes and some resources will be on Moodle.

<div class="table-wrap" markdown="1">

| Channel | Use it for |
| --- | --- |
| Moodle announcements | Deadline changes, room changes, material uploads |
| TA office hours | Assignment debugging, project scoping. Timings will be announced on Moodle |
| Email | Anything personal: extensions, medical, grade queries |

</div>

## Schedule

Topics per lecture are tentative. Rows might shift when a derivation takes longer
than the slot allows.

<div class="table-wrap schedule" markdown="1">

| # | Date | Unit | Topic | Resources |
| --- | --- | --- | --- | --- |
| 1 | Jul 30 | Introduction | Course outline, what a mobile robot has to estimate, sensor suite and how each sensor fails | Introduction Slides; [Stachniss, mobile robotics online training](https://www.ipb.uni-bonn.de/online-training-robotics/) |
| 2 | Aug 3 | Coordinate transforms | Frames, rotation matrices, translation, homogeneous transforms | Coordinate Transforms; Craig, ch. 2 |
| 3 | Aug 6 | Coordinate transforms | Rotation matrix derivation in vector form, rotation about an arbitrary axis | Rotation Matrix Derivation Vector Form; RotationAribitraryAxis |
| 4 | Aug 10 | Coordinate transforms | Euler angle conventions, worked examples, gimbal lock | Euler Examples; Gimbal Lock PDF and video; [Euler angles and gimbal lock, GuerrillaCG](https://www.youtube.com/watch?v=zc8b2Jo7mno) |
| 5 | Aug 13 | Coordinate transforms | Quaternions, axis-angle, conversion between representations | Quaternion And Euler Angles; RotationMatrixAxisAngleConversion; [Sola, quaternion kinematics for the error-state Kalman filter](https://arxiv.org/abs/1711.02508) |
| 6 | Aug 17 | Coordinate transforms | Frame conventions in practice: gripper contact frames, ECEF and ENU | More On Coordinate Frames; Gripper Contact Frames; ECF-ENU Transform |
| 7 | Aug 20 | Mapping with point clouds | LIDAR measurement geometry, accumulating points from scans and poses | LIDAR Point Accumulation; LIDAR Point Mapping/Accumulation Lecture Slides; [KITTI raw data](https://www.cvlibs.net/datasets/kitti/raw_data.php) |
| 8 | Aug 24 | Mapping with point clouds | Occupancy grids from range data, inverse sensor model, log-odds update | Occupancy Maps from LIDAR Data; Occupancy Mapping Class Notes; [Stachniss, occupancy grid maps](https://www.youtube.com/watch?v=v-Rm9TUG9LA) |
| 9 | Aug 27 | Mapping with point clouds | Dynamic obstacles in occupancy maps, obstacle avoidance on the resulting grid | Occupancy Mapping Dynamic Obstacles; Occupancy Mapping Obstacle Avoidance Video; Dynamic Obstacle Occupancy Map Video |
| 10 | Aug 31 | Mapping with point clouds | 3D map representations: voxel grids, octrees, TSDF, meshes | Mapping Representations; 3D Mapping Lecture Video; [OctoMap](https://octomap.github.io/) |
| 11 | Sep 3 | Math revision | Linear least squares, normal equations, weighting and covariance | Linear And Non Linear Least Squares; [Stachniss, least squares](https://www.youtube.com/watch?v=yVd-QDy0K6k) |
| 12 | Sep 7 | Math revision | Nonlinear least squares, Gauss-Newton, Levenberg-Marquardt | NLS Solved Example; The LM Algorithm; [Madsen, Nielsen and Tingleff, methods for non-linear least squares](http://www2.imm.dtu.dk/pubdb/edoc/imm3215.pdf) |
| 13 | Sep 10 | Math revision | SVD, pseudo-inverse, homogeneous systems and constrained least squares | SVD-ClassNotes; SVD-ClassNotesContd |
| 14 | Sep 14 | ICP | Registration problem, correspondence search, the ICP loop and when it diverges | ICP-Intro; ICP Introduction NPTEL PPT; [Stachniss, ICP with unknown data association](https://www.youtube.com/watch?v=ktRqKxddjJk) |
| 15 | Sep 17 | ICP | Closed-form point-to-point solution by SVD, full derivation | ICP-SVD-Derivation; ICP Derivation Last Bits; [IPB Bonn, ICP point cloud alignment slides](https://www.ipb.uni-bonn.de/html/teaching/msr2-2020/sse2-03-icp.pdf) |
| 16 | Sep 21 | ICP | Variants, outlier rejection, LIDAR to camera calibration posed as registration | LIDAR-Camera Calibration; [Rusinkiewicz and Levoy, efficient variants of ICP](https://www.cs.princeton.edu/~smr/papers/fasticp/fasticp_paper.pdf); [Open3D ICP tutorial](https://www.open3d.org/docs/release/tutorial/pipelines/icp_registration.html) |
| | Sep 24 | | <span class="exam">Mid-semester exam</span> | |
| 17 | Sep 28 | Point cloud SLAM | ICP odometry, error accumulation, why open-loop trajectories drift | ICP SLAM; [slambook-en, ch. 9.1, sliding window](https://github.com/gaoxiang12/slambook-en) |
| 18 | Oct 1 | Point cloud SLAM | Loop closure detection, building the pose graph, information matrices | Loop Closure and Pose Graph Optimization; [Grisetti et al., a tutorial on graph-based SLAM](http://ais.informatik.uni-freiburg.de/teaching/ws11/robotics2/pdfs/ls-slam-tutorial.pdf); [Stachniss, graph-based SLAM using pose graphs](https://www.youtube.com/watch?v=uHbRKvD8TWg) |
| 19 | Oct 5 | Point cloud SLAM | Solving the pose graph with Ceres, parameterizing rotations for the solver | Ceres Tutorial PPT; Ceres Tutorial Code; [Ceres pose graph example](http://ceres-solver.org/nnls_tutorial.html); [g2o](https://github.com/RainerKuemmerle/g2o) |
| 20 | Oct 8 | Camera modelling | Image formation, the pinhole model, perspective projection | Image Formulation; Pin Hole Camera; [slambook-en, ch. 4.1, pinhole model and distortion](https://github.com/gaoxiang12/slambook-en) |
| 21 | Oct 12 | Camera modelling | Intrinsics, extrinsics, the 3x4 projection matrix | Camera Modelling Class Notes; CameraProjection; [Stachniss, Photogrammetry I and II playlist](https://www.youtube.com/playlist?list=PLgnQpQtFTOGRYjqjdZxTEQPZuFHQa7O7Y) |
| 22 | Oct 15 | Camera modelling | Lens distortion, alternative derivations of the projection model | Camera Modelling NPTEL Slides; Camera Modelling and Other NPTEL Stuff; [OpenCV camera model](https://docs.opencv.org/4.x/d9/d0c/group__calib3d.html) |
| 23 | Oct 19 | Camera modelling | Monocular reconstruction, scale ambiguity, drone based car reconstruction | Monocular Reconstruction; Drone Based Car Reconstruction |
| 24 | Oct 22 | Camera calibration | Homogeneous coordinates, homogenizing the pixel coordinate system | Homogenous Coordinate System; Homogenizing the pixel coordinate system; Hartley and Zisserman, ch. 2 |
| 25 | Oct 26 | Camera calibration | DLT, decomposing P into K, R and t, calibration in practice | Camera Calib NPTEL Slides; Camera Calib Stachniss Slides; [Stachniss, direct linear transform](https://www.youtube.com/watch?v=3NcQbZu6xt8); [Zhang, a flexible new technique for camera calibration](https://www.microsoft.com/en-us/research/publication/a-flexible-new-technique-for-camera-calibration/); [OpenCV calibration](https://docs.opencv.org/4.x/dc/dbb/tutorial_py_calibration.html) |
| 26 | Oct 29 | Two view geometry | Resection, the epipolar constraint, essential and fundamental matrices | Resection and Introduction to Epipolar Geometry; Hartley and Zisserman, ch. 9; [slambook-en, ch. 6.3, epipolar constraint and essential matrix](https://github.com/gaoxiang12/slambook-en) |
| 27 | Nov 2 | Two view geometry | Eight point algorithm, normalization, recovering pose from E | 8 Point Algorithm and Reconstruction; Hartley and Zisserman, ch. 11; [Hartley, in defence of the eight-point algorithm](https://users.cecs.anu.edu.au/~hartley/Papers/fundamental/fundamental.pdf) |
| 28 | Nov 5 | Two view geometry | Triangulation, detecting moving objects from epipolar violations | Moving Object Detection Paper |
| 29 | Nov 9 | Bundle adjustment | Reprojection error, Jacobian sparsity, the Schur complement, visual SLAM backends | BA or Backend for Visual SLAM; [Triggs et al., bundle adjustment, a modern synthesis](https://hal.science/inria-00548290); [Stachniss, the basics about bundle adjustment](https://www.youtube.com/watch?v=sobyKHwgB0Y); [Ceres bundle adjustment example](http://ceres-solver.org/nnls_tutorial.html#bundle-adjustment) |
| 30 | Nov 12 | Stereoscopy | Stereo geometry, disparity, depth from a calibrated pair | Stereo Geometry; [slambook-en, ch. 4.1.3, stereo cameras](https://github.com/gaoxiang12/slambook-en) |
| 31 | Nov 16 | Stereoscopy | Rectification, correspondence along scanlines, dense stereo | Rectification for Stereo Class Notes; Stereo Rectification CMU Notes; [CMU 16-385, stereo rectification slides](https://www.cs.cmu.edu/~16385/s17/Slides/13.1_Stereo_Rectification.pdf) |
| 32 | Nov 19 | Learned reconstruction | Time permitting. The line from cross-view completion pre-training to feed-forward pointmap and pose regression: CroCo, DUSt3R and MASt3R, VGGT, VGGT-Omega, D4RT. Where the geometry from the rest of the course sits inside these models, and what they still get wrong | [CroCo](https://arxiv.org/abs/2210.10716); [DUSt3R](https://github.com/naver/dust3r); [MASt3R](https://arxiv.org/abs/2406.09756); [VGGT](https://arxiv.org/abs/2503.11651); [VGGT-Omega](https://arxiv.org/abs/2605.15195); [D4RT](https://arxiv.org/abs/2512.08924) |

</div>

## Grading

<div class="table-wrap" markdown="1">

| Component | Weight (Tentative) |
| --- | --- |
| Assignments | 30% |
| Mid-semester exam | 20% |
| End-semester exam | 20% |
| Project | 30% |

</div>

Project weight splits as follows.

<div class="table-wrap" markdown="1">

| Project component | Weight (Tentative) |
| --- | --- |
| Timeline document | 5% |
| Mid submission | 7% |
| Final submission and demo | 18% |

</div>

## Important dates

<div class="table-wrap" markdown="1">

| Item | Date |
| --- | --- |
| Assignment 1 released | Aug 17 |
| Assignment 1 due | Sep 2 |
| Project list released | Sep 5 |
| Project team and preference form due | Sep 12 |
| Project mentors assigned | Sep 14 |
| Project timeline document due | Sep 17 |
| Mid-semester exam | Sep 24 |
| Assignment 2 released | Oct 5 |
| Assignment 2 due | Oct 19 |
| Project mid submission due | Oct 26 |
| Assignment 3 released | Oct 29 |
| Assignment 3 due | Nov 12 |
| Final project submission due | Nov 23 |
| Project demos | Nov 26 |
| End-semester exam | TBD |

</div>

## Project

Teams of two or three. The project runs the whole semester and is submitted in three
parts on Moodle: a timeline document, a mid submission, and a final submission with a
demo.

Twenty four projects are listed on the [project page](/project/), in two groups: fifteen
are much closer to what is taught in course, and the rest 9 sit closer to open research. That page
also carries the dates, the submission format, and how mentors are assigned.

Every team gets a TA mentor. Talk to the TAs before you fill the preference form, tell
them what you want to build, and name a first and second choice of mentor. Where a
project sits closer to a different TA's work than the one you named, we will reassign it
to whoever has the most experience in the topic. Mentors are posted on Sep 14, three
days before the timeline document is due.

The timeline document fixes what you are building, the dataset or robot you are building
it on, and who does what by when. Pick a problem where you can show a metric, not a video
alone: trajectory error against ground truth, map consistency after loop closure,
reprojection error before and after bundle adjustment, disparity error on a stereo
benchmark. Qual & Quant are both important.

Bring your own problem if you have one. A topic you found yourself, in a lab, in a paper
you liked, or on a robot you already work with, is preferred over anything on the list.
The list exists so that nobody is stuck without a starting point.

Aim the final submission at a venue. A semester is enough to get a workshop paper or a
short paper out of a good project, and past projects have grown into ICRA, IROS, RA-L and
CVPR or ICCV workshop submissions. If that is the target, say so in the timeline document
and pick the evaluation protocol the venue expects (a public benchmark, a named metric,
ablations against a baseline) from day one rather than adding it in November. The TAs will
read drafts.

Anything not on the project page is fine if it uses the geometry taught here. Clear it
with a TA before Sep 10, so the mentor assignment can account for it.

## Policies

Late submissions: each student has five late days for the semester, usable on
assignments in whole-day units. Once they run out, late work loses 20% per day and is not
accepted after five days. Project deadlines do not take late days.

Collaboration: discuss ideas with anyone. Write your own code and your own text.
Copying code from a classmate, a previous year's submission, or an unattributed online
source counts as plagiarism. Using a library is fine and using a model to write code is
fine, provided you cite it in the README and you can explain every line in a viva.

Grade queries: raise them within one week of the grade being published, to the TA who
graded the component.

## References

### Books

<ul class="refs" markdown="1">
<li>J. J. Craig, Introduction to Robotics: Mechanics and Control. Frames, rotations and homogeneous transforms, ch. 2.</li>
<li>R. Hartley and A. Zisserman, <a href="https://www.robots.ox.ac.uk/~vgg/hzbook/">Multiple View Geometry in Computer Vision</a>. Camera models, epipolar geometry, triangulation, bundle adjustment. The sample chapters on the book page cover most of what the two view unit needs.</li>
<li>S. Thrun, W. Burgard and D. Fox, <a href="https://mitpress.mit.edu/9780262303804/probabilistic-robotics/">Probabilistic Robotics</a>. Inverse sensor models, occupancy grid mapping, SLAM.</li>
<li>R. Szeliski, <a href="https://szeliski.org/Book/">Computer Vision: Algorithms and Applications</a>. Image formation, stereo, structure from motion. Free PDF on the book page.</li>
<li>X. Gao, T. Zhang, Y. Liu and Q. Yan, <a href="https://github.com/gaoxiang12/slambook-en">14 Lectures on Visual SLAM (slambook-en)</a>. Written for people implementing SLAM: transforms, camera models, feature matching, backend optimization with Ceres and g2o, loop closure. Code is in the repository.</li>
</ul>

### Lectures

<ul class="refs" markdown="1">
<li>Cyrill Stachniss, <a href="https://www.youtube.com/@CyrillStachniss">lecture channel</a> and <a href="https://www.ipb.uni-bonn.de/online-training-robotics/">mobile robotics online training</a>. Occupancy mapping, ICP, pose graph optimization, calibration and bundle adjustment, in notation close to what is used in class.</li>
<li>Cyrill Stachniss, <a href="https://www.youtube.com/playlist?list=PLgnQpQtFTOGRYjqjdZxTEQPZuFHQa7O7Y">Photogrammetry I and II</a>, University of Bonn. Camera modelling, DLT, calibration, bundle adjustment.</li>
<li>Kris Kitani and others, <a href="http://16385.courses.cs.cmu.edu/">16-385 Computer Vision</a>, CMU. Slide decks for two view geometry, rectification and stereo matching.</li>
<li>NPTEL slide decks on camera modelling and ICP, on Moodle.</li>
</ul>

### Papers

<ul class="refs" markdown="1">
<li>J. Sola, <a href="https://arxiv.org/abs/1711.02508">Quaternion kinematics for the error-state Kalman filter</a>, 2017. The reference for quaternion conventions, composition and the exponential map.</li>
<li>K. Madsen, H. B. Nielsen and O. Tingleff, <a href="http://www2.imm.dtu.dk/pubdb/edoc/imm3215.pdf">Methods for Non-Linear Least Squares Problems</a>, DTU lecture notes, 2004. Gauss-Newton and Levenberg-Marquardt, with the damping parameter update rules.</li>
<li>S. Rusinkiewicz and M. Levoy, <a href="https://www.cs.princeton.edu/~smr/papers/fasticp/fasticp_paper.pdf">Efficient Variants of the ICP Algorithm</a>, 3DIM 2001. Sampling, matching, weighting and rejection strategies, compared on convergence speed.</li>
<li>G. Grisetti, R. Kummerle, C. Stachniss and W. Burgard, <a href="http://ais.informatik.uni-freiburg.de/teaching/ws11/robotics2/pdfs/ls-slam-tutorial.pdf">A Tutorial on Graph-Based SLAM</a>, IEEE ITS Magazine, 2010. Pose graph construction and least squares solution.</li>
<li>Z. Zhang, <a href="https://www.microsoft.com/en-us/research/publication/a-flexible-new-technique-for-camera-calibration/">A Flexible New Technique for Camera Calibration</a>, TPAMI 2000. The planar target method behind the OpenCV calibration pipeline.</li>
<li>R. Hartley, <a href="https://users.cecs.anu.edu.au/~hartley/Papers/fundamental/fundamental.pdf">In Defence of the Eight-Point Algorithm</a>, TPAMI 1997. Why normalization decides whether the eight point algorithm works.</li>
<li>B. Triggs, P. McLauchlan, R. Hartley and A. Fitzgibbon, <a href="https://hal.science/inria-00548290">Bundle Adjustment: A Modern Synthesis</a>, 2000. Cost functions, sparsity, gauge freedom, numerical conditioning.</li>
</ul>

### Learned reconstruction

<ul class="refs" markdown="1">
<li>P. Weinzaepfel et al., <a href="https://arxiv.org/abs/2210.10716">CroCo: Self-Supervised Pre-training for 3D Vision Tasks by Cross-View Completion</a>, NeurIPS 2022. Where the line starts: mask one of two views of a scene and reconstruct it from the other, which forces the network to learn correspondence and relative pose. CroCo v2 (ICCV 2023) and the <a href="https://github.com/naver/croco">code</a> are in the same repository, and the DUSt3R encoder is initialized from this pre-training.</li>
<li>S. Wang et al., <a href="https://github.com/naver/dust3r">DUSt3R: Geometric 3D Vision Made Easy</a>, CVPR 2024. Pointmap regression from an image pair, without known intrinsics.</li>
<li>V. Leroy, Y. Cabon and J. Revaud, <a href="https://arxiv.org/abs/2406.09756">Grounding Image Matching in 3D with MASt3R</a>, ECCV 2024. Dense matching on top of DUSt3R, with <a href="https://github.com/naver/mast3r">code</a>.</li>
<li>J. Wang et al., <a href="https://arxiv.org/abs/2503.11651">VGGT: Visual Geometry Grounded Transformer</a>, CVPR 2025. Cameras, depth and point tracks from one forward pass, with <a href="https://github.com/facebookresearch/vggt">code</a>.</li>
<li>J. Wang et al., <a href="https://arxiv.org/abs/2605.15195">VGGT-Omega</a>, CVPR 2026. Scaled up training for static and dynamic scenes, <a href="https://vggt-omega.github.io/">project page</a>.</li>
<li><a href="https://arxiv.org/abs/2512.08924">Efficiently Reconstructing Dynamic Scenes One D4RT at a Time</a>, CVPR 2026. Video encoded once into a latent scene, then queried for depth, tracks and camera parameters, <a href="https://d4rt-paper.github.io/">project page</a>.</li>
</ul>

### Software

<ul class="refs" markdown="1">
<li><a href="http://ceres-solver.org/nnls_tutorial.html">Ceres Solver</a> for nonlinear least squares, pose graphs and bundle adjustment.</li>
<li><a href="https://github.com/RainerKuemmerle/g2o">g2o</a> as an alternative graph optimization backend.</li>
<li><a href="https://www.open3d.org/docs/release/tutorial/pipelines/icp_registration.html">Open3D</a> for point cloud IO, registration and visualization.</li>
<li><a href="https://docs.opencv.org/4.x/dc/dbb/tutorial_py_calibration.html">OpenCV</a> for calibration, feature matching and stereo.</li>
<li><a href="https://octomap.github.io/">OctoMap</a> for octree occupancy maps.</li>
</ul>

### Datasets

<ul class="refs" markdown="1">
<li><a href="https://www.cvlibs.net/datasets/kitti/">KITTI</a> for LIDAR, stereo and odometry ground truth. The <a href="https://www.cvlibs.net/datasets/kitti/eval_odometry.php">odometry benchmark</a> is the usual target for project evaluation.</li>
</ul>
