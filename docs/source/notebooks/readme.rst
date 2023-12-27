Radiant Compiler
================

To compile Python applications into Android packages (APKs), you’ll need
to have the necessary development environment set up on your machine.
One way to do this is to pull the image with the environment for
`python-for-android <https://python-for-android.readthedocs.io/en/latest/>`__,
which includes the `Android
NDK <https://developer.android.com/studio/projects/install-ndk>`__ and
the `SDK <https://developer.android.com/studio>`__ needed for
compilation. Once you have this environment set up, you can use Radiant
Compiler, a Python module that allows you to compile Python projects
into APKs. Radiant Compiler comes with a powerful tool called p4a
(Python for Android), which provides a lot of control over the build
process, allowing you to specify the architecture and other options for
the APK file. With these tools, you can easily compile your Python
applications into APKs that can be installed on Android devices.

Getting Started
---------------

To use Radiant Compiler, you’ll need to install it and set up a Docker
container with the necessary dependencies. Here’s how to get started:

1. Install Radiant Compiler with pip:

.. code:: python

   pip install radiant-compiler

2. Pull the Docker container:

.. code:: bash

   docker pull dunderlab/radiant_p4a:latest

3. Use the ``radiant_p4a`` command to run p4a inside the container:

.. code:: bash

   radiant_p4a apk --arch arm64-v8a

Software versions included in the image
---------------------------------------

.. code:: bash

   NDK_VERSION=r26b 
   SDK_VERSION=10406996_latest 
   JAVA_VERSION=jdk17-openjdk 
   NDKAPI=30 
   ANDROIDAPI=30 
   BUILDTOOL='34.0.0'

This is the default configuration for Radiant Compiler, specifying the
versions of various tools and APIs used in the build process. The
``NDK_VERSION`` is ``r26b``, the Android NDK version for compilation.
The ``SDK_VERSION`` is ``10406996_latest``, the Android SDK version for
APK file building. The ``JAVA_VERSION`` remains ``jdk17-openjdk``, the
Java version for compiling Python code. Both ``NDKAPI`` and
``ANDROIDAPI`` are set to ``30``, the Android API versions for NDK
compilation and APK building, respectively. Lastly, the ``BUILDTOOL``
version is ``34.0.0``, indicating the build tool version for the APK
file.

Usage
-----

It is possible to use ``radiant_p4a`` to configure two types of
projects: `Django <01.django.ipynb>`__ and
`Brython <01.brython.ipynb>`__.
