# ORB-SLAM3

This repository is a specialized fork of [ORB_SLAM3](https://github.com/UZ-SLAMLab/ORB_SLAM3), maintained by the **VORIS Project** at **LabMetro - UFSC**. It features critical fixes for modern Ubuntu distributions.

---

## Key Enhancements

* **Full ROS 2 Compatibility**: Tested and validated on **Ubuntu 22.04 (Humble)** and **Ubuntu 24.04 (Jazzy)**.
* **Modern C++ Standard**: Upgraded to **C++14** to ensure seamless integration with modern middleware and ROS 2 headers.
* **Stereo Rectification Fix**: Resolved a known crash in the original repository when initializing **STEREO** mode with the **Rectified** camera type.
* **Streamlined Build System**: All dependencies, including **DBoW2** and **g2o**, are handled directly within the integrated build scripts.

---

## Build Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/Projeto-Voris/ORB-SLAM3.git ORB_SLAM3

```

### 2. Full Installation

The `build.sh` script is configured to compile the third-party libraries and the core ORB-SLAM3 library in one go.

```bash
cd ORB_SLAM3
chmod +x build.sh
./build.sh

```

### 3. Verification

After the script finishes:

* The shared library **`libORB_SLAM3.so`** will be in the `lib/` directory.
* Standalone examples (Monocular, Stereo, etc.) will be available in the `Examples/` directory.

---

## Integration with VORIS ROS 2 Wrapper

This fork is designed to work out-of-the-box with our [ORB_SLAM3_ROS2](https://github.com/Projeto-Voris/ORB_SLAM3_ROS2) wrapper.

When building the ROS 2 wrapper, ensure the `ORB_SLAM3_ROOT_DIR` points to this directory so the compiler can locate the `libORB_SLAM3.so` and the associated headers.

### Common Setup Step

If you encounter header visibility issues during the wrapper build, you may need to manually install the Sophus headers compiled by the script:

```bash
cd Thirdparty/Sophus/build
sudo make install

```

---

## Project Context

This library is a core component of the **VORIS** (Veículo Operado Remotamente para Inspeção Submarina) system. It provides the high-fidelity visual odometry required for autonomous underwater inspection of oil and gas infrastructure.

## Viewer

The optional viewer displays camera frames using OpenCV. The 3D map viewer and
legacy ROS MonoAR demo have been removed. Pass `false` for `bUseViewer` when
constructing `ORB_SLAM3::System` to run without viewer windows. Localization mode,
reset, step-by-step tracking, and trajectory export remain available through the
`System` and `Tracking` APIs.
