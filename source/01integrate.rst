Integrate the SDK
=================

Install via Gradle
^^^^^^^^^^^^^^^^^^

The Android SDK can be installed via Gradle.

You'll need to modify the **build.gradle** file under your **/app** folder to add the SDK:

.. code-block:: shell

    dependencies {
        compile 'kws.superawesome.tv:kwssdk:<sdk_version_kws_android>'
    }

You'll also want to add `Google Play Services CGM <https://developers.google.com/android/guides/setup>`_ to your app.

Install from jar archive
^^^^^^^^^^^^^^^^^^^^^^^^

You'll need to download the `kwssdk-<sdk_version_kws_android>.jar<>`_ file and add it to your project's **libs** folder.


Import
^^^^^^

To import the relevant SDK header:

.. code-block:: java

    import kws.superawesome.tv.*;
