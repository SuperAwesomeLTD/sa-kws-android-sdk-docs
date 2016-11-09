Add the SDK through Gradle
==========================

The simplest way of installing the Kids Web Services SDK in Android Studio is to download the AAR library through Gradle.

The first step is to include the following Maven repository in your module's **build.gradle** file (usually the file under MyApplication/app/):

.. code-block:: shell

    repositories {
        maven {
          url  'http://dl.bintray.com/gabrielcoman/maven'
        }
    }

Next you need to add the full Kids Web Services Android SDK as a dependency.

.. code-block:: shell

    dependencies {
      compile 'kws.superawesome.tv.kwssdk:kwssdk:<sdk_version>'
    }

Once you've integrated the Kids Web Services SDK, you can access all functionality by including:

.. code-block:: java

    import kws.superawesome.tv.kwssdk.*;
