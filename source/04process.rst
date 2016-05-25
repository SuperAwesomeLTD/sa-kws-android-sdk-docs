Process
=======

To check if remote notifications are allowed for the current user, you will need to call:

.. code-block:: java

    KWS.sdk.checkIfNotificationsAreAllowed();

This will look at a number of conditions in order to determine if remote notifications are enabled:

* has the user ever asked for remote notification permissions on his device?
* is the user allowed by his parent (in KWS) to receive remote notifications?
* does the user have a valid parent email (in KWS)?

If the process goes OK, the following function will get called:

.. code-block:: java

    @Override
    public void isAllowedToRegisterForRemoteNotifications() {
        // continue
    }

In this function you'll need to then call the second SDK function:

.. code-block:: java

    @Override
    public void isAllowedToRegisterForRemoteNotifications() {
        KWS.sdk.registerForRemoteNotifications();
    }

After this step is through, remote notification will be enabled.
