Overview
========

Architecture
^^^^^^^^^^^^

The SDK itself is a singleton whose accessor method is called **sdk**.

Thus all calls to the SDK will have to following general signature:

.. code-block:: java

    KWS.sdk.someFunction();

General overview of the process
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In order to allow for the best user experience and COPPA compliance, the SDK has split the process of registering a
user's device for Remote Notifications into two distinct steps:

 * Step 1: Find out if the user is allowed remote notifications; this is done by calling the **checkIfNotificationsAreAllowed** function
 * Step 2: Assuming Step 1 is positive, actually registering for remote notifications, via the **registerForRemoteNotifications** function
