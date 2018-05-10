Add the SDK through Gradle
==========================

The simplest way of installing the Kids Web Services SDK in Android Studio is to download the AAR library through Gradle.

The first step is to include the following Maven repository in your module's **build.gradle** file (usually the file under MyApplication/app/):

.. code-block:: shell

    repositories {
        maven {
          url  'http://dl.bintray.com/superawesome/SuperAwesomeSDK'
        }
    }

Next you need to add the full Kids Web Services Android SDK as a dependency.

.. code-block:: shell

    dependencies {
      compile 'kws.superawesome.tv.kwssdk:kwssdk:<sdk_version>'
    }

Your project will require **Kotlin** to be added. This can be accomplised by following these steps:

- Setup the **Kotlin** plugin 

	*Android Studio -> Preferences… -> Plugins -> Browse Repository -> search for “Kotlin” in search box -> Install*

- Define **Kotlin version** and add the classpath in **Build.Gradle**.

.. code-block:: shell
	
	buildscript {
	    ext.kotlin_version = "1.2.40"
	    //...
	    dependencies {
	       	//...
		classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
		classpath "org.jetbrains.kotlin:kotlin-android-extensions:$kotlin_version"

		// NOTE: Do not place your application dependencies here; they belong
		// in the individual module build.gradle files
	    }
	}


- Finally, **apply plugin** and add the dependency in **Build.gradle**.

.. code-block:: shell
	
	//...
	apply plugin: 'kotlin-android'
	apply plugin: 'kotlin-android-extensions'

	android {
	    // ... 
	}

	dependencies {
	   //...
	   compile "org.jetbrains.kotlin:kotlin-stdlib:$kotlin_version"
	}

Once you've integrated the Kids Web Services SDK, you can access all functionality by including:

.. code-block:: java

    import kws.superawesome.tv.kwssdk.*;
