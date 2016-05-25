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

You'll need to download the `kwssdk-<sdk_version_kws_android>.jar <https://github.com/SuperAwesomeLTD/sa-kws-android-sdk-docs/blob/master/source/res/kwssdk-<sdk_version_kws_android>.jar?raw=true>`_ file and add it to your project's **libs** folder.
The in your Android Studio project you'll need to add it as a library / dependency to your current project.

Finally, you'll need to update your **AndroidManifest.xml** file to add some services to the application:

.. code-block:: xml

    <application android:allowBackup="true"
        android:label="@string/app_name"
        android:supportsRtl="true">

        <!-- rest of your manifest file -->

        <service android:name="kws.superawesome.tv.kwslib.SAAsyncTask$SAAsync"
                 android:exported="false"/>
        <service android:name=".push.KWSRegistrationService$KWSRegistrationIntentService"
                 android:exported="false"/>
        <service android:name=".push.KWSIdListenerService"
                 android:exported="false">
            <intent-filter>
                <action android:name="com.google.android.gms.iid.InstanceID"/>
            </intent-filter>
        </service>

    </application>

Prerequisites
^^^^^^^^^^^^^

Finally, you'll need to add the following permissions to your **AndroidManifest.xml** file, no matter the way you chose to install the app:

.. code-block:: xml

    <uses-permission android:name="com.google.android.c2dm.permission.RECEIVE" />
    <uses-permission android:name="android.permission.INTERNET" />

Import
^^^^^^

To import the relevant SDK header:

.. code-block:: java

    import kws.superawesome.tv.*;
